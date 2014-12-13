#!/usr/bin/env python3

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
    format="%a %-d %b %X",
    color="#6fb3d2")

status.register("mem",
    color="#fda331",
    warn_color="#fda331",
    alert_color="#fb0120",
    format="mem {percent_used_mem:.0f}%")

status.register("load",
    format="cpu {avg1} {avg5}",
    color="#a1c659",
    critical_color="#fb0120")

status.register("battery",
    format="{status}/{percentage_design:.0f}% {consumption:.2f}W {remaining:%E%hh:%Mm}",
    battery_ident="BAT1",
    alert=True,
    alert_percentage=5,
    not_present_text="",
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

status.register("network_traffic",
    interface="usb0",
    hide_down=True,
    format="u{bytes_sent:3.0f} d{bytes_recv:3.0f}",)

status.register("network_traffic",
    interface="eth1",
    hide_down=True,
    format="u{bytes_sent:3.0f} d{bytes_recv:3.0f}",)

status.register("network",
    interface="usb0",
    format_up="{interface} {v4}",
    format_down="",
    color_up="#a1c659",
    unknown_up=True)

status.register("network",
    interface="eth1",
    format_up="{interface} {v4}",
    format_down="",
    color_up="#a1c659",
    unknown_up=True)

status.register("wireless",
    interface="wlan0",
    format_down="",
    format_up="{essid} {quality:03.0f}%",)

status.register("bitcoin",
    color="#be643c",
    format="btc {last_price:.0f}")

status.register("disk",
    path="/",
    color="#76c7b7",
    format="{avail}G",)

status.register("pulseaudio",
    format="♪{volume}",
    color_unmuted="#a1c659",
    color_muted="#fb0120")

status.register("now_playing",
    color="#fda331")

status.run()
