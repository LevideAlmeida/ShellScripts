#!/bin/bash

HORA012=$(date +%r)
HORA=$(date +%H)


if [ "$HORA" -ge "06" -a "$HORA" -le "12" ]
then
	echo "Bom Dia!"
elif [ "$HORA" -ge "13" -a "$HORA" -le "18" ]
then
	echo "Boa Tarde!"
else
	echo "Boa Noite!"
fi

echo ""
echo "A hora atual é: $HORA012"
