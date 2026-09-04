[[[Configure XFCE for XRDP]]]

#!/bin/sh
# XRDP session startup script
# in /etc/xrdp/startwm.sh file

# Unset problematic environment variables
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

# Fix color issues in XFCE over RDP
export XDG_CURRENT_DESKTOP=XFCE
export DESKTOP_SESSION=xfce

# Start XFCE
test -x /etc/X11/Xsession && exec /etc/X11/Xsession
exec /bin/sh /etc/X11/Xsession


[[[Configure GNOME for XRDP]]]

#!/bin/sh
# XRDP session startup script
# in /etc/xrdp/startwm.sh file

unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
export XDG_SESSION_TYPE=x11

exec /usr/lib/gnome-session/gnome-session-binary --session=ubuntu


Finally,
--> sudo chmod +x /etc/xrdp/startwm.sh
