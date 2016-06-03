#!/usr/bin/env python3

import subprocess
from i3pystatus import Status
status = Status(standalone=True)

COLOR_BLUE    = "#64b3d2"
COLOR_YELLOW  = "#fda331"
COLOR_RED     = "#fb0120"
COLOR_GREEN   = "#a1c659"

# {{{ CLOCK
status.register("clock",
    format="%a %-d %b %T",
    color=COLOR_BLUE)

# }}}

# {{{ RESOURCES
status.register("mem",
    format="mem {percent_used_mem:.0f}%",
    color=COLOR_GREEN,
    warn_color=COLOR_YELLOW,
    alert_color=COLOR_RED)

status.register("load",
    format="cpu {avg1}",
    color=COLOR_GREEN,
    critical_color=COLOR_RED)

status.register("temp",
    format="temp {temp:.0f}°C",
    color=COLOR_GREEN,
    alert_temp=60,
    alert_color=COLOR_RED)
# }}}

# {{{ BATTERY
status.register("battery",
    format="bat {status}/{percentage_design:.0f}% {remaining:%E%h:%M}",
    battery_ident="BAT1",
    alert=True,
    alert_percentage=15,
    not_present_text="",
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },
    full_color=COLOR_GREEN,
    charging_color=COLOR_BLUE,
    critical_color=COLOR_RED,
    color=COLOR_YELLOW)
# }}}

# {{{ NETWORK INTERFACES
for i in ["wlan0", "usb0", "eth0", "eth1"]:
    status.register("network",
        interface=i,
        format_up="{interface} {v4cidr}",
        color_up=COLOR_GREEN,
        format_down="")

# }}}

# {{{ WIFI
status.register("network",
    interface="wlan0",
    format_up="{essid} {quality}%",
    color_up=COLOR_BLUE,
    format_down="")
# }}}

# {{{ DISK USAGE
status.register("disk",
    path="/",
    color=COLOR_YELLOW,
    format="{avail}G",)
# }}}

# {{{ AUDIO
status.register("pulseaudio",
    format="♪{volume}",
    color_unmuted=COLOR_GREEN,
    color_muted=COLOR_RED)

status.register("mpd",
    color=COLOR_YELLOW)
# }}}

status.run()
