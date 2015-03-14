#!/bin/sh
LOCATION=$(grep -Po '(?<="location": ")[^"]*' $HOME/scripts/settings.JSON)

echo "$LOCATION"
google-chrome-stable  "file:///home/signagepc1/Desktop/Digisign/index.html#/$LOCATION" --allow-file-access-from-files --kiosk --incognito

