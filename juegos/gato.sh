#!/bin/bash

# Inicializar tablero vacío
tablero=(" " " " " " " " " " " " " " " " " ")
turno="X"
jugadas=0

imprimir_tablero() {
    clear
    echo ""
    echo "    ${tablero[0]} | ${tablero[1]} | ${tablero[2]}"
    echo "   ---+---+---"
    echo "    ${tablero[3]} | ${tablero[4]} | ${tablero[5]}"
    echo "   ---+---+---"
    echo "    ${tablero[6]} | ${tablero[7]} | ${tablero[8]}"
    echo ""
}

verificar_ganador() {
    local combinaciones=(
        "0 1 2"
        "3 4 5"
        "6 7 8"
        "0 3 6"
        "1 4 7"
        "2 5 8"
        "0 4 8"
        "2 4 6"
    )
    
    for comb in "${combinaciones[@]}"; do
        set -- $comb
        if [[ "${tablero[$1]}" == "$turno" && "${tablero[$2]}" == "$turno" && "${tablero[$3]}" == "$turno" ]]; then
            return 0
        fi
    done
    
    return 1
}

jugar_turno() {
    local casilla
    while true; do
        read -p "Jugador $turno, elige una casilla (1-9): " casilla
        if [[ "$casilla" =~ ^[1-9]$ && "${tablero[$((casilla - 1))]}" == " " ]]; then
            tablero[$((casilla - 1))]=$turno
            ((jugadas++))
            break
        else
            echo "❌ Casilla inválida o ya ocupada. Intenta de nuevo."
        fi
    done
}

# Juego principal
while true; do
    imprimir_tablero
    jugar_turno
    imprimir_tablero
    
    if verificar_ganador; then
        echo "🎮 ¡Jugador $turno ha ganado!"
        break
    elif [[ $jugadas -eq 9 ]]; then
        echo "😐 ¡Empate!"
        break
    fi
    
    # Cambiar de turno
    [[ "$turno" == "X" ]] && turno="O" || turno="X"
done
