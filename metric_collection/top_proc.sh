#!/usr/bin/env bash


ps aux --sort=-%cpu | head -n 4 | awk 'NR>1 {print $2}' | paste -sd ' ' -
