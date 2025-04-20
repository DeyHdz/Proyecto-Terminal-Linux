#!/bin/bash

# Colores estándar
R='\033[1;31m'   # Rojo brillante
G='\033[1;32m'   # Verde brillante
Y='\033[1;33m'   # Amarillo brillante
B='\033[1;34m'   # Azul brillante
M='\033[1;35m'   # Magenta brillante
C='\033[1;36m'   # Cian brillante
W='\033[1;37m'   # Blanco brillante (gris claro)

# Colores oscuros
R0='\033[0;31m'  # Rojo
G0='\033[0;32m'  # Verde
Y0='\033[0;33m'  # Amarillo
B0='\033[0;34m'  # Azul
M0='\033[0;35m'  # Magenta
C0='\033[0;36m'  # Cian
W0='\033[0;37m'  # Blanco (gris)


# Inicializar tablero vacío
tablero=(" " " " " " " " " " " " " " " " " ")
turno="X"
jugadas=0

imprimir_tablero() {
    clear
echo -e "${G}"


printf "\t\t ▗▄▄▖ ▗▄▖▗▄▄▄▖▗▄▖ \n"
printf "\t\t▐▌   ▐▌ ▐▌ █ ▐▌ ▐▌\n"
printf "\t\t▐▌▝▜▌▐▛▀▜▌ █ ▐▌ ▐▌\n"
printf "\t\t▝▚▄▞▘▐▌ ▐▌ █ ▝▚▄▞▘\n"

	#printf "\n\t\t    /\_/\  \n"
	#printf "\t\t   ( o.o ) \n"
	#printf "\t\t    > ^ <  \n"

    echo -e "${Y}"
    printf "\t\t    ${tablero[0]} | ${tablero[1]} | ${tablero[2]} \n"
    printf "\t\t   ---+---+--- \n"
    printf "\t\t    ${tablero[3]} | ${tablero[4]} | ${tablero[5]} \n"
    printf "\t\t   ---+---+---\n"
    printf "\t\t    ${tablero[6]} | ${tablero[7]} | ${tablero[8]} \n"
    echo -e "${W}"
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
        read -p "        Jugador $turno, elige una casilla (1-9): " casilla
        if [[ "$casilla" =~ ^[1-9]$ && "${tablero[$((casilla - 1))]}" == " " ]]; then
            tablero[$((casilla - 1))]=$turno
            ((jugadas++))
            break
        else
            echo -e  "${R}\t\tCasilla inválida o ya ocupada. Intenta de nuevo.${W}"
        fi
    done
}

# Juego principal
while true; do
    imprimir_tablero
    jugar_turno
    imprimir_tablero
    
    if verificar_ganador; then

	echo -e "${W}"
printf "\t                    /)    \n"
printf "\t           /\___/\ ((     \n"
printf "\t           \ @_@'/  ))    \n"
printf "\t           {_:Y:.}_//     \n"
printf "\t----------{_}^-'{_}----------\n"

        echo -e "${G}\t★彡彡 JUGADOR ${Y}$turno ${G} ha ${Y} G A N A D O${G}ミミ★${W} "
        break
    elif [[ $jugadas -eq 9 ]]; then

	echo -e "${W}"
printf "\t\t      /\_____/\     \n"
printf "\t\t     /  o   o  \    \n"
printf "\t\t    ( ==  ^  == )   \n"
printf "\t\t     )         (    \n"
printf "\t\t    (           )   \n"
printf "\t\t   ( (  )   (  ) )  \n"
printf "\t\t  (__(__)___(__)__) \n"

       echo -e "${C}\n\t\t¡E M P A T E!${W}"
        break
    fi
    
    # Cambiar de turno
    [[ "$turno" == "X" ]] && turno="O" || turno="X"
done
