#!/bin/bash

rm -f /tmp/cpufreq.txt
rm -f /tmp/cpu_temperature.txt

for j in $(seq $(grep -c processor /proc/cpuinfo))
do
    dd if=/dev/zero of=/dev/null bs=1 &
done 

ps | grep dd > /tmp/cpufan_testing_started
for i in {1..1800}
do
    awk '{printf ("%0.0f",$1/1000); }' </sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq >> /tmp/cpufan_testing_cpu-freq.txt
    awk '{printf ("%0.1f",$1/1000); }' </sys/class/thermal/thermal_zone0/temp >> /tmp/cpufan_testing_cpu-temperature.txt
    sleep 1
done
ps | grep dd > /tmp/cpufan_testing_done

for dd in $(jobs -p) ; do kill ${dd} ; done
