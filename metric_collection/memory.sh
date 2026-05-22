#!/usr/bin/env bash

total_mem=$(cat /proc/meminfo | awk '/MemTotal:/ {print $2}')
mem_free=$(cat /proc/meminfo | awk '/MemFree:/ {print $2}')
buffer=$(cat /proc/meminfo | awk '/Buffers:/ {print $2}')
cached=$(cat /proc/meminfo | awk '/Cached:/ {print $2}')

# actual_used_memory=$(($total_mem-$mem_free-$buffer-$cached))

memory_usage=$(awk -v t=$total_mem -v f=$mem_free -v b=$buffer -v c=$cache 'BEGIN{
print ((t-f-b-c)/t)*100
}')

echo  $memory_usage 

