#!/bin/bash

clear

echo "#############################################"
echo ""
echo " Restarting Kibana pod. "
echo ""
echo "#############################################"

kubectl get pods | grep monitoring > delete.tmp

sed -e 's/..................................$//' delete.tmp > foo
kibana_pod=$(cat foo)

echo "#############################################"
echo " "
echo "1. Deleting pod " $kibana_pod
echo " "
echo "#############################################"

kubectl delete pod $kibana_pod
helm delete --purge monitoring-tools

echo "#############################################"
echo " "
echo "2. Deleting esalsticsearch-masters[0,1,2]"
echo " "
echo "#############################################"

kubectl delete pvc elasticsearch-master-elasticsearch-master-0 elasticsearch-master-elasticsearch-master-1 elasticsearch-master-elasticsearch-master-2

echo "#############################################"
echo " "
echo "3. helm installing 'monitoring-tools'"
echo " "
echo "#############################################"

helm install --name monitoring-tools -f ~/REPOS/europa-tools/profiles/monitoring-tools-values.yaml ~/REPOS/europa-tools

echo "#############################################"
echo " "
echo "4. Waiting 90 seconds and then getting the new Kibana load balancer address."
echo " "
echo "#############################################"

sleep 90
echo "####################################"
echo " "
echo "New lb is:" 
kubectl get svc|grep monitoring-tools-kibana-external
echo " "
echo "####################################"

