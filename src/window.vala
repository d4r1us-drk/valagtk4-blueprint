/* window.vala
 *
 * Copyright 2024 Developer
 *
 */

namespace Example {
    [GtkTemplate (ui = "/org/gnome/Example/ui/window.ui")]
    public class Window : Adw.ApplicationWindow {
        public Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
