#!/bin/bash
# start.sh
adb connect "$DEVICE_HOST"
/usr/local/bin/node dist/index.js
