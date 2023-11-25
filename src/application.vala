/* application.vala
 *
 * Copyright 2023 Clay M. Gomera Arias
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Example {
    public class Application : Adw.Application {
        public Application () {
            Object (
                application_id: "org.gnome.Example",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit },
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", { "<primary>q" });
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window ?? new Example.Window (this);
            win.present ();
        }

        private void on_about_action () {
            string[] developers = { "Developer" };
            var about = new Adw.AboutWindow () {
                transient_for = this.active_window,
                application_name = "Example",
                application_icon = "org.gnome.Example",
                developer_name = "Developer",
                version = "0.1.0",
                developers = developers,
                copyright = "© 2023 Developer",
            };

            about.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
