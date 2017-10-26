#!/bin/bash

if [ ! -f /var/lib/pgsql/9.6/data/PG_VERSION ]; then
    # Выставляем правильные права доступа
    chown -R postgres:postgres /var/lib/pgsql/9.6/data
    chmod -R 700 /var/lib/pgsql/9.6/data

    # Инициализируем системные таблицы
    echo baza1c > /tmp/pwd
    sudo -u postgres /usr/pgsql-9.6/bin/initdb -D /var/lib/pgsql/9.6/data --locale=ru_RU.UTF-8 --pwfile=/tmp/pwd
fi

cp -f /home/distr/*.conf /var/lib/pgsql/9.6/data/
sudo -u postgres /usr/pgsql-9.6/bin/postmaster -D /var/lib/pgsql/9.6/data

