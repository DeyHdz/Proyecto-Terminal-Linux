#!/bin/bash

palabras=("protecsa" "ubuntu" "terminal" "bash" "codigo" "computadora" "programar")
palabra=${palabras[$RANDOM % ${#palabras[@]}]}
longitud=${#palabra}
intentos=6
guiones=$(echo "$palabra" | sed 's/./_/g')
letras_usadas=()

while [[ "$guiones" != "$palabra" && $intentos -gt 0 ]]; do
    echo ""
    echo "Palabra: $guiones"
    echo "Letras usadas: ${letras_usadas[*]}"
    echo "Intentos restantes: $intentos"
    read -p "Ingresa una letra: " letra

    if [[ ! "$letra" =~ ^[a-zA-Z]$ ]]; then
        echo "❌ Solo una letra válida."
        continue
    fi

    if [[ "${letras_usadas[*]}" =~ "$letra" ]]; then
        echo "⚠️ Ya usaste esa letra."
        continue
    fi

    letras_usadas+=("$letra")

    if [[ "$palabra" =~ "$letra" ]]; then
        nueva=""
        for ((i = 0; i < $longitud; i++)); do
            char="${palabra:$i:1}"
            if [[ "$char" == "$letra" ]]; then
                nueva+="$letra"
            else
                nueva+="${guiones:$i:1}"
            fi
        done
        guiones=$nueva
    else
        ((intentos--))
    fi
done

echo ""
if [[ "$guiones" == "$palabra" ]]; then
    echo "🎉 ¡Ganaste! La palabra era '$palabra'."
else
    echo "💀 Perdiste. La palabra era '$palabra'."
fi
