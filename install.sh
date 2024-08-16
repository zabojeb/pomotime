#!/bin/bash

# Clone the repository
git clone https://github.com/zabojeb/pomotime.git pomotime
cd pomotime

# Install pipx if it's not already installed
if ! command -v pipx &> /dev/null
then
    echo "pipx could not be found. Installing pipx..."
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    export PATH="$HOME/.local/bin:$PATH"
fi

# Install dependencies using pipx
pipx install .

# Move the executable script
sudo mv pomotime /usr/local/bin/pomotime
sudo chmod +x /usr/local/bin/pomotime

# Create config directory and move the files
mkdir -p ~/.config/pomotime
mv sounds ~/.config/pomotime/sounds
mv pomotime.toml ~/.config/pomotime/pomotime.toml
mv LICENSE ~/.config/pomotime/LICENSE
mv README.md ~/.config/pomotime/README.md

# Clean up the repository
rm -rf .git .gitignore requirements.txt install.sh

# Navigate back and remove the directory
cd ..
rmdir pomotime

echo "Pomotime installed successfully!"
