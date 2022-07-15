#!/bin/bash

ARQCOLEGAS="/home/ubuntu/cursoscripts/arquivos-importantes/listacolegas.txt"
echo "==============Script de busca===================="
echo ""
echo "O nome completo do aluno é: $(grep "$1" $ARQCOLEGAS)"
echo ""
echo "Fim do script"
