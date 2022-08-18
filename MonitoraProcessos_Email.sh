#!/bin/bash

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
		sleep 3
	else
		echo "Atenção!!!!!!! O processo $1 NÃO está em execução" | mail -s "ERRO NO PROCESSO $1" ubuntu
		sleep 20
	fi
done
