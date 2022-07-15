#!/bin/bash

ARQCOLEGAS="/home/ubuntu/cursoscripts/arquivos-importantes/listacolegas.txt"
echo "==============Script de busca===================="
echo "\n"
echo "Por favor, informe o seu primeiro nome: "
read NOME
echo "O nome completo do aluno é: $(grep "$NOME" $ARQCOLEGAS)"
echo ""
echo "Fim do script"
