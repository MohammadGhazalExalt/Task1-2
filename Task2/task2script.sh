#!/bin/bash
echo -e "`df | grep "sda1" | awk '{ print $3 "\t" $4 }'`\t`date -u`" >> /home/diskstats
echo "<tr><th>`df | grep "sda1" | awk '{ print $3 "</th><th>" $4 }'`</th><th>`date -u`</th></tr>" >> /var/www/html/disk.html
echo "<p>Average = `cat diskAvgs | awk 'NR==1{print; print "new line"} NR!=1'`</p>"
echo -e "`free | grep "Mem" | awk '{ print $3 "\t" $4 }'`\t`date -u`" >> /home/memstats
echo "<tr><th>`free | grep "Mem" | awk '{ print $3 "</th><th>" $4 }'`</th><th>`date -u`</th></tr>" >> /var/www/html/memory.html
echo -e "`mpstat | grep "all" | awk '{ print $13 }'`\t`date -u`" >> /home/cpustats
echo "<tr><th>`mpstat | grep "all" | awk '{ print $13 }'`</th><th>`date -u`</th></tr>" >> /var/www/html/cpu.html
