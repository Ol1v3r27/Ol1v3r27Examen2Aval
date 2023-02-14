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
for ((i = 1; i <= $contador; i++)); do
    ciudades=$(cat consumos.txt | grep $ciudad | head -n$i | tail -n1 | awk '{ print $4 }')
    sumatorio=$((sumatorio + ciudades))
done
echo "Consumo total de $ciudad: $sumatorio"
media=$((sumatorio/contador))
echo "La media es $media"