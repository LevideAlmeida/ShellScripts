#!/bin/bash
##################################################################################
# 										 #
# Nome: relatorio-usuario.sh 							 #
# Autor: Levi de Almeida Pontes 						 #
# 										 #
# Descrição: Esse script gera um relatorio com algumas  			 #
#  	     informações importantes de um usuario				 #
# 										 #
# Data: 16/07//2022								 #
# 										 #
# Uso: ./relatorio-usuario.sh (nome do usuario)					 #
# 										 #
##################################################################################

ls /home/$1 > /dev/null 2>&1 || { echo "Usuario inexistente" ; exit 1 ; }

UIDUSUARIO=$( cat /etc/passwd | grep $1 | cut -d : -f3 )
DESCRICAO=$( cat /etc/passwd | grep $1 | cut -d : -f5 )
USOHOME=$( du -sh /home/$1 | cut -f1 ) 


clear
echo "==============================================================================="
echo "Relatorio do usuario: $1"
echo ""
echo "UID do usuario: $UIDUSUARIO"
echo "Descrição do usuario: $DESCRICAO"
echo "Total usado no /home/$1: $USOHOME"
echo ""
lastlog -u $1
echo "==============================================================================="
exit 0
