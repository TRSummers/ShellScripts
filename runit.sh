#!/bin/bash

export JMETER_HOME="/Applications/apache-jmeter-3.2/bin"

echo "==============================="
echo "==============================="
ls $JMETER_HOME/jmeter-scripts-master/src/Tests/Order/
echo "==============================="
echo "==============================="
echo "Enter script filename"
#read -p ">> " script_fileName

echo "==============================="
echo "==============================="
ls $JMETER_HOME/jmeter-scripts-master/src/
echo "==============================="
echo "==============================="
echo "Enter properties filename"
#read -p ">> " properties_fileName

echo "Enter log filename"
read -p ">> " log_fileName
clear
echo "==============================="
echo "Start time is:"
date
echo "==============================="
$JMETER_HOME/jmeter -n -t jmeter-scripts-master/src/Tests/Order/WEBS_Order_TT_Synthetic.jmx -q jmeter-scripts-master/src/WEBS_EP_prf.properties -l $log_fileName
#$JMETER_HOME/jmeter -n -t jmeter-scripts-master/src/Tests/Order/$script_fileName -q jmeter-scripts-master/src/$properties_fileName -l $log_fileName
echo "==============================="
echo "End time is:" 
date
echo "Log file is $log_fileName"
echo "==============================="
