#!/bin/sh

# Source Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set variables
xset +fp ~/.fonts
xset fp rehash

# Add scripts to path
pathdirs=(
    ~/scripts
    ~/scripts/bspwm
)
for dir in $pathdirs; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done

# Environment variables
export EDITOR="vim"
export XDG_CONFIG_HOME="/home/pirro/.config"
# bspwm panel
export PANEL_FIFO="/tmp/panel-fifo"

#################
# Start programs #
##################
compton &
redshift &> /dev/null &
#hsetroot -tile ~/Documents/wallpapers/tinytile.png &
nitrogen --restore &
urxvt &

#############
# Run bspwm #
#############
sxhkd &
exec bspwm

##################
# Close programs #
##################
killall compton
killall redshift
