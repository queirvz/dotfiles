
# Syncthing setup script

## Warp AI Transcript (03/22/23 12:05 PM)

Prompt: generate a script to setup syncthing
Warp AI: Here's a script to install and setup Syncthing on MacOS.

```zsh
#!/bin/zsh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Syncthing
brew install syncthing

# Create Syncthing configuration directory
mkdir -p ~/.config/syncthing

# Generate Syncthing configuration file
cat > ~/.config/syncthing/config.xml <<EOF
<configuration version="30">
    <folder id="default" label="Default Folder" path="/path/to/folder">
        <device id="device-id" name="device-name" compression="metadata" introducedBy=""></device>
    </folder>
    <gui enabled="true" tls="false">
        <address>127.0.0.1:8384</address>
        <user>username</user>
        <password>password</password>
    </gui>
    <options>
        <listenAddress>0.0.0.0:22000</listenAddress>
        <globalAnnounceServer>announce.syncthing.net:22025</globalAnnounceServer>
        <localAnnounceServer>announce.local.syncthing.net:22025</localAnnounceServer>
        <autoUpgradeIntervalH>12</autoUpgradeIntervalH>
        <startBrowser>false</startBrowser>
    </options>
</configuration>
EOF

# Replace /path/to/folder with the actual path to the folder you want to sync
# Replace device-id and device-name with the ID and name of the device you want to sync with
# Replace username and password with the desired username and password for the Syncthing web GUI

# Start Syncthing
syncthing

```

Make sure to replace the placeholders in the configuration file with the appropriate values for your setup. Once you've saved the script, make it executable with `chmod +x script.sh` and run it with `./script.sh`.
