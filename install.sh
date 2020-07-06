#$!/bin/bash

read -p "statefile location [$HOME/bin]:" STATE_PATH
STATE_PATH=${STATE_PATH:-"$HOME/bin"}
mkdir -p "${STATE_PATH}"

read -p "username: " USERNAME

read -p "password (wird gehashed): " PASSWORD
PASSWORD=$(echo -n "$PASSWORD" | sha1sum | awk '{print $1}')
echo "password hash: $PASSWORD"


cp items.json.example items.json
sed -i "" "s#<USERNAME>#$USERNAME#g" items.json
sed -i "" "s#<PASSWORD>#$PASSWORD#g" items.json
sed -i "" "s#<STATE_PATH>#$STATE_PATH#g" items.json
mkdir -p "$HOME/Library/Application Support/MTMR/"
cp items.json "$HOME/Library/Application Support/MTMR/"
echo "pause" > "$STATE_PATH/smalltime.state"
echo "install complete"
