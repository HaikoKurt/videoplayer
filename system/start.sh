#! /bin/bash

playfile() {
    echo "$1"/play.txt
}

play() {
    unset OPT
    PLAYFILE=$(playfile "$1")
    if test -f "$PLAYFILE" ; then
        if ! grep -q "once" "$PLAYFILE" ; then
            OPT="--loop"
        fi
    else
        OPT="--loop"
    fi
    VIDEOS=( "$1"/*.mp4 )
    if test -f "${VIDEOS[0]}" ; then
        echo "Play: ${VIDEOS[0]} / $OPT"
        omxplayer $OPT -o hdmi "${VIDEOS[0]}"
        exit 0
    fi
}

USB=/media/usb
LOCAL=/home/pi/media
PLAYFILE=$(playfile $USB)

if test -f "$PLAYFILE" ; then
    if grep -q "copy" "$PLAYFILE" ; then
        echo "Copy: $USB -> $LOCAL"
        mkdir -p "$LOCAL"
        rm -f "$LOCAL"/*
        cp "$USB"/* "$LOCAL"
        play "$LOCAL"
    fi
fi

play $USB
play $LOCAL
