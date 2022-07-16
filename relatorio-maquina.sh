#!/bin/bash
############################################################################
#									   #
# Nome: Relatorio-Maquina.sh 						   #
# Autor: Levi de Almeida Pontes 					   #
# 									   # 
# Descrição: O script gera um relatorio sobre informações da maquina atual #
# Data: 16/07/2022 							   #
#									   #
# Uso: ./relatorio-maquina.sh 						   #
#									   #
############################################################################

KERNEL=$(uname -r)
FILESYS=$(df -h | egrep -v '(tmpfs|udev)')
UPTIME=$(uptime -s)
CPUNUM=$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)
CPUNAME=$( cat /proc/cpuinfo | grep "model name" | head -n1 | cut -d ":" -f2)
MEMAVABLE=$(free -m | grep Mem | cut -d " " -f61)


echo "===================================================="
echo "Relatorio da Maquina: $HOSTNAME"
echo "Data/Hora: $(date)"
echo "===================================================="
echo "A maquina está ativa desde: $UPTIME"
echo ""
echo "Versão do Kernel: $KERNEL"
echo ""
echo "Quantidade de CPUs/cores existentes: $CPUNUM"
echo ""
echo "Modelo da CPU:$CPUNAME"
echo ""
echo "Memoria RAM disponivel (MB): $MEMAVABLE"
echo ""
echo "Partições existentes na maquina:"
echo "$FILESYS"
echo "===================================================="

