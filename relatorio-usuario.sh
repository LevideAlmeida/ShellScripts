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
