#!/bin/sh

userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

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
#exec cinnamon
exec i3
