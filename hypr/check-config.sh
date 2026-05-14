#!/usr/bin/env bash
HYPR="$HOME/.config/hypr"
EXPECTED=(env monitors autostart input keybinds windowrules)
ok()  { echo -e "  \033[32m✓\033[0m  $*"; }
err() { echo -e "  \033[31m✗\033[0m  $*"; }
echo -e "\n\033[1m=== hyprland.conf ===\033[0m"
[[ -f $HYPR/hyprland.conf ]] && ok "hyprland.conf ($(wc -l < "$HYPR/hyprland.conf") lines)" || err "hyprland.conf MISSING"
echo -e "\n\033[1m=== conf.d/ ===\033[0m"
for name in "${EXPECTED[@]}"; do
    f="$HYPR/conf.d/${name}.conf"
    [[ -f $f ]] && ok "${name}.conf ($(wc -l < "$f") lines)" || err "${name}.conf MISSING"
done
echo -e "\n\033[1m=== reload ===\033[0m"
hyprctl reload 2>/dev/null && ok "hyprctl reload OK" || echo "  не в hyprland сесії"
echo
