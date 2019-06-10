#!/bin/bash
trap "" SIGINT SIGTERM SIGHUP
Xvfb ${DISPLAY} -screen 0 1024x768x16 &
/bin/sh -c 'fluxbox &'
xterm -T Bash -e /bin/bash -l &
xterm -T Bash -e 'tail -f bootstrap.sh' &
xterm -T Bash -e 'top' &
xterm -T Bash -e 'top' &
xterm -T Bash -e 'top' &
x11vnc -shared -display ${DISPLAY} -forever -rfbport 5903 -passwd 123321