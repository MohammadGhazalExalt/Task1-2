#!/bin/bash
echo -e "Used\t`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/diskstats`" > /home/diskAvgs

echo -e "Free\t`awk -F'\t' 'NR > 1 {sum+=$2} END {print sum / (NR - 1)}' /home/diskstats`" >> /home/diskAvgs

cat /var/www/html/disk.html | sed "/<\/table>/i <tr><th>`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/diskstats`<\/th><th>`awk -F'\t' 'NR > 1 {sum+=$2} END {print sum / (NR - 1)}' /home/diskstats`<\/th><th>`date -u`<\/th><\/tr>" > /var/www/html/disk.html

echo -e "Used\t`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/memstats`" > /home/memAvgs

echo -e "Free\t`awk -F'\t' 'NR > 1 {sum+=$2} END {print sum / (NR - 1)}' /home/memstats`" >> /home/memAvgs

cat /var/www/html/memory.html | sed "/<\/table>/i <tr><th>`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/memstats`<\/th><th>`awk -F'\t' 'NR > 1 {sum+=$2} END {print sum / (NR - 1)}' /home/memstats`<\/th><th>`date -u`<\/th><\/tr>" > /var/www/html/memory.html

echo -e "Idle\t`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/cpustats`" > /home/cpuAvgs

cat /var/www/html/cpu.html | sed "/<\/table>/i <tr><th>`awk -F'\t' 'NR > 1 {sum+=$1} END {print sum / (NR - 1)}' /home/cpustats`<\/th><th>`date -u`<\/th><\/tr>" > /var/www/html/cpu.html

