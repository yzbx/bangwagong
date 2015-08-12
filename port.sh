#

filename="port-ip-monitor.log"
regex="50[0-2][0-9]"  # monitor 60000-60029

date +"[%Y-%m-%d %H:%M:%S]" >> $filename
netstat -anp | egrep $regex | grep -E "tcp.*ESTABLISHED" | awk '{print $4, $5}' | cut -d: -f2 | sort -u >> $filename

