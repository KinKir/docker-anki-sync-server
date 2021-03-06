#!/bin/sh

if [ -f "/app/data/ankisyncd.conf" ]; then
    echo "ankisyncd.conf found"
else
    echo "Creating new configuration file: ankisyncd.conf."
    cp "/app/config/ankisyncd.conf.example" "/app/data/ankisyncd.conf"
fi

if [ -f "/app/data/auth.db" ]; then
    echo "auth.db found"
else
    echo "Creating new authentication database: auth.db."
    sqlite3 /app/data/auth.db 'CREATE TABLE auth (user VARCHAR PRIMARY KEY, hash VARCHAR)'
fi

if [ -d "/app/data/collections" ]; then
    echo "collections directory exists"
else
    echo "Creating collections directory: collections."
    mkdir "/app/data/collections"
fi

echo Starting tsudoko\'s anki-sync-server
python -m ankisyncd
