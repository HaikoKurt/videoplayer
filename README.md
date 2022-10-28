# Videoplayer

Stand-alone Videoplayer mit Raspi

## Installation
### Manuell

1.  Raspian Lite 32-Bit installieren, **wichtig:** Buster (legacy version: 2022-09-22)
1.  `sudo apt update`
1.  `sudo apt upgrade`
1.  `sudo apt install omxplayer`
1.  Startscript `start.sh` in Home-Verzeichnis kopieren und ausführbbar machen `chmod +x start.sh`
1.  Video in das Home-Verzeichnis kopieren, ggf. Video-Name im Startscript anpassen
1.  Datei videoplayer.service installieren
    1.  `sudo cp videoplayer.service /lib/systemd/system/`
    1.  `sudo systemctl enable videoplayer.service`
    1.  `sudo systemctl start videoplayer.service`
1. USB-Mount installieren
    1.  `sudo apt install usbmount`
    1.  `sudo mkdir /etc/systemd/system/systemd-udevd.service.d`
    1.  `sudo cp system/videoplayer-usbmount.conf /etc/systemd/system/systemd-udevd.service.d`
    1.  `sudo systemctl daemon-reexec`
    1.  `sudo service systemd-udevd restart`
1.  `/boot/config.txt` für Ein-/Ausschalter anpassen
    1. `cd /boot`
    1. in `config.txt` als letzte Zeile einfügen: `dtoverlay=gpio-shutdown,gpio_pin=3,active_low=1,gpio_pull=up`
1.  `sudo reboot`

### Mit Instalationsskript

1.  Raspian Lite 32-Bit installieren, **wichtig:** Buster (legacy version: 2022-09-22)
1.  `sudo apt update`
1.  Git instalieren `sudo apt install git`
1.  Repository holen `git clone https://github.com/HaikoKurt/videoplayer`
1.  In das Verzeichnis wechseln `cd videoplayer`
1.  Installation starten `./install.sh`
## Starte Video in einer Schleife

    omxplayer --loop -o hdmi VIDEO.mp4

## Erweiterungsmöglichkeiten

-   Video-Darei von einem eingesteckten USB-Stick abspielen
-   Mehrere Video-dateien in einer Schleife abspielen
-   Fotos in einem Verzeichnis (auf dem USB-Stick) als Diashow abspielen
-   Playlist von USB-Stick lesen und ausführen
