#!/bin/bash
set -e

# Set the required Python version
required_python_version="python3.11"

# Check for Python 3.11 and pip3 installation
if ! command -v $required_python_version &> /dev/null; then
    echo "$required_python_version could not be found. Please install it and rerun the script."
    exit 1
fi

if ! command -v pip3 &> /dev/null; then
    echo "pip3 could not be found. Please ensure it is installed and rerun the script."
    exit 1
fi

environment_name="virtual_env"

# Create a Python virtual environment
echo "Creating a virtual environment named $environment_name..."
$required_python_version -m venv "$environment_name"

# Activate the virtual environment
source "$environment_name/bin/activate"

# Upgrade pip
echo "Upgrading pip in the virtual environment..."
pip install --upgrade pip

# Install key packages
echo "Installing key packages: Jupyter, NumPy, pandas, Matplotlib, SciPy..."
pip install jupyter numpy pandas matplotlib scipy

# Set up the virtual environment as a Jupyter kernel
echo "Setting up Jupyter kernel..."
pip install ipykernel
$required_python_version -m ipykernel install --user --name="$environment_name"

echo "Setup complete. Virtual environment '$environment_name' is ready and added as a Jupyter kernel."