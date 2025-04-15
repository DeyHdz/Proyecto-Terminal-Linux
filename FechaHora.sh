#!/bin/bash

# Obtener fecha desde /proc/rtc
fecha=$(cat /proc/driver/rtc | grep rtc_date | awk '{print $3}' | awk -F- '{print $3"/"$2"/"$1}')
hora=$(cat /proc/driver/rtc | grep rtc_time | awk '{print $3}')

    echo "=============================="
    echo "        Fecha y Hora"
    echo "=============================="
    echo "📅 Fecha actual: $fecha"
    echo "⏰ Hora actual:  $hora"
