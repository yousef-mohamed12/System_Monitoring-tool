#!/usr/bin/env bash

total=$(df | awk '/\/dev\/sda2/ {print $2}')
total_up=$(awk -v total1=$total 'BEGIN {
print (total1 / 1048576)
}')


avail=$(df | awk '/\/dev\/sda2/ {print $4}')
avail_up=$(awk -v avail1=$avail 'BEGIN {
print (avail1 / 1048576)
}')

usage=$(awk -v avail1=$avail_up -v total1=$total_up 'BEGIN{
print ((total1 -avail1)/total1) * 100 


}')


echo  $usage
