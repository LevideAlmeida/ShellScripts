#!/bin/bash

TAM_MAX=20000
TAM_SWAP=$(ls -l /home/ubuntu/cursoscripts/testeswap | cut -d " " -f5)
PORC_SWAP=$(expr "$TAM_SWAP" "*" "100" "/" "$TAM_MAX")

if [ "$PORC_SWAP" -ge 50 -a "$PORC_SWAP" -le 80 ]
then
	logger -p local0.warn -t [Monitoramento swap] "Aviso! Swap está com uso acima de 50%!"
elif [ "$PORC_SWAP" -ge 80 ]
then
	logger -p local0.err -t [Monitoramento swap] "ATENÇÃO!!!!!!! SWAP ESTÁ COM USO ACIMA DE 80%!!!!!!!"
	echo "ATENÇÃO!!!!!!!!! SWAP ESTÁ COM USO ACIMA DE 80%!!!!!!!!" | mail -s "Monitoramento swap" ubuntu
fi



