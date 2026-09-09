v=$(printf '%.0f' "$1")
eww update brightness="$v"
pkill -f 'ddcutil setvcp 10' 2>/dev/null
setsid ddcutil setvcp 10 "$v" --noverify >/dev/null 2>&1 &
disown