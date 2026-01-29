#!/bin/bash

FAN_PATH="./feeds/fancontrol"
FAN_JS="$FAN_PATH/luci-app-fancontrol/htdocs/luci-static/resources/view/fancontrol.js"
[ ! -f "$FAN_JS" ] && FAN_JS=$(find $FAN_PATH -name "fancontrol.js")
if [ -f "$FAN_JS" ]; then
    sed -i 's/read_direct/trimmed/g' "$FAN_JS"
fi

sed -i 's/192.168.1.1/10.10.0.1/g' ./package/base-files/files/bin/config_generate
mkdir ./package/custom
git clone https://github.com/sbwml/autocore-arm.git ./package/custom/
./scripts/feeds install -a
