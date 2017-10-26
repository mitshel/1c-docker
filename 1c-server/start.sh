#!/bin/bash

if [ ! -d /home/usr1cv8/.1cv8 ]; then
    # Выставляем правильные права доступа
    chown -R usr1cv8:grp1cv8 /home/usr1cv8
    chmod -R 755 /home/usr1cv8
fi


sudo -u usr1cv8 /opt/1C/v8.3/x86_64/ragent

