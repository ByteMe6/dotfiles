#!/usr/bin/env bash
# Print visible Wi-Fi networks as a JSON array for the eww wifi window:
# one entry per SSID (strongest AP wins), active network first, then by signal.
nmcli -t -f IN-USE,SIGNAL,SECURITY,SSID dev wifi list 2>/dev/null | python3 -c '
import sys, json, re
nets = {}
for line in sys.stdin:
    parts = re.split(r"(?<!\\):", line.rstrip("\n"), maxsplit=3)
    if len(parts) != 4:
        continue
    inuse, signal, sec, ssid = (p.replace("\\:", ":").replace("\\\\", "\\") for p in parts)
    if not ssid:
        continue
    n = {"ssid": ssid, "signal": int(signal or 0), "secure": sec not in ("", "--"),
         "active": inuse == "*"}
    old = nets.get(ssid)
    if old is None or n["active"] or (not old["active"] and n["signal"] > old["signal"]):
        nets[ssid] = n
icons = ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
out = sorted(nets.values(), key=lambda n: (not n["active"], -n["signal"]))
for n in out:
    n["icon"] = icons[min(n["signal"] // 20, 4)]
print(json.dumps(out, ensure_ascii=False))
'
