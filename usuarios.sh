#!/bin/bash

echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"
echo ""
for usuario in $(ls /home)
do
UUID=$(cat /etc/passwd | grep $usuario | cut -d ":" -f3)
DESCRICAO=$(cat /etc/passwd | grep $usuario | cut -d ":" -f5)
echo -e "$usuario\t\t$UUID\t\t/home/$usuario\t\t$DESCRICAO"
done
