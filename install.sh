#$!/bin/bash

MACBOOK=$(curl -s "https://support-sp.apple.com/sp/product?cc=$(system_profiler SPHardwareDataType| awk '/Serial/ {print $4}'| cut -c 9-)" |sed -En "s/.*<configCode>(.*) \(([0-9\.]+)-inch, ([0-9]+).*/\1;\2;\3/p")
SIZE=$(echo $MACBOOK| cut -d';' -f2)
ESCAPE=""
if [[ "$SIZE" != "16" ]]; then
    ESCAPE='{"type": "escape","width": 64,"align": "left"},'
fi

if [ -f ".config.sh" ]; then
    echo "using last settings. delete .config.sh if you want to start from scratch"
    source ".config.sh"
else

    read -p "username: " INPUT_USERNAME

    read -p "password (will be hashed): " PASSWORD
    PASSWORD=$(/bin/echo -n $PASSWORD | sha1sum | awk '{print $1}')
    echo "password hash: $PASSWORD"

    FULLNAME="Max Mustermensch"
    read -p "Full Name: [$FULLNAME] " FULLNAME

    STATUS_URL=""
    read -p "status url: " STATUS_URL

    TRACKING_URL=""
    read -p "tracking url: " TRACKING_URL=""

fi

FULL_TRACKING_URL="${TRACKING_URL}?name=${INPUT_USERNAME}&secret=${PASSWORD}"

cp items.json.example items.json
sed -i "" "s#//ESCAPE#$ESCAPE#" items.json
sed -i "" "s#<FULLNAME>#$FULLNAME#g" items.json
sed -i "" "s#<TRACKING_URL>#$FULL_TRACKING_URL#g" items.json
sed -i "" "s#<STATUS_URL>#$STATUS_URL#g" items.json
mkdir -p "$HOME/Library/Application Support/MTMR/"
cp items.json "$HOME/Library/Application Support/MTMR/"
echo "saving settings"
echo "INPUT_USERNAME=\"$INPUT_USERNAME\"" > .config.sh
echo "PASSWORD=\"$PASSWORD\"" >> .config.sh
echo "FULLNAME=\"$FULLNAME\"" >> .config.sh
echo "TRACKING_URL=\"$TRACKING_URL\"" >> .config.sh
echo "STATUS_URL=\"$STATUS_URL\"" >> .config.sh
echo "install complete"
