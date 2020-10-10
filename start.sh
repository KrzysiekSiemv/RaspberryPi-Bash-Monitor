#!/bin/sh
# Ten skrypt tworzy nową sesję screen wyświetlającą skrypt monitor.sh
screen -m -S "RaspberryPi Bash Monitor" bash -c "watch -n 0.1 ./monitor.sh"
