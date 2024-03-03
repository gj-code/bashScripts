#! /bin/bash

#### Variables ####

DESKTOP_PATH="/home/neosoft/Desktop/"
FOLDER_NAME="node-boilerplate"
FILE_NAME="index.js"


echo "This script will generate node.js boilerplate"
echo

#### This command will generate a folder inside desktop ####
cd "$DESKTOP_PATH"

if [ ! -d "$FOLDER_NAME" ]; then
	mkdir "$FOLDER_NAME"
fi

#### go inside that folder ####
cd "$FOLDER_NAME"

#### create a file index.js ####
touch "$FILE_NAME"

#### Write multiple lines to index.js ####
cat <<EOF > "$FILE_NAME"
const express = require("express")
const app = express()
const port = process.env.PORT || 3000

app.listen(port, () => {
	console.log("Server is listening on port ${port}")
})

EOF

#### This command will create package.json ####
npm init -y

npm i express > /dev/null

sudo apt-get update > /dev/null
sudo apt-get install jq > /dev/null

#### Update start script in package.json using jq ####
jq '.scripts += {"start": "node index.js"}' package.json > tmp.json && mv tmp.json package.json

#### Print the updated package.json for verification ####

echo "Updated package.json:"
cat package.json

code .

#### Run npm run start in the inregrated terminal of VS Code ####
echo "Please run 'npm run start' in the integrated terminal of VS Code."
