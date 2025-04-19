

#!/bin/bash

# Colores
G='\033[0;32m' # Verde
Y='\033[1;33m' # Amarillo
R='\033[0;31m' # Rojo
W='\033[0m'    # Reset color







# Pedir nombre de la carpeta
echo -e "\n Ingresa el nombre de la carpeta donde buscar:"
read -p "Carpeta: " carpeta

# Pedir nombre del archivo
echo -e "\n Ingresa el nombre del archivo que deseas buscar:"
read -p "Archivo: " archivo

# Buscar la carpeta por nombre dentro de /home/$USER
carpeta=$(find "/home/$USER" -type d -name "$carpeta" 2>/dev/null | head -n 1)

# Verificar si la carpeta fue encontrada
if [[ -d "$carpeta" ]]; then
    # Buscar el archivo dentro de la carpeta encontrada
    archivo=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null | head -n 1)

    # Verificar si el archivo fue encontrado
    if [[ -f "$archivo" ]]; then
        
        echo -e "\n ${G}Archivo encontrado${W} en:"
        echo "$archivo"
    else
        
        echo -e "\n ${Y}No se encontró el archivo en la carpeta.${W}"
    fi
else

    echo -e "\n ${R}La carpeta no existe en el sistema.${W}"
fi


