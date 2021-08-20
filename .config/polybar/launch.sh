#!/bin/bash
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q -c ~/.config/polybar/config applications -r &
# polybar -q -c ~/.config/polybar/config system1 -r &
# polybar -q -c ~/.config/polybar/config system2 -r &
# polybar -q -c ~/.config/polybar/config taskbar -r &
# polybar -q -c ~/.config/polybar/config workspaces -r &

polybar -q -c ~/.config/polybar/config main -r &
