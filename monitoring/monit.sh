#!/usr/bin/bash



printf "%-15s %-15s %-15s %-15s %-15s\n" "Date" "CPU usage %" "Memory usage" "Disk usage" "top_processes_IDs"


while [ 1 -le 2 ]; do 
	cpu_usage=$(/home/yousef/system_monitorr/metric_collection/cpu.sh)
	memory_usage=$(/home/yousef/system_monitorr/metric_collection/memory.sh)
	disk_usage=$(/home/yousef/system_monitorr/metric_collection/disk.sh)
	top_proc=$(/home/yousef/system_monitorr/metric_collection/top_proc.sh)

	if awk -v cpu="$cpu_usage" 'BEGIN {exit (cpu > 85.0) ? 0 : 1}'; then 
	       echo "This is alert message; CPU usage exceeded 85%" >> logfile
               echo "This is alert message; CPU usage exceeded 85%"
	fi

	current_time=$(date +%X)	
	echo "$current_time	    $cpu_usage%		$memory_usage%		$disk_usage%		$top_proc" >> logfile

        printf "%-15s %-15s %-15s %-15s %-15s\n" "$current_time" "$cpu_usage" "$memory_usage" "$disk_usage" "$top_proc"   
	sleep 3
done

