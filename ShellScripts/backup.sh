#!/bin/bash
# Author: Gurshabd Singh
if [ $# -eq 0 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SRC="$1"
if [ ! -d "$SRC" ]; then
    echo "Error: folder '$SRC' does not exist."
    exit 1
fi

DEST=~/DeveloperPortfolio_Backups
mkdir -p "$DEST"
TS=$(date +%Y-%m-%d_%H-%M-%S)
FILE="backup_$TS.tar.gz"

if tar -czf "$DEST/$FILE" -C "$(dirname "$SRC")" "$(basename "$SRC")"; then
    SIZE=$(du -h "$DEST/$FILE" | cut -f1)
    echo "Backup successful: $FILE ($SIZE)"
    echo "$TS - SUCCESS - $FILE" >> "$DEST/backup.log"
else
    echo "Backup failed."
    echo "$TS - FAILED - $SRC" >> "$DEST/backup.log"
    exit 1
fi
