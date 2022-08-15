#!/bin/bash

DATA=$(echo "$2" | tr -d /)
VAL1=$(echo "$DATA" | cut -c-2)
VAL2=$(echo "$DATA" | cut -c3-4)
ANO=$(echo "$DATA" | cut -c5-8)

helpme () {
echo "Uso ./Funcoesdiversas.sh OPÇÃO DATA"
echo ""
echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
echo ""
echo "Opções:"
echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossivel determinar, 3 invalido"
echo "-i = Inverte o formato BR para US e US para BR. Inclui as Barras"
echo "-b = Inclui Barras de data. Exemplo: de 13081981 para 13/08/1981."
echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1918"
}

f () {
	if [ "$VAL1" -lt 13 -a "$VAL2" -lt 13 ]
	then
		echo 2
		return 2
	else
		if [ "$VAL1" -lt 32 -a "$VAL2" -lt 13 ]
		then
			echo 0
			return 0
		elif [ "$VAL1" -le 12 -a "$VAL2" -le 31 ]
		then
			echo 1
			return 1
		else
			echo 3
			return 3
		fi
	fi
}

i () {
	local VAR1=$(f)
	if [ "$VAR1" -ne 3 ]
	then
		echo "$VAL2/$VAL1/$ANO"
	else
		echo "Formato de data invalido!"
		exit 1
	fi
}

b () {
	local VAR1=$(f)
	if [ "$VAR1" -ne 3 ]
	then
		echo "$VAL1/$VAL2/$ANO"
	else
		echo "Formato de data invalido!"
		exit 1
	fi

}

casemes () {
	case $1 in
		01)
			MES=Janeiro
			;;
		02)
			MES=Fevereiro
			;;
		03)
			MES=Março
			;;
		04)
			MES=Abril
			;;
		05)
			MES=Maio
			;;
		06)
			MES=Junho
			;;
		07)
			MES=Julho
			;;
		08)
			MES=Agosto
			;;
		09)
			MES=Setembro
			;;
		10)
			MES=Outubro
			;;
		11)
			MES=Novembro
			;;
		12)
			MES=Dezembro
			;;
	esac

}


e () {
	local VAR1=$(f)
	if [ "$VAR1" -eq 3 ]
	then
		echo "Formato de data invalido!"
		exit 1
	elif [ "$VAR1" -eq 0 ]
	then
		casemes $VAL2
		echo "$VAL1 de $MES de $ANO"
		exit 0
	elif [ "$VAR1" -eq 1 ]
	then
		casemes $VAL1
		echo "$VAL2 de $MES de $ANO"
		exit 0
	elif [ "$VAR1" -eq 2 ]
	then
		echo "Impossivel determinar o padrão de data."
		echo "1 - BR (DD/MM/YYYY)"
		echo "2 - US (MM/DD/YYYY)"
		read -n1 -p "Informe o formato (1 ou 2): " FORMATO
		echo ""
		case $FORMATO in
			1)
				casemes $VAL2
				echo "$VAL1 de $MES de $ANO"
				exit 0
				;;
			2)
				casemes $VAL1
				echo "$VAL2 de $MES de $ANO"
				exit 0
				;;
			*)
				echo "Opção invalida!"
				exit 1
				;;
		esac
	fi
	
}




















case $1 in
	-f)
		f
		;;
	-i)
		i
		;;
	-b)
		b
		;;
	-e)
		e
		;;
	*)
		echo "erro"
		;;
esac
