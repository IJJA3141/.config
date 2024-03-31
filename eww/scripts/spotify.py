#!/usr/bin/env python3

import gi

gi.require_version("Playerctl", "2.0")

from gi.repository import Playerctl, GLib


manager = Playerctl.PlayerManager()


def on_metadata(player, metadata, manager):
    keys = metadata.keys()
    if "xesam:artist" in keys and "xesam:title" in keys:
        print(
            f"""(box :space-evenly false (label :text '│' :class 'spacer')(icon_text :icon ' ' :text '{metadata['xesam:artist'][0]} ー {metadata['xesam:title']}'))""",
            flush=True,
        )

    return


def init_player(name):
    if name.name == "spotify":
        player = Playerctl.Player.new_from_name(name)
        player.connect("metadata", on_metadata, manager)
        manager.manage_player(player)

    return


def on_name_appeared(manager, name):
    init_player(name)

    return


def on_player_vanished(manager, player):
    print("", flush=True)

    return


manager.connect("name-appeared", on_name_appeared)
manager.connect("player-vanished", on_player_vanished)

for name in manager.props.player_names:
    init_player(name)

main = GLib.MainLoop()
main.run()
