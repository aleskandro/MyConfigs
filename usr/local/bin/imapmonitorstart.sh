#!/bin/bash

for i in $(echo 'madfarm gmail mail lucylaika')
do
    imap_monitor.py /home/aleskandro/.mutt/${i}_monitor.ini &
done
