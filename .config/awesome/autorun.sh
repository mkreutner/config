#!/usr/bin/env bash

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}

#if xrandr | grep -q 'HDMI-1 connected' ; then
#    xrandr --output HDMI-1 --pos 1920x0 --mode 1920x1080 --rate 60
#fi
if xrandr | grep -q 'DP-0 connected' ; then
    xrandr --output DP-0 --mode 5120x1440
fi

#if [ -f ~/.Xresources ] ; then
#    echo 'load .Xresources'
#    xrdb -load ~/.Xresources
#fi

setxkbmap us,us_intl '' compose:rwin grp:rctrl_rshift_toggle

