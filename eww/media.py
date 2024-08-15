#!/bin/python

# icons
# 󰓇󰈹
# 


# should return
# eww update media_number =
# (stack :selected media_index
#   (media
#   (media
#   (media
#   (media
#   ...
# )


import gi
import os

gi.require_version("Playerctl", "2.0")

from gi.repository import Playerctl, GLib


class media:
    active = False
    artist = ""
    state = ""
    title = ""
    icon = ""

    def __init__(self, icon):
        self.icon = icon

    def print(self):
        if self.active:
            return (""" (media :icon " """ + self.icon + """ " :title " """ + self.title + """ " :album " """ + self.artist + """ " :state " """ + self.state + """ ") """)
        else:
            return ""


def on_playback_status(player, playback_status, manager):
    if player.props.player_name == "spotify":
        if playback_status == 0:
            spotify.state = ""
        else:
            spotify.state = ""
    elif player.props.player_name == "firefox":
        if playback_status == 0:
            spotify.state = ""
        else:
            spotify.state = ""

    print("""(stack :selected media_index """ + spotify.print() + firefox.print() + """)""", flush=True)

    return


def on_metadata(player, metadata, manager):
    if player.props.player_name == "spotify":
        spotify.title = metadata["xesam:title"]
        spotify.artist = metadata["xesam:artist"][0]

    elif player.props.player_name == "firefox":
        firefox.title = metadata["xesam:title"]
        firefox.artist = metadata["xesam:artist"][0]

    print("""(stack :selected media_index """ + spotify.print() + firefox.print() + """)""", flush=True)

    return


def init_player(name):
    if name.name == "spotify":
        os.system('eww update "media_number=$(($(eww get media_number) + 1))"')
        spotify.active = True
        player = Playerctl.Player.new_from_name(name)
        player.connect("metadata", on_metadata, manager)
        player.connect("playback_status", on_playback_status, manager)
        manager.manage_player(player)

    elif name.name == "firefox":
        os.system('eww update "media_number=$(($(eww get media_number) + 1))"')
        firefox.active = True
        player = Playerctl.Player.new_from_name(name)
        player.connect("metadata", on_metadata, manager)
        player.connect("playback_status", on_playback_status, manager)
        manager.manage_player(player)

    return


def on_name_appeared(manager, name):
    init_player(name)

    return


def on_player_vanished(manager, player):
    if player.props.player_name == "spotify":
        os.system('eww update "media_number=$(($(eww get media_number) - 1))"')
        spotify.active = False

    elif player.props.player_name == "firefox":
        os.system('eww update "media_number=$(($(eww get media_number) - 1))"')
        firefox.active = False

    return


manager = Playerctl.PlayerManager()
spotify = media("󰓇")
firefox = media("󰈹")

manager.connect("name-appeared", on_name_appeared)
manager.connect("player-vanished", on_player_vanished)

for name in manager.props.player_names:
    init_player(name)

main = GLib.MainLoop()
main.run()
