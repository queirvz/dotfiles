from: https://github.com/OpenBB-finance/OpenBBTerminal/blob/main/openbb_terminal/README.md#anaconda--python

# add to the end of ~/.bashrc file
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

# source the file
source ~/.bashrc

```zsh
conda activate openbb

/Users/$USER/.miniconda/envs/obb/bin/pip install --upgrade openbb
```
