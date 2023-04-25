#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar workspaces 2>&1 | tee -a /tmp/polybar-workspaces.log & disown
polybar wifi 2>&1 | tee -a /tmp/polybar-wifi.log & disown
polybar datetime 2>&1 | tee -a /tmp/polybar-datetime.log & disown
polybar usage 2>&1 | tee -a /tmp/polybar-usage.log & disown
polybar controls 2>&1 | tee -a /tmp/polybar-controls.log & disown
polybar battery 2>&1 | tee -a /tmp/polybar-battery.log & disown
# polybar updates 2>&1 | tee -a /tmp/polybar-updates.log & disown

echo "Polybar launched..."
