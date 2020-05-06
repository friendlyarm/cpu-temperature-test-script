#!/bin/bash

calc(){ awk "BEGIN { print "$*" }"; }
rm -f /tmp/cpufreq.txt
rm -f /tmp/cpu_temperature.txt

NUM=`cat /proc/cpuinfo | grep processor | wc -l`
for j in `seq $NUM`
do
    dd if=/dev/zero of=/dev/null bs=1M&
done 

ps | grep dd > /tmp/cpufan_testing_started
for i in {1..1800}
do
    CPUF=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`
    CPUT=`cat /sys/class/thermal/thermal_zone0/temp`
    echo `calc ${CPUF}/1000` >> /tmp/cpufan_testing_cpu-freq.txt
    echo `calc ${CPUT}/1000` >> /tmp/cpufan_testing_cpu-temperature.txt
    sleep 1
done
ps | grep dd > /tmp/cpufan_testing_done
