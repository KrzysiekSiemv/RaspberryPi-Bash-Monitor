#!/bin/bash

# Muzyka z CMUS
artist=$(cmus-remote -Q | grep 'tag artist' | cut -d ' ' -f 3-)
album=$(cmus-remote -Q | grep 'tag album ' | cut -d ' ' -f 3-)
title=$(cmus-remote -Q | grep 'tag title' | cut -d ' ' -f 3-)
file=$(cmus-remote -Q | grep 'file' | cut -d ' ' -f 2-)

echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Obecnie grane na Console Music Player"
echo "      Tytul:              $title"
echo "      Album:              $album"
echo "      Autor:              $artist"
echo "      Plik:               $file"
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "                          Skrypt napisany przez: Krzysztof 'KrzysiekSiemv' Smaga (https://github.com/KrzysiekSiemv)"