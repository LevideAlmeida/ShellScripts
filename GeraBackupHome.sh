#!/bin/bash

DATA=$(date +%Y%m%d%H%M)
NBACKUP=$(find /home/$USER/backup -type f -ctime -7 2> /dev/null | wc -l) 
DIRBACK=/home/$USER/backup

if [ ! -d $DIRBACK ]
then
	echo "Será criado o diretorio $DIRBACK para colocar os backups."
	echo -n "Deseja continuar? (N/s): "
	read -n1 NS
	case "$NS" in
		[sS])
			echo ""
			echo "Criando /home/$USER/backup..."
			mkdir /home/$USER/backup
			;;
		*)
			echo ""
			echo "Backup abortado!"
			exit 1
			;;
	esac
fi

if [ "$NBACKUP" -gt "00" ]
then
	echo "Já foi gerado um backup do diretorio /home/$USER nos ultimos 7 dias."
	echo -n "Deseja continuar? (N/s): "
	read -n1 SN
	case "$SN" in
		[sS])
			echo ""
			echo "Será criado um novo backup na data atual."
			;;
		*)
			echo ""
			echo "Backup abortado!"
			exit 1
			;;
	esac
fi

echo ""
echo "Criando backup..."

tar -cvzf backup_home_${DATA}.tgz --exclude="$DIRBACK" /home/$USER > /dev/null 2>&1 && mv backup_home_${DATA}.tgz /home/$USER/backup

echo ""
echo "Foi criado um backup de nome: backup_home_$DATA.tgz no diretorio /home/$USER/backup."
echo ""
echo "Backup concluido!"
echo ""
