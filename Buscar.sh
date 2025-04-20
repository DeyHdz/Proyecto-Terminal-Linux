#!/bin/bash

# Colores estándar
R='\033[1;31m'   # Rojo brillante
G='\033[1;32m'   # Verde brillante
Y='\033[1;33m'   # Amarillo brillante
B='\033[1;34m'   # Azul brillante
M='\033[1;35m'   # Magenta brillante
C='\033[1;36m'   # Cian brillante
W='\033[1;37m'   # Blanco brillante (gris claro)

clear
echo -e "${M}"
echo -e "\t\t▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖ ▗▄▄▖ ▗▄▖ ▗▄▄▖ "
echo -e "\t\t▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▌ ▐▌"
echo -e "\t\t▐▛▀▚▖▐▌ ▐▌ ▝▀▚▖▐▌   ▐▛▀▜▌▐▛▀▚▖"
echo -e "\t\t▐▙▄▞▘▝▚▄▞▘▗▄▄▞▘▝▚▄▄▖▐▌ ▐▌▐▌ ▐▌"

echo -e "-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-"


# Pedir nombre de la carpeta
echo -e "${C}\n\t\t Ingresa el nombre de la carpeta donde buscar${W}"
read -p "                     Carpeta: " carpeta

# Pedir nombre del archivo
echo -e "${C}\n\t\t Ingresa el nombre del archivo que deseas buscar${W}"
read -p "                     Archivo: " archivo

# Buscar la carpeta por nombre dentro de /home/$USER
carpeta=$(find "/home/$USER" -type d -name "$carpeta" 2>/dev/null | head -n 1)

# Verificar si la carpeta fue encontrada
if [[ -d "$carpeta" ]]; then
    # Buscar el archivo dentro de la carpeta encontrada
    archivo=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null | head -n 1)

    # Verificar si el archivo fue encontrado
    if [[ -f "$archivo" ]]; then
        
        echo -e "\n\t\t\t ${G}Archivo encontrado en:${W}"
        echo -e "\t\t$archivo\n"
    else
        
        echo -e "\n\t\t\t${Y}No se encontró el archivo en la carpeta.${W}"
    fi
else

    echo -e "\n\t\t\t${R}La carpeta no existe en el sistema.${W}"
fi
