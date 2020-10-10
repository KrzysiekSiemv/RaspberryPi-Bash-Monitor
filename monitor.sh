#!/bin/bash

# Zmienne
UP=$(uptime -p)
UP_since=$(uptime -s)

GPU_temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
temp=$((`cat /sys/class/thermal/thermal_zone0/temp`/1000))
CPU_temp=$(echo "$temp.0'C")

IP=$(hostname -i)
Name=$(hostname)

# Pożyczone ze skryptu https://gist.github.com/ecampidoglio/5009512
function convert_to_MHz {
    let value=$1/1000
    echo "$value"
}

minFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq)
minFreq=$(convert_to_MHz $minFreq)

maxFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
maxFreq=$(convert_to_MHz $maxFreq)

freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
freq=$(convert_to_MHz $freq)

# ===================================================================

# Pamieci
totalRAM=$(free -h | grep 'Mem' | awk '{print $2}')
usedRAM=$(free -h | grep 'Mem' | awk '{print $3}')

totalSD=$(df -h | grep '/dev/root' | awk '{print $2}')
usedSD=$(df -h | grep '/dev/root' | awk '{print $3}')
freeSD=$(df -h | grep '/dev/root' | awk '{print $4}')

totalHDD=$(df -h | grep '/dev/sda1' | awk '{print $2}')
usedHDD=$(df -h | grep '/dev/sda1' | awk '{print $3}')
freeHDD=$(df -h | grep '/dev/sda1' | awk '{print $4}')
mountedHDD=$(df -h | grep '/dev/sda1' | awk '{print $6}')

# Wyświetlanie w bash
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Urzadzenie"
echo "      Host:               $Name"
echo "      IP:                 $IP"
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Stan urzadzenia"
echo "      Uruchomiony: $UP, od $UP_since."
echo "      Temperatura GPU:    $GPU_temp'C."
echo "      Temperatura CPU:    $CPU_temp."
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Czestotliwosc procesora"
echo "      Minimum:            $minFreq MHz"
echo "      Maksymalna:         $maxFreq MHz"
echo "      Obecna:             $freq MHz"
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Wykorzystanie pamieci:"
echo "      RAM:                $usedRAM/$totalRAM"
echo "      SD:                 $usedSD/$totalSD, wolne $freeSD"
echo "      HDD:                $mountedHDD: $usedHDD/$totalHDD, wolne $freeHDD"
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "                          Skrypt napisany przez: Krzysztof 'KrzysiekSiemv' Smaga (https://github.com/KrzysiekSiemv)"
