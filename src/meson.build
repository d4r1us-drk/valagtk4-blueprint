Example_sources = [
    'main.vala',
    'application.vala',
    'window.vala',
]

Example_deps = [
    dependency ('gtk4'),
    dependency ('libadwaita-1', version: '>= 1.4'),
]

Example_blueprints = custom_target ('blueprints',
    input: run_command('find', '.', '-name', '*.blp').stdout().strip().split('\n'),
    output: '.',
    command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

Example_sources += gnome.compile_resources ('Example-resources',
    'Example.gresource.xml',
    c_name: 'Example',
    dependencies: Example_blueprints,
)

executable('Example', Example_sources,
    vala_args: [
        '--target-glib=2.50',
        '--gresourcesdir=src/',
    ],
    dependencies: Example_deps,
    install: true,
)
