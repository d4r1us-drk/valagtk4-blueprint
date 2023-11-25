#!/usr/bin/env bash
set -xe

## Relpace these
# ----------------- variables ------------------

PROJECT_NAME="Example"
PROJECT_ID="org.gnome.$PROJECT_NAME"
RESOURCE_PATH="/org/gnome/$PROJECT_NAME"
NAMESPACE="Example"
CNAME="Example"
AUTHOR="Developer"

# -------------------- code --------------------

# remove files that might conflict
rm -rf build/ subprojects/blueprint-compiler/

# rename files
mv ./{org.gnome.Example,$PROJECT_ID}.json
mv ./data/{org.gnome.Example,$PROJECT_ID}.metainfo.xml.in
mv ./data/{org.gnome.Example,$PROJECT_ID}.desktop.in
mv ./data/{org.gnome.Example,$PROJECT_ID}.gschema.xml
mv ./data/icons/hicolor/scalable/apps/{org.gnome.Example,$PROJECT_ID}.svg
mv ./data/icons/hicolor/symbolic/apps/{org.gnome.Example,$PROJECT_ID}-symbolic.svg
mv ./src/{Example,$PROJECT_NAME}.gresource.xml

# replace text in files
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=/org/gnome/Example=$RESOURCE_PATH=g" {} \;
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=org.gnome.Example=$PROJECT_ID=g" {} \;
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=Example=$PROJECT_NAME=g" {} \;
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=Example=$CNAME=g" {} \;
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=Example=$NAMESPACE=g" {} \;
find . -type f -name '*' -not -path './.git/*' -exec sed -i -e "s=Developer=$AUTHOR=g" {} \;
