xrdb ~/.Xresources
TERMINAL=terminator

# source ~/.xprofile~
[ -f ~/.xprofile ] && . ~/.xprofile

# i3 config
xrandr --dpi 220
exec dbus-launch --sh-syntax i3

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
# xfce4
#exec ck-launch-session  startxfce4
#exec startxfce4
# gnome
#exec gnome-session
