#!/bin/bash
SCSS="$HOME/.local/state/quickshell/user/generated/material_colors.scss"
OUT="$HOME/.config/waybar/theme.css"

get() { grep "^\$$1:" "$SCSS" | cut -d: -f2 | tr -d ' ;'; }

cat > "$OUT" << CSS
/* Generated from material_colors.scss */
@define-color border-main alpha($(get primary), 0.35);
@define-color border-alt alpha($(get primary), 0.55);
@define-color bg-main alpha($(get surfaceContainerLow), 0.88);
@define-color bg-alt $(get primary);
@define-color bg-hover alpha($(get surfaceContainerHigh), 0.92);
@define-color bg-hover-alt alpha($(get surfaceVariant), 0.8);
@define-color bg-tooltip alpha($(get surfaceContainer), 0.98);
@define-color bg-second alpha($(get surfaceContainer), 0.88);
@define-color bg-third alpha($(get surfaceContainerHigh), 0.7);
@define-color bg-third2 alpha($(get surfaceContainerHighest), 0.45);
@define-color sway-bg alpha($(get surfaceContainerLow), 0.88);
@define-color fg-main $(get onSurface);
@define-color fg-unactive $(get outline);
@define-color content-act $(get onSurfaceVariant);
@define-color ply-main alpha($(get surfaceContainer), 0.9);
@define-color ply-hover alpha($(get surfaceContainerHigh), 0.9);
@define-color ply-act alpha($(get primary), 0.2);
@define-color msc-act alpha($(get primary), 0.3);
@define-color wlogout-hover alpha($(get primary), 0.2);
@define-color wlogout-bg alpha($(get surfaceContainerLow), 0.85);
@define-color wlogout-button alpha($(get primary), 0.5);
@define-color warning_color $(get tertiary);
CSS

pkill -USR2 waybar
echo "Waybar theme updated!"
