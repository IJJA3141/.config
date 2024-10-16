#!/bin/python

import gi

gi.require_version("Gtk", "3.0")
gi.require_version("GdkPixbuf", "2.0")
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GdkPixbuf, GLib
import dbus.service
import threading
import shutil
import dbus
import time
import os


def save_img_byte(px_args, save_path):
    GdkPixbuf.Pixbuf.new_from_bytes(
        width=px_args[0],
        height=px_args[1],
        has_alpha=px_args[3],
        data=GLib.Bytes(px_args[6]),
        colorspace=GdkPixbuf.Colorspace.RGB,
        rowstride=px_args[2],
        bits_per_sample=px_args[4],
    ).savev(save_path, "png")

    return


def wait(notification_server, timeout, notification_id):
    time.sleep(timeout / 1000)
    notification_server.remove_notification(notification_id, 1)

    return


class Notification:
    def __init__(self, app_name, app_icon, summary, body):
        self.app_name = app_name
        self.app_icon = app_icon
        self.summary = summary
        self.body = body


class NotificationServer(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName(
            "org.freedesktop.Notifications", bus=dbus.SessionBus()
        )
        dbus.service.Object.__init__(self, bus_name, "/org/freedesktop/Notifications")

        self.notifications = {}
        self.default_timeout = 10000
        self.id = 0
        self.is_mute = False

        if os.path.exists("/tmp/notification-server"):
            shutil.rmtree("/tmp/notification-server")
        os.mkdir("/tmp/notification-server")

    # Signals
    @dbus.service.signal("org.freedesktop.notifications", signature="uu")
    def NotificationClosed(self, notification_id, reason):
        return

    @dbus.service.signal("org.freedesktop.notifications", signature="us")
    def ActionInvoked(self, notification_id, action_key):
        return

    # Methods that just need to be here
    @dbus.service.method("org.freedesktop.Notifications", in_signature="u")
    def CloseNotification(self, notification_id):
        self.remove_notification(notification_id, 3)
        return

    @dbus.service.method("org.freedesktop.Notifications", out_signature="ssss")
    def GetServerInformation(self):
        return ("Notification Server", "IJJA3141", "1.0", "1.2")

    @dbus.service.method("org.freedesktop.Notifications", out_signature="as")
    def GetCapabilities(self):
        return ("actions", "body", "body-hyprlinks", "icon-static")

    @dbus.service.method(
        "org.freedesktop.Notifications", in_signature="susssasa{sv}i", out_signature="u"
    )
    def Notify(
        self,
        app_name,
        replaces_id,
        app_icon,
        summary,
        body,
        actions,
        hints,
        timeout,
    ):
        if app_name == "toggle-mute":
            self.is_mute = not self.is_mute

            if self.is_mute:
                os.system(
                    "eww update bell_listener=\"(icon :class_name 'red' :icon '')\""
                )
            else:
                os.system("eww update bell_listener=\"(icon :icon '')\"")
            return 0

        if self.is_mute:
            return 0

        if app_name == "rm-msg":
            if replaces_id:
                self.ActionInvoked(replaces_id, "activate")
                self.remove_notification(replaces_id, 2)
            return 0

        if replaces_id != 0:
            self.remove_notification(replaces_id, 1)

        self.id += 1
        self.notifications[self.id] = Notification(app_name, app_icon, summary, body)

        if "image-data" in hints:
            save_img_byte(
                hints["image-data"], f"/tmp/notification-server/{self.id}.png"
            )
            self.notifications[self.id].app_icon = (
                f"/tmp/notification-server/{self.id}.png"
            )

        self.print_state()

        if timeout == -1:
            timer_thread = threading.Thread(
                target=wait, args=(self, self.default_timeout, self.id)
            )
            timer_thread.start()
        elif timeout != 0:
            timer_thread = threading.Thread(target=wait, args=(self, timeout, self.id))
            timer_thread.start()

        return self.id

    def remove_notification(self, notification_id, reason):
        if self.notifications.get(notification_id):
            self.notifications.pop(notification_id)
            self.print_state()
            self.NotificationClosed(notification_id, reason)

        return

    def print_state(self):
        string = ""
        i = 0

        for notification_key in self.notifications:
            if self.notifications[notification_key].app_icon:
                str = self.notifications[notification_key].app_icon
            else:
                str = ""

            string = (
                string
                + f"""(notification :id {notification_key} :app_name '{self.notifications[notification_key].app_name or ''}' :summary "{self.notifications[notification_key].summary or ''}" :body "{self.notifications[notification_key].body or ''}" :icon '{str}' )"""
            )
        if string:
            string = string.replace("\n", "")
            print(
                rf"""(box :class 'notification_box' :orientation 'vertical' :space-evenly false {string or ''})""",
                flush=True,
            )
        else:
            print('""', flush=True)

        return


DBusGMainLoop(set_as_default=True)

if __name__ == "__main__":
    server = NotificationServer()
    mainloop = GLib.MainLoop()
    mainloop.run()
