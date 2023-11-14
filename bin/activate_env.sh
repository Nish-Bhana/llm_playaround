#!/bin/bash

# Define the path to the virtual environment
ENV_PATH="./virtual_env"

# Check if the virtual environment directory exists
if [ -d "$ENV_PATH" ]; then
    echo "Activating virtual environment: $ENV_PATH"
    source "$ENV_PATH/bin/activate"
    echo "Virtual environment activated."
else
    echo "Virtual environment not found at $ENV_PATH."
    exit 1
fi
