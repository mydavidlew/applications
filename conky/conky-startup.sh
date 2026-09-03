# No widgets enabled!
name => Conky Sensor
comment => Conky Monitoring
cmdline => $sudo apt install conky-all
cmdline => $conky --daemonize --pause=5 --config=/etc/conky/conky.conf
exit 0
