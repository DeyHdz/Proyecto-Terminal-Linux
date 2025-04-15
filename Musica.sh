
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

# Carpeta de música
MUSIC_DIR="$HOME/proyecto_terminal/musicalista"

# Verificación de mpg123
if ! command -v mpg123 &> /dev/null; then
    echo -e "\n${R}[!] mpg123 no está instalado."
    echo -ne "${G}¿Deseas instalarlo? (s/n):"
    read instalar
    if [[ "$instalar" == "s" ]]; then
        sudo apt update && sudo apt install -y mpg123
    else
        echo -e "${R}No se puede continuar sin mpg123. Saliendo..."
        exit 1
    fi
fi

# Menú principal
while true; do
    clear
    echo -e "${C}"
	printf "\t\t▗▖  ▗▖▗▖ ▗▖ ▗▄▄▖▗▄▄▄▖ ▗▄▄▖ ▗▄▖ \n"
	printf "\t\t▐▛▚▞▜▌▐▌ ▐▌▐▌     █  ▐▌   ▐▌ ▐▌\n"
	printf "\t\t▐▌  ▐▌▐▌ ▐▌ ▝▀▚▖  █  ▐▌   ▐▛▀▜▌\n"
	printf "\t\t▐▌  ▐▌▝▚▄▞▘▗▄▄▞▘▗▄█▄▖▝▚▄▄▖▐▌ ▐▌\n"
    echo  "===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-==="
    echo -e "${W}"
    echo -e "${Y}\t\t[1]${W} Reproducir canciones aleatorias"
    echo -e "${Y}\t\t[2]${W} Elegir una canción específica"
    echo -e "${Y}\t\t[3]${W} Salir"
    echo ""
    echo -ne "${G}\t\t E L I G E   U N A  O P C I O N: ${W}"
    read opcion

	if [[ "$opcion" == "1" ]]; then
       clear
       echo -e "${C}\n\t\t▶ Reproduciendo música aleatoria desde\n\t\t ${MUSIC_DIR}"	

	#clear
        #  	canciones=("$MUSIC_DIR"/*.mp3)
        #	i=1
        #for cancion in "${canciones[@]}"; do
         #   ((i++))
        #done

        #echo -e "${C}\n\t\t\t▶ Reproduciendo:\n\t\t\t\t $(basename "$cancion" .mp3)"

	echo -e "${C}\n\t\t\t ⇄ㅤ<<ㅤ❙❙ㅤ>>ㅤ↻ "
	echo -e "${Y}"
        printf "\t\t╭────────────────────────────────────╮\n"
        printf "\t\t│ Controles durante la reproducción  │\n"
        printf "\t\t├────────────────────────────────────┤\n"
        printf "\t\t│ s = Pausa / Play                   │\n"
        printf "\t\t│ d = Canción anterior               │\n"
        printf "\t\t│ f = Canción siguiente              │\n"
        printf "\t\t│ u = Silenciar                      │\n"
        printf "\t\t│ + = Subir volumen                  │\n"
        printf "\t\t│ - = Bajar volumen                  │\n"
        printf "\t\t│ l = Muestra lista de canciones     │\n"
        printf "\t\t│ q = Salir                          │\n"
        printf "\t\t╰────────────────────────────────────╯\n"
        echo -e "${W}"
	mpg123 -C --title -q "$MUSIC_DIR"/*.mp3
        echo ""
#        read -p "           Presiona Enter para volver al menú..."

    elif [[ "$opcion" == "2" ]]; then
        clear
        echo -e "${C}\n\t\tL I S TA   C A N C I O N E S :"
	echo -e  "===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-===${W}"
        canciones=("$MUSIC_DIR"/*.mp3)
        i=1
        for cancion in "${canciones[@]}"; do
            echo "           [$i] $(basename "$cancion")"
            ((i++))
        done
        echo ""
        echo -ne "${G}\t\t\tSelecciona el número de canción: ${W}"
        read seleccion

        if [[ "$seleccion" =~ ^[0-9]+$ ]] && (( seleccion >= 1 && seleccion < i )); then
            cancion="${canciones[$((seleccion-1))]}"
            clear
            echo -e "${C}\n\t\t▶ Reproduciendo:\n\n\t\t\t$(basename "$cancion")"
            echo -e "${C}\n\t\t\t ⇄ㅤ<<ㅤ❙❙ㅤ>>ㅤ↻ "
 

	   echo -e "${Y}"
            printf "\t\t╭────────────────────────────────────╮\n"
            printf "\t\t│ Controles durante la reproducción  │\n"
            printf "\t\t├────────────────────────────────────┤\n"
            printf "\t\t│ s = Pausa / Play                   │\n"
            printf "\t\t│ u = Silenciar                      │\n"
            printf "\t\t│ + = Subir volumen                  │\n"
            printf "\t\t│ - = Bajar volumen                  │\n"
            printf "\t\t│ l = Mostrar nombre de canción      │\n"
            printf "\t\t│ q = Salir                          │\n"
            printf "\t\t╰────────────────────────────────────╯\n"
            echo -e "${W}"
            mpg123 -C --title -q "$cancion"
        else
            echo -e "${R}\t\t\tOpción inválida.${W}"
            sleep 1.5
        fi
        echo ""
 #       read -p "       Presiona Enter para volver al menú..."

    elif [[ "$opcion" == "3" ]]; then
        echo -e "${C}\n\t\t       ¡H A S T A  L U E G O!${W}\n"
        exit 0
	clear
    else
        echo -e "${R}\t\tOpción inválida. Intenta otra vez.${W}"
        sleep 1.5
    fi
done
