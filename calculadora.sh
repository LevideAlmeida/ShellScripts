#!/bin/bash

read -p "Insira o primeiro valor: " VALOR1
read -p "Insira o segundo valor: " VALOR2
echo "Insira a operação [soma (+) subtração(-) multiplicação(*) divisão(/):"
read OPERACAO
echo "Resultado: $(expr $VALOR1 "$OPERACAO" $VALOR2 2> /dev/null || echo "Alguma informação entregue está errada, por favor verifique e tente novamente")"
