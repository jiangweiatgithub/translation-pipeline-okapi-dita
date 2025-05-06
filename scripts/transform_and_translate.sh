#!/bin/bash
set -e

echo "[Step 1] Transforming XML to TMX..."
xsltproc ./xslt/ENG-ESP_BT_Updated.xslt ./data/ENG-ESP_BT_Updated.xml > ./data/ENG-ESP_BT_Updated.tmx
echo "TMX created at ./data/ENG-ESP_BT_Updated.tmx"

echo "[Step 2] Translating DITA using Okapi Rainbow..."
java -jar Rainbow.jar ./okapi/translate.rnb
echo "Translation completed!"
