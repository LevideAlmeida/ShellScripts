#!/bin/bash

valor () {
	expr $1 + 1 > /dev/null 2>&1 || { echo "$1 Não é um numero! Opção invalida!" ; exit 1 ; }
}

operacao () {
	echo "Escolha uma operação:"
	echo "1 - Adição"
	echo "2 - Subtração"
	echo "3 - Multiplicação"
	echo "4 - Divisão"
	echo "Q - Sair"
}

caseoperacao () {
	case $1 in
		1) 
			OPERACAO=+
			;;
		2)
			OPERACAO=-
			;;
		3)
			OPERACAO=*
			;;
		4)
			OPERACAO=/
			;;
		[Qq])
			echo "Saindo..."
			exit 0
			;;
		*)
			echo "Opção invalida!"
			exit 1
			;;
	esac

}

read -n1 -p "Insira o numero de valores a serem calculados (Min=2 Max=5): " VAL
echo ""
expr $VAL + $VAL > /dev/null 2>&1 || { echo "Opção invalida!" ; exit 1 ; }

if [ "$VAL" -gt 5 -o "$VAL" -lt 2 ]
then
	echo "Opção invalida!"
	exit 1
fi

echo ""
read -p "Insira o valor 1: " VALOR1
echo ""
valor $VALOR1
operacao
echo ""
read -n1 -p "Opção: " OPCAO
echo ""
caseoperacao $OPCAO
echo ""
read -p "Insira o valor 2: " VALOR2
echo ""
valor $VALOR2
verificavalor () {
	if [ "$1" -eq 4 ]
	then
		if [ "$2" -eq 0 ]
		then
			echo "Nenhum numero pode ser dividido por zero!"
			exit 1
		fi
	fi

}
verificavalor $OPCAO $VALOR2

CALCULO1=$(expr "$VALOR1" "$OPERACAO" "$VALOR2")
echo "$VALOR1 $OPERACAO $VALOR2 = $CALCULO1"
case $VAL in
	2)
		exit 0
		;;
	3)
		echo ""
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO2
		echo ""
		caseoperacao $OPCAO2
		echo ""
		read -p "Insira o valor 3: " VALOR3
		echo ""
		valor $VALOR3
		verificavalor $OPCAO2 $VALOR3
		RESULTADO=$(expr "$CALCULO1" "$OPERACAO" "$VALOR3")
		echo "$CALCULO1 $OPERACAO $VALOR3 = $RESULTADO"
		;;
	4)
		echo ""
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO2
		echo ""
		caseoperacao $OPCAO2
		echo ""
		read -p "Insira o valor 3: " VALOR3
		echo ""
		valor $VALOR3
		verificavalor $OPCAO2 $VALOR3
		CALCULO2=$(expr "$CALCULO1" "$OPERACAO" "$VALOR3")		
		echo "$CALCULO1 $OPERACAO $VALOR3 = $CALCULO2"
		echo ""
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO3
		echo ""
		caseoperacao $OPCAO3
		echo ""
		read -p "Insira o valor 4: " VALOR4
		echo ""
		valor $VALOR4
		verificavalor $OPCAO3 $VALOR4
		RESULTADO=$(expr "$CALCULO2" "$OPERACAO" "$VALOR4")
		echo "$CALCULO2 $OPERACAO $VALOR4 = $RESULTADO"
		;;
	5)
		echo ""
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO2
		echo ""
		caseoperacao $OPCAO2
		echo ""
		read -p "Insira o valor 3: " VALOR3
		echo ""
		valor $VALOR3
		verificavalor $OPCAO2 $VALOR3
		CALCULO2=$(expr "$CALCULO1" "$OPERACAO" "$VALOR3")		
		echo "$CALCULO1 $OPERACAO $VALOR3 = $CALCULO2"
		echo ""
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO3
		echo ""
		caseoperacao $OPCAO3
		echo ""
		read -p "Insira o valor 4: " VALOR4
		echo ""
		valor $VALOR4
		verificavalor $OPCAO3 $VALOR4
		CALCULO3=$(expr "$CALCULO2" "$OPERACAO" "$VALOR4")
		echo "$CALCULO2 $OPERACAO $VALOR4 = $CALCULO3"
		operacao
		echo ""
		read -n1 -p "Opção: " OPCAO4
		echo ""
		caseoperacao $OPCAO4
		echo ""
		read -p "Insira o valor 5: " VALOR5
		echo ""
		valor $VALOR5
		verificavalor $OPCAO4 $VALOR5
		RESULTADO=$(expr "$CALCULO3" "$OPERACAO" "$VALOR5")
		echo "$CALCULO3 $OPERACAO $VALOR5 = $RESULTADO"
		;;
esac
