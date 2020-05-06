# cpu-temperature-test-script
## 安装 (在FriendlyCore系统下）
root用户下执行以下命令，下载脚本到 /root/ 下：
```
apt-get -y update
apt-get -y install git
cd /root/
git clone https://github.com/friendlyarm/cpu-temperature-test-script --depth 1 -b master script
chmod 755 /root/script/capture_cpufreq_and_temp.sh
```
执行以下命令，实现开机自动运行：
```
sed -i '/^exit 0.*/d' /etc/rc.local
sed -i '/^\/root\/script\/capture_cpufreq.*/d' /etc/rc.local
echo "/root/script/capture_cpufreq_and_temp.sh &" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
poweroff
```
## 测试步骤
1）先让开发板冷却  
2）上电开机，出现以下文件：/tmp/cpufan_testing_started，说明测试已经开始  
3）半个小时后，出现以下文件：/tmp/cpufan_testing_done，说明测试已经结果  
4）测试结果放在以下文件：  
/tmp/cpufan_testing_cpu-freq.txt  
/tmp/cpufan_testing_cpu-temperature.txt  
5）将结果导入 excel 生成图表  
## 测试时长
半小时  
