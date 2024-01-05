/* application.vala
 *
 * Copyright 2024 Developer
 *
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
