#$!/bin/bash

read -p "statefile location [$HOME/bin]:" STATE_PATH
STATE_PATH=${STATE_PATH:-"$HOME/bin"}

read -p "username: " USERNAME

read -p "password (wird gehashed): " PASSWORD
PASSWORD=$(echo "$PASSWORD" | sha1sum | awk '{print $1}')
echo "password hash: $PASSWORD"

cp items.json.example items.json
sed -i "" "s#<USERNAME>#$USERNAME#g" items.json
sed -i "" "s#<PASSWORD>#$PASSWORD#g" items.json
sed -i "" "s#<STATE_PATH>#$STATE_PATH#g" items.json
cp items.json $HOME/Library/Application Support/MTMR/
echo "pause" > "$STATE_PATH/smalltime.state"
echo "install complete"
