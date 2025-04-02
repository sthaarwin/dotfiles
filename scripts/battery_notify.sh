#!/bin/bash

LOW_THRESHOLD=30
HIGH_THRESHOLD=90
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ "$BATTERY_LEVEL" -le "$LOW_THRESHOLD" && "$BATTERY_STATUS" == "Discharging" ]]; then
  notify-send "Battery Low" "Charge is at $BATTERY_LEVEL%. Plug in your charger!" -u critical
elif [[ "$BATTERY_LEVEL" -ge "$HIGH_THRESHOLD" && "$BATTERY_STATUS" == "Charging" ]]; then
  notify-send "Battery Full" "Charge is at $BATTERY_LEVEL%. Unplug your charger!" -u normal
fi
