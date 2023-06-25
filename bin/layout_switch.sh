#!/bin/bash

current_layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')

if [ $current_layout = "us" ]; then
    setxkbmap it 
else
    setxkbmap us
fi
