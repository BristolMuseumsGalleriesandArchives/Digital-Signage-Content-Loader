
time=$(date +%k%M)
time=$(date +%k%M)


KioskDir= "/home/signagepc1/Desktop/Digisign"
KioskTempDir= "/home/signagepc1/Desktop/temp"


# optional time switch if script used on startup
# if [[ "$time" -le 0900 ]];then
echo "morning content download starting"


# download the app and contents from dropbox
curl "https://dl.dropboxusercontent.com/u/244902320/Digital%20Signage.zip" -o "/home/signagepc1/Desktop/Digisign.zip" --insecure
# fi

# unzip to a temporary directory
mkdir -p /home/signagepc1/Desktop/temp
unzip -o /home/signagepc1/Desktop/Digisign -d /home/signagepc1/Desktop/temp

# check the unzip worked
if [ -f "/home/signagepc1/Desktop/temp/Digital Signage/index.html" ];
 then
echo "index.html exists"
rsync -va --delete "/home/signagepc1/Desktop/temp/Digital Signage/images" /home/signagepc1/Desktop/Digisign/ 
rsync -va --delete "/home/signagepc1/Desktop/temp/Digital Signage/data" /home/signagepc1/Desktop/Digisign/ 
rm -r -f "/home/signagepc1/Desktop/temp"
else
echo "no files to add - possible issue with content download!"
fi
