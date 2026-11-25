#!/bin/bash
# Author: Gurshabd Singh
echo "===== System Report ====="
echo "Name: <Your Name> | Roll No: <Roll No> | Date: $(date)"
echo "---- CPU ----"
lscpu | grep "Model name"
echo "Cores: $(nproc)"
echo "---- Memory ----"
free -h | awk '/Mem:/ {print "Total: " $2 "  Used: " $3}'
echo "---- Top 3 Processes by CPU ----"
ps aux --sort=-%cpu | head -4
echo "Report generated successfully."
