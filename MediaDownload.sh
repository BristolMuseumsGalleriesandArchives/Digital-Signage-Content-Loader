# author: Mark Pajak
# this script extracts events data and images only from the zipped digital signage folder. 


time=$(date +%k%M)
time=$(date +%k%M)


KioskDir= "$HOME/Desktop/Digisign"
KioskTempDir= "$HOME/Desktop/temp"


# optional time switch if script used on startup
# if [[ "$time" -le 0900 ]];then
echo "morning content download starting"


# download the app and contents from dropbox
curl "https://dl.dropboxusercontent.com/u/244902320/Digital%20Signage.zip" -o "$HOME/Desktop/Digisign.zip" --insecure
# fi

# unzip to a temporary directory
mkdir -p $HOME/Desktop/temp
unzip -o $HOME/Desktop/Digisign -d $HOME/Desktop/temp

# check the unzip worked
if [ -f "$HOME/Desktop/temp/Digital Signage/index.html" ];
 then
echo "index.html exists"
rsync -va --delete "$HOME/Desktop/temp/Digital Signage/images" $HOME/Desktop/Digisign/ 
rsync -va --delete "$HOME/Desktop/temp/Digital Signage/data" $HOME/Desktop/Digisign/ 
rm -r -f "$HOME/Desktop/temp"
else
echo "no files to add - possible issue with content download!"
fi
