#!/bin/bash

OPERACAO1=+
OPERACAO2=-
OPERACAO3=*
OPERACAO4=/
OPERACAO5=%

read -p "Informe o Valor 1: " VALOR1
read -p "Informe o Valor 2: " VALOR2
echo ""
expr "$VALOR1" + "$VALOR2" > /dev/null 2>&1 || { echo "Houve um erro em um dos valores escolhidos, Por Favor, Tente Novamente!" ; exit 1 ; }

echo "Escolha uma Operação:"
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo ""
read -n1 -p "Opção: " OPCAO
echo ""
case "$OPCAO" in
	1)
		RESULTADO1=$(expr "$VALOR1" "$OPERACAO1" "$VALOR2")
		echo "$VALOR1 $OPERACAO1 $VALOR2 = $RESULTADO1"
		;;
	2)
		RESULTADO2=$(expr "$VALOR1" "$OPERACAO2" "$VALOR2")
		echo "$VALOR1 $OPERACAO2 $VALOR2 = $RESULTADO2"
		;;
	3)
		if [ "$VALOR1" -eq 0 -o "$VALOR2" -eq 0 ]
		then
			echo "Erro! Um dos valores selecionados é igual a zero, Por Favor, tente novamente!"
			exit 1
		else
			RESULTADO3=$(expr "$VALOR1" "$OPERACAO3" "$VALOR2")
		fi
		echo "$VALOR1 $OPERACAO3 $VALOR2 = $RESULTADO3"
		;;
	4)
		if [ "$VALOR2" -eq 0 ]
		then
			echo "Erro! Nenhum numero pode ser dividido por zero, Por Favor, tente novamente!"
			exit 1
		else
			RESULTADO4=$(expr "$VALOR1" "$OPERACAO4" "$VALOR2")
			RESTO=$(expr "$VALOR1" "$OPERACAO5" "$VALOR2")
			if [ "$RESTO" -gt 0 ]
			then
				echo "Divisão com resto = $RESTO"
				echo ""
			fi
			echo "$VALOR1 $OPERACAO4 $VALOR2 = $RESULTADO4"
		fi
		;;
	[qQ])
			echo "Saindo..."
			exit 0
			;;
	*)
			echo "Opção invalida! Por Favor, Tente Novamente!"
			exit 1
			;;
esac
