#!/bin/bash
#
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
CLIPPINGS_PATH="/Volumes/Kindle/documents/My Clippings.txt"
OUTPUT_PATH="$HOME/Dropbox (Personal)/Reading/Clippings/"

if [ -f "$CLIPPINGS_PATH" ]; then
  echo "Clippings file found"
  cp "$CLIPPINGS_PATH" "$SCRIPTPATH/"
  pipenv run ./kindle.py
  mkdir -p "$OUTPUT_PATH"
  rsync -av --exclude=".*" "$SCRIPTPATH/output/" "$OUTPUT_PATH/"
else
  echo "File not found, make sure your Kindle is plugged in!"
fi