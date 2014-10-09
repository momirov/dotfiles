#!/bin/bash
#exec cinnamon-session
xrdb -merge ~/.Xresources

# enable multiple workspaces
xrandr --output DVI-0 --auto --left-of DVI-1

# set desktop background
xsetroot -solid "#333333"

# turn off caps
setxkbmap -option ctrl:nocaps

# add keyboard layouts
setxkbmap -layout 'us,rs(latinyz)'
setxkbmap -option 'grp:ctrl_alt_toggle'

#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &
/usr/bin/xcalib -d :0 /usr/share/color/icc/dell_u2412m_user5.icm
/usr/bin/xcalib -d :1 /usr/share/color/icc/dell_u2412m_user5.icm
exec i3
