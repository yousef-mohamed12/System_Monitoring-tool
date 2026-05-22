#!/usr/bin/env bash

# reading the file and extracting the data

total_1=$(cat /proc/stat | awk '/^cpu / {print $2 + $3 + $4 + $5}')
idle_1=$(cat /proc/stat | awk '/^cpu / {print $5}')


sleep 1


total_2=$(cat /proc/stat | awk '/^cpu / {print $2 + $3 + $4 + $5}')
idle_2=$(cat /proc/stat | awk '/^cpu / {print $5}')

total_diff=$(($total_2 - $total_1))
idle_diff=$(($idle_2 - $idle_1))


cpu_usage=$(awk -v idle=$idle_diff -v total=$total_diff 'BEGIN {
diff=1 - ( idle / total)
abs_diff = (diff < 0) ? -diff : diff
print abs_diff * 100
}')


echo $cpu_usage
