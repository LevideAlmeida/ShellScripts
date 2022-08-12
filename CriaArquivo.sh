#!/bin/bash

read -p "Informe o nome do arquivo a ser criado: " ARQUIVO
read -p "Informe um conjunto de caracteres que será usado para preencher o arquivo: " CARACTERE
read -p "Informe o tamanho total do arquivo (em bytes): " BYTES

cat /dev/null > $ARQUIVO

PORC_EXIBIDA=0
while [ $(stat --printf=%s $ARQUIVO) -le $BYTES ]
do
	echo "$CARACTERE" >> $ARQUIVO
	SIZEATUAL=$(stat --printf=%s $ARQUIVO)
	PORC_ATUAL=$(expr $SIZEATUAL \* 100 \/ $BYTES)
	if [ "$(expr "$PORC_ATUAL" % 10)" -eq 0 -a "$PORC_EXIBIDA" -ne "$PORC_ATUAL" ]
	then
		echo "Concluido: $PORC_ATUAL% - Tamanho do arquivo: $SIZEATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
done
