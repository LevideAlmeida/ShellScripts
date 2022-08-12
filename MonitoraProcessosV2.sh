#!/bin/bash

TIME=5

if [ $# -eq 0 ]
then
	echo "Favor informe um processo como argumento."
	echo "./MonitoraProcesso.sh <Processo>"
	exit 1
fi

while true
do
	if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo "ATENÇÃO!!!!!!!!! O processo $1 NÃO está em execução!"
		sleep $TIME
	fi
done
