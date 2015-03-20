# author Mark Pajak (Bristol Museums Galleries and Archives)
# this script starts google Chrome in Kiosk mode
#!/bin/sh
LOCATION=$(grep -Po '(?<="location": ")[^"]*' $HOME/scripts/settings.JSON)

echo "$LOCATION"
google-chrome-stable  "file:///$HOME/Desktop/Digisign/index.html#/$LOCATION" --allow-file-access-from-files --kiosk --incognito

