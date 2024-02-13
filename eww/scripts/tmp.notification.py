#!/bin/pythoh

import dbus
import dbus.service
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GLib
import threading
import time

time.sleep(3)


class Notification:
    def __init__(self, app_name, app_icon, body):
        self.app_name = app_name
        self.app_icon = app_icon
        self.body = body


notifications = []


def remove_object(notif, timeout):
    if timeout == -1:
        timeout = 5
    elif timeout > 120:
        timeout /= 1000

    time.sleep(timeout)
    notifications.remove(notif)
    print_state()


def add_object(notif, timeout):
    notifications.insert(0, notif)
    print_state()
    timer_thread = threading.Thread(
        target=remove_object, args=(notif, timeout))
    timer_thread.start()


def print_state():
    string = ""
    for item in notifications:
        string = (
            string
            + f"""(notification :icon '{item.app_icon or ''}' :name '{item.app_name or ''}' :body '{item.body or ''}')"""
        )
    if string:
        string = string.replace("\n", "")
        print(
            rf"""(box :orientation 'vertical' :class 'notifications-box' {string or ''})""",
            flush=True,
        )
    else:
        print(
            '""',
            flush=True,
        )


class NotificationServer(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName(
            "org.freedesktop.Notifications", bus=dbus.SessionBus()
        )
        dbus.service.Object.__init__(
            self, bus_name, "/org/freedesktop/Notifications")

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
        # add_object(Notification(app_name, app_icon, body), timeout)
        print("name", app_name)
        print("if", replaces_id)
        print("icon", app_icon)
        print("summary", summary)
        print("body", body)
        print("actions", actions)
        print("timeout", timeout)
        return 0

    @dbus.service.method("org.freedesktop.Notifications", in_signature="u")
    def CloseNotification(self, notification_id):
        return

    @dbus.service.method("org.freedesktop.Notifications", out_signature="ssss")
    def GetServerInformation(self):
        return ("Notification Server", "IJJA3141", "1.0", "1.2")

    @dbus.service.signal("org.freedesktop.notifications", signature="uu")
    def NotificationClosed(self, notification_id, reason):
        return

    @dbus.service.signal("org.freedesktop.notifications", signature="us")
    def ActionInvoked(self, notification_id, action_key):
        return


DBusGMainLoop(set_as_default=True)

if __name__ == "__main__":
    server = NotificationServer()
    mainloop = GLib.MainLoop()
    mainloop.run()