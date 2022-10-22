# Videoplayer

Stand-alone Videoplayer mit Raspi

## Installation

1.  Raspian Lite 32-Bit installieren
1.  `sudo apt update`
1.  `sudo apt upgrade`
1.  `sudo apt install vlc`
1.  `sudo apt-get install alsa-base pulseaudio`
1.  `sudo apt-get -f install && sudo apt-get -y autoremove && sudo apt-get autoclean && sudo apt-get clean && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches`
1.  `sudo chown -R $USER:$USER $HOME/`
1.  `sudo reboot`
1.  `sudo nano /boot/config.txt` unkommentieren `hdmi_drive=2`
1.  `sudo raspi-config`, System Options|Audio|1 MAI PCM i2s-hifi-0
1.  `sudo reboot`

## Starte Video in einer Schleife

    cvlc --repeat --file-caching 4000 YORKAR.mp4

Das File-Caching ist notwendig, damit das Video nicht hängenbleibt und die Schleife ohne Verzögerung und Pause wiederholt wird.



