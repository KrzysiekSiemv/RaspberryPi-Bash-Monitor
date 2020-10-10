# Raspberry Pi Bash Monitor
Jest to skrypt monitorujący temperaturę procesora oraz grafiki, wykorzystanie RAM, karty pamięci oraz dodatkowego dysku, częstotliwość procesora. Dodatkowo pokazuje stan pobierania w Transmission-Daemon oraz jaką muzykę obecnie odtwarza w CUSM. 

<img src="https://i.imgur.com/9yykJPM.png" />

Skrypt do wyświetlania stanu pobierania Transmission-Daemon oraz obecnie odtwarzana muzyka znajduje się w folderze "dodatki". Jedynie wystarczy wkleić kod do głównego skryptu.   

Aby uruchomić skrypt, wystarczy wpisać w Terminalu:<br><br>
`$ watch -n 0.1 ./monitor.sh`<br><br>
lub jeśli chcesz wystartować skrypt w nowej sesji Screen użyj skryptu `start.sh`. Skrypt ten nie wymaga na chwilę obecną uprawnień root.
