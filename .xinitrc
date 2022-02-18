#!/bin/sh

#    ___________      __.___  _________ _________   _____      _____    _______    _______     # 
#   /   _____/  \    /  \   |/   _____//   _____/  /     \    /  _  \   \      \   \      \    # 
#   \_____  \\   \/\/   /   |\_____  \ \_____  \  /  \ /  \  /  /_\  \  /   |   \  /   |   \   # 
#   /        \\        /|   |/        \/        \/    Y    \/    |    \/    |    \/    |    \  # 
#  /_______  / \__/\  / |___/_______  /_______  /\____|__  /\____|__  /\____|__  /\____|__  /  # 
#          \/       \/              \/        \/         \/         \/         \/         \/   # 
#                                                                                              # 
#  ##########################################################################################  # 



userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


## Set Keyboard to german ##
setxkbmap de &

## Activate numblock on start of X ##
numlockx on &

## Start SLStatus Bar ##
slstatus &

## Start Picom Compositor with Blur ##
picom -f -experimental-backends --backend glx &


## Set Monitor Settings to 2560x1440 and 144Hz ##
xrandr --output DP-4 --mode 2560x1440 --rate 144 &

## Set Wallpaper Background on Desktop ##
feh --bg-scale /home/vale/Pictures/Wallpaper/Wallpaper.jpg &

## Autostart Discord ##
##discord & ##

## DWM Restart Loop ##
while true; do
	dwm >/dev/null 2>&1
done

## Starting DWM ##
exec dwm

