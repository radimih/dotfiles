#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #  Managed by Ansible                                                     # #
# #  DO NOT EDIT THIS FILE MANUALLY                                         # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

PIDFILE=/tmp/on-locking-desktop.pid

cleanup() {
    rm -f $PIDFILE
    trap - INT TERM EXIT
    exit
}

if [ -e "$PIDFILE" ]; then
    echo Already running...
    exit
fi
echo $$ > $PIDFILE

trap cleanup INT TERM EXIT

gdbus monitor --system --dest org.freedesktop.login1 |
    while read -r line; do
        if echo $line | grep "{'LockedHint': <true>}" &> /dev/null; then
            # Switch to English keyboard layout
            {{ switch_commands.en }}
        fi
    done

cleanup
