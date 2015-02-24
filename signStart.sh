#!/bin/sh
cd /home/signagepc1/scripts
time=$(date +%d%m%k%M)
echo "sign update script started on $time" >>updatelog


until wget -q -O - http://www.google.com | grep Lucky > /dev/null; do
echo "waiting for internet connection..." >>updatelog
case "$(pidof chrome | wc -w)" in

0)  echo "starting chrome in local file mode"  >>updatelog
    sh startChrome.sh
    ;;
1)  echo "chrome already running"  >>updatelog
    ;;
esac
sleep 10
done

exec $1&


#get latest update instructions
curl "https://dl.dropboxusercontent.com/u/244902320/Digital%20Signage/scripts/update.JSON" -o "/home/signagepc1/scripts/update.JSON" --insecure

#check what the update command is
UpdateCommand=$(grep -Po '(?<="updateCommand": ")[^"]*' /home/signagepc1/scripts/update.JSON)

machineName=$(grep -Po '(?<="machineName": ")[^"]*' /home/signagepc1/scripts/settings.JSON)
echo "$machineName"

command="ALL"

if [ "$UpdateCommand" = "$command"  ]; then 
    echo "update whole app" >>updatelog

sh SignDownload.sh
elif [ "$UpdateCommand" = "$machineName"  ];then
 echo "$UpdateCommand = $machineName" >>updatelog
 echo "one off update starting" >>updatelog
sh SignDownload.sh

elif  [ ! -d "/home/signagepc1/Desktop/Digisign" ]; then

 echo "cant find folder - downloading whole app " >>updatelog
sh SignDownload.sh


else 

  echo "update media only" >>updatelog
sh MediaDownload.sh
    
fi

sh startChrome.sh




