if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting

    # Aliases
    alias fastBtw="fastfetch --logo ~/pics/archLogo.png --logo-type kitty"
    
    # to install if i need  alias soundSettings="GDK_BACKEND=x11 easyeffects"

    alias sound="GDK_BACKEND=x11 pavucontrol"
    alias record='wf-recorder -f /tmp/tmp.mkv && ffmpeg -y -i /tmp/tmp.mkv -c:v libx264 ~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4 && rm /tmp/tmp.mkv'
    alias f="fastfetch"
    alias fishreload="source ~/.config/fish/config.fish"
    alias clock="tty-clock -c -C7 -s"
    # alias update="sudo pacman -Syu"
    alias cls="clear"
    alias ll="ls -lh --color=auto"
    

    # Поднять Warp
    alias warp-up="sudo wg-quick up ~/wgcf-profile.conf"

    # Опустить Warp
    alias warp-down="sudo wg-quick down ~/wgcf-profile.conf"

    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias home="cd ~"
    alias docs="cd ~/documents"
    alias dl="cd ~/downloads"

    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gp="git push"

    alias please="sudo"
    alias lelouch_britanskiy_povelevayet="sudo"
    alias pls="sudo"
    # fastfetch
    fastfetch 
end
    # fastfetch --logo /home/maksym/pictures/ff-logo.png --logo-type kitty-direct --logo-width 20 --logo-height 10
