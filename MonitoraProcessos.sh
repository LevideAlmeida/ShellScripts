#!/bin/bash

read -p "Digite o nome do processo: " PROCESSO
while [ $(ps axu | grep -v grep | grep $PROCESSO | wc -l) -eq 0 ]
do
echo "ATENÇÃO!!!!!!!!!!!! O processo $PROCESSO NÃO está em execução!"
sleep 3
done
