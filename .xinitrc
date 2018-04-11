#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set desktop background
xsetroot -solid "#333333"

# turn off caps
setxkbmap -option caps:escape

# add keyboard layouts
setxkbmap -layout 'us,rs(latinyz)'
setxkbmap -option 'grp:ctrl_alt_toggle'

#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

# apply color profile
dispwin -d 1 ~/Downloads/dell_u2412m_custom.icc                                                                                                                                                                                                                                                            ⏎ master ✱ ◼
dispwin -d 2 ~/Downloads/dell_u2412m_custom.icc

exec i3
#exec cinnamon
