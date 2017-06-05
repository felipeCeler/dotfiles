xrdb ~/.Xresources
TERMINAL=terminator
# i3 config
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
# xfce4
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
exec ck-launch-session  startxfce4
