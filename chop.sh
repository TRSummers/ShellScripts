#!/bin/bash
#filename="med_`date`_files"

echo "Tiny, Small or Medium?"
read -p 'T, S, or M: ' x
echo "Which Test?"
read -p 'Test Number: ' test

if [ $x = "m" ]; then
	size="medium"
elif [ $x = "s" ]; then
	size="small"
else 
	size="tiny"
fi	
	

mkdir "Test_`date '+%m_%d'`_files"
dir="Test_`date '+%m_%d'`_files"

cp $size.hadoop-metrics.log $dir/$size.hadoop-metrics_test_${test}.log

#echo $dir
#sed -e '/.*CPU/!d' med.tmp > med.cleaned
sed -e '/.*CPU/!d' $size.hadoop-metrics.log > m.cleaned
echo "Medium Test CPU Seconds" > "$dir/m_`date`.FINAL"
date >> "$dir/m_`date`.FINAL"
echo "=======================" >> "$dir/m_`date`.FINAL"
sed -e 's/.*application_//g;  s/.*000[0-9],//g; s/,.*Counter,/,/g; s/CPU_MILLISECONDS=//g; s/Reduce-11/ZReduce-11/g; s/Reduce-10/ZReduce-10/g '  m.cleaned > m.chopped
sort -u m.chopped > m.sorted
sed -e 's/ZReduce/Reduce/g' m.sorted >> "$dir/m_`date`.FINAL"
rm *sorted *chopped *cleaned
