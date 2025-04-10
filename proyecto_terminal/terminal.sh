#!/bin/bash

clear
echo "==== Bienvenido a la Terminal Personalizada ===="
read -p "Usuario: " user
read -s -p "Contraseña: " pass
echo

# Verifica usuario con el sistema
if su -c "exit" "$user" <<< "$pass" &>/dev/null; then
    echo "Acceso Autorizado"
else
    echo "Usuario o contraseña incorrectos"
    exit 1
fi

# Ejecutar la terminal personalizada
exec ./shell.sh "$user"
