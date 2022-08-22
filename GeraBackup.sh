#!/bin/bash

DIRBACK=/home/$USER/backup

if [ ! -d $DIRBACK ]
then
	echo "Será criado um diretorio backup em /home/$USER"
	read -p -n1 "Deseja continuar? (S/N): " SN
	echo ""
	case $SN in
		[sS])
			echo "Criando diretorio $DIRBACK..."
			mkdir /home/$USER/backup
			;;
		*)
			echo "Backup abortado!"
			exit 1
			;;
	esac
fi

read -p "Insira o diretorio do qual será feito o backup (Insira o caminho completo): " DIR
if [ ! -d $DIR ]
then
	echo "O diretorio $DIR não existe!"
fi

NCAMPOS=$(echo $DIR | tr / "\n" | wc -l)
DIRNAME=$(echo $DIR | cut -d "/" -f$NCAMPOS)
NBACKUP=$(find /home/$USER/backup -type f -ctime -7 -name *$DIRNAME* 2> /dev/null | wc -l)
DATA=$(date +%d%m%Y%H%M )

if [ $NBACKUP -ne 00 ]
then
	echo "Já existe um backup feito nos ultimos 7 dias, deseja continuar? (S/N)"
	read NS
	case $NS in
		[sS])
			echo ""
			;;
		*)
			echo "Backup abortado!"
			exit 1
			;;
	esac
fi
DIRATUAL=$(pwd)

echo "Criando o backup..."
echo ""

tar -cvzf Backup_${DIRNAME}_${DATA}.tgz --exclude=$DIRATUAL $DIR > /dev/null && mv Backup_${DIRNAME}_${DATA}.tgz /home/$USER/backup

sleep 3
echo "Foi criado o backup Backup_${DIRNAME}_${DATA}.tgz no diretorio /home/$USER/backup"
echo ""
echo "Backup concluido com sucesso!"
echo ""
