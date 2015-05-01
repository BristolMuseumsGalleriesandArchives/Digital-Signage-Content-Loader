#!/bin/sh
LOCATION=$(grep -Po '(?<="location": ")[^"]*' $HOME/scripts/settings.JSON)

echo "$LOCATION"
google-chrome-stable  "file:///$HOME/Desktop/Digisign/index.html#/events/$LOCATION" --allow-file-access-from-files --kiosk --incognito
