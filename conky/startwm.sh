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

[A] Black screen after connecting:
# Usually a desktop environment startup issue

# Check session startup script
cat /etc/xrdp/startwm.sh

# Try creating a user-level .xsession file
echo "startxfce4" > ~/.xsession && chmod +x ~/.xsession

# Check for errors in sesman log
sudo tail -50 /var/log/xrdp-sesman.log

[B] Authentication failure / "Your session has ended":

# Check PAM configuration
sudo tail -20 /var/log/auth.log | grep xrdp

# Ensure user is in the tsusers group if TerminalServerUsers is set
groups username

# Verify the user's password works
su - username

# Add the xrdp user to the ssl-cert group (required for TLS)
sudo usermod -aG ssl-cert xrdp
