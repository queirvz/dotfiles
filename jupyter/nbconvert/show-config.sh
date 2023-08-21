#! /bin/zsh

source ~/lab/repo/venv/bin activate \
jupyter nbconvert --show-config-json \

# Run the command and save the output to the file
jupyter nbconvert --show-config-json > jupyter.nbconvert.show-config.json \

# sudo chmod +x jupyter_nbconvert_show_config.sh \

echo "config saved saved to jupyter.nbconvert.show-config.json"
