#!/bin/bash

for user in $(ls /home)
do
ARQJPG=$(find /home/$user -name '*.jpg' | wc -l)
ARQMP3=$(find /home/$user -name '*.mp3' | wc -l)
ARQMP4=$(find /home/$user -name '*.mp4' | wc -l)
ARQSH=$(find /home/$user -name '*.sh' | wc -l)
echo "Usuario: $user"
echo "Arquivos JPG: $ARQJPG"
echo "Arquivos MP3: $ARQMP3"
echo "Arquivos MP4: $ARQMP4"
echo "Arquivos de script: $ARQSH"
echo ""
done
