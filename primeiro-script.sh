#!/bin/bash
#########################################
#
# Name: primeiro-script.sh - Script teste do curso da Udemy
# Author: Levi de Almeida Pontes
# Email para contato: thegood878@gmail.com
#
#########################################

# Variaveis usadas no script
HORA="$(date +%H:%M)"
DIA="$(date +%d)"
MES="$(date +%m)"
LISTCOLEGAS="/home/ubuntu/cursoscripts/arquivos-importantes/listacolegas.txt"

echo "==========Script 01=========="
echo -e "\n"
echo "Script executado as: $HORA do dia $DIA do mes $MES"
echo "==========================================="
echo "Lista de colegas de trabalho"
sort $LISTCOLEGAS
