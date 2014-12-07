#!/usr/bin/env python3

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X KW%V",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

status.register("battery",
    format="{status}/{percentage_design:.0f}% {consumption:.2f}W {remaining:%E%hh:%Mm}",
    battery_ident="BAT1",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

status.register("network_traffic",
    interface="usb0",
    hide_down=True,
    format="↗{bytes_sent:3.0f}kB/s ↘{bytes_recv:3.0f}kB/s",)

status.register("network",
    interface="usb0",
    format_up="{v4}",
    unknown_up=True)


# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register("wireless",
    interface="wlan0",
    format_up="{essid} {quality:03.0f}%",)

status.register("bitcoin")

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="{avail}G",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪{volume}",)

status.register("now_playing")

status.run()
