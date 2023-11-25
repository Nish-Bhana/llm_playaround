#!/bin/bash

# Replace these variables with your desired Python version and environment name
PYTHON_VERSION="3.11.1"
ENV_NAME="llm_playaround"

# Check if the specified Python version is installed
if ! pyenv versions | grep -q $PYTHON_VERSION; then
    echo "Installing Python $PYTHON_VERSION..."
    pyenv install $PYTHON_VERSION
fi

# Create the virtual environment
echo "Creating virtual environment '$ENV_NAME' with Python $PYTHON_VERSION..."
pyenv virtualenv $PYTHON_VERSION $ENV_NAME

# Activate the virtual environment
echo "Activating the virtual environment '$ENV_NAME'..."
pyenv activate $ENV_NAME

pip install --upgrade pip

# Your script can include commands that should run inside the virtual environment
echo "Installing dependencies..."
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "No requirements.txt file found"
fi

# Set up the virtual environment as a Jupyter kernel
echo "Setting up Jupyter kernel..."
pip install ipykernel
python -m ipykernel install --user --name="$ENV_NAME"

pyenv local $ENV_NAME

# Note: This script doesn't include the deactivation step. Typically, you'd
# deactivate the environment manually when you're done with it.