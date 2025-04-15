#!/bin/bash

clear
echo "======================="
echo "     🎮 Menú de Juegos"
echo "======================="
echo "1. Ahorcado"
echo "2. Gato"
echo "3. Salir"
echo ""

read -p "Selecciona una opción [1-3]: " opcion

case $opcion in
    1)
        ./juegos/ahorcado.sh
        ;;
    2)
        ./juegos/gato.sh
        ;;
    3)
        echo "Regresando al menú principal..."
        ;;
    *)
        echo "❌ Opción inválida."
        ;;
esac

