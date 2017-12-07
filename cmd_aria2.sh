#!/bin/sh
### BEGIN INIT INFO
# Provides:          aria2
# Required-Start:    $remote_fs $network
# Required-Stop:     $remote_fs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Aria2 Downloader
### END INIT INFO

case "$1" in
start)
    echo -n "Starting aria2c\n"
    sudo aria2c --conf-path=/etc/aria2/aria2.conf -D
    #sudo -u后面的是你正在使用的用户名，因为我用的pi
;;
stop)
    echo -n "Shutting down aria2c "
    killall aria2c
;;
restart)
    echo -n "Shutting down aria2c  "
    killall aria2c
sleep 3
echo -n "Starting aria2c"
    sudo aria2c --conf-path=/etc/aria2/aria2.conf -D
    #同上面的一样，根据自己的用户名改pi。
;;
*)
    echo 'Usage:' `basename $0` '[option]'
    echo 'Available option:'
    for option in start stop restart
    do
    echo '  -' $option
    done
;;
esac
