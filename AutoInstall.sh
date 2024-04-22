#!/bin/bash

# Bash script for setting up the project environment on MinGW for Windows

echo "Setting up the OnlyFans project environment..."

# Navigate to the project directory (change this path according to your actual project path)
cd ~/onlyfans

# Check if the required directories exist, if not, create them
directories=("apis" "classes" "database" "datascraper" "examples" "extras" "helpers" "modules" "tests")

for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Creating directory $dir..."
        mkdir -p $dir
    else
        echo "Directory $dir already exists."
    fi
done

# Install Python dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found, skipping Python dependencies installation."
fi

# Additional setup can be placed here
# For example, database initialization or other preparatory tasks

# Start the application or run your start script
if [ -f "start_ofd.py" ]; then
    echo "Starting the application..."
    python start_ofd.py
else
    echo "Start script not found, make sure start_ofd.py is available."
fi

echo "Setup complete."
