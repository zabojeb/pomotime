#!/bin/bash

git clone https://github.com/zabojeb/pomotime.git pomotime
cd pomotime

sudo mv pomotime /usr/local/bin/pomotime
sudo chmod +x /usr/local/bin/pomotime

mkdir -p ~/.config/pomotime
mv sounds ~/.config/pomotime/sounds
mv pomotime.toml ~/.config/pomotime/pomotime.toml
mv LICENSE ~/.config/pomotime/LICENSE
mv README.md ~/.config/pomotime/README.md

rm -rf .git .gitignore install.sh

cd ..
rmdir pomotime

sudo sed -i 's/\r//' /usr/local/bin/pomotime
sudo sed -i 's/\r//' ~/.config/pomotime/pomotime.toml

echo "Pomotime installed succesfully!"
