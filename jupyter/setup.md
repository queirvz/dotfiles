# Jupyter Notebook Setup

This script activates the virtual environment, installs Jupyter, generates a default Jupyter config file, creates a directory for the custom config file, copies the default config file to the custom directory, and deactivates the virtual environment. You can run this script in the terminal by navigating to the directory where it is saved and running `./script.sh`.

The instructions generate a setup script for a Jupyter `_config.yml` file located in a Python virtual environment at `venv/etc/jupyter`

```zsh
#!/bin/zsh

# Activate the virtual environment
source venv/bin/activate

# Install Jupyter
pip install jupyter

# Generate a default Jupyter config file
jupyter notebook --generate-config

# Create a directory for the custom config file
mkdir -p venv/etc/jupyter

# Stow the default config file to the custom directory
cp ~/.jupyter/jupyter_notebook_config.py venv/etc/jupyter/

stow 

# Deactivate the virtual environment
deactivate

echo "✅"
```
