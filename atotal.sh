#!/bin/bash
echo ""
read -p "Escribe una ciudad de España: " ciudad
while [ $ciudad != 'Valencia' ] && [ $ciudad != 'Barcelona' ] && [ $ciudad != 'Madrid' ]; do
    echo ""
    echo "Debes escribir Valencia, Barcelona o Madrid"
    echo ""
    read -p "Escribe una ciudad de España: " ciudad
done
echo ""
contador=$(cat consumos.txt | grep $ciudad | awk '{ print $4 }' | wc -l)
ciudades=$(cat consumos.txt | grep $ciudad | awk '{ print $4 }')
echo $ciudades
echo $contador
for ((i = 1; i <= $contador; i++)); do
    sumatorio=$(sumatorio + ciudades)
done
echo "Consumo total de $ciudad: $sumatorio"