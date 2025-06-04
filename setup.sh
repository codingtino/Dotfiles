#!/bin/bash

######################################################################
# Title: Dotfiles                                                    #
# Author: Tino Naumann                                               #
# Repository: https://github.com/codingtino/Dotfiles                 #
######################################################################

set -euo pipefail


## is user an admin?

## install xcode
while ! xcode-select -p &>/dev/null; do
    xcode-select --install &>/dev/null
    echo "Waiting for Xcode installation to complete..."
    sleep 10
done

## install Nix
sh <(curl -L https://nixos.org/nix/install) --yes

## get Dotfiles
/nix/var/nix/profiles/default/bin/nix run --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git clone https://github.com/codingtino/Dotfiles.git ~/.config

## set hostname
sed -i '' "s/simple/$(scutil --get LocalHostName)/" ~/.config/nix-darwin/flake.nix

## allow nix-experimental
cat << EOF | sudo tee -a /etc/nix/nix.conf
experimental-features = nix-command flakes
EOF

## copy Rectangle-Config to default Path
#mv ~/.config/Rectangle/ ~/Library/Application\ Support/
#mv ~/.config/com.raycast.macos/ ~/Library/Application\ Support/
#mv ~/.config/Services/* ~/Library/Services/
mv ~/.config/Preferences/com.knollsoft.* ~/Library/Preferences/
mv ~/.config/.hammerspoon/* ~/.hammerspoon

# todo
## setup the keyboard-shortcut for cycling through windows to hyper+c
## shortcat preferences restor dosen't work


## install nix-darwin
/nix/var/nix/profiles/default/bin/nix run nix-darwin -- switch --flake ~/.config/nix-darwin

## open every app to grant permissions

open -a Shortcat
echo "opened Shortcat"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

open -a Rectangle
echo "opened Rectangle"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

open -a Hyperkey
echo "opened Hyperkey"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

open -a Hammerspoon
echo "opened Hammerspoon"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

#open -a Karabiner-Elements
#echo "opened Karabiner-Elements"
#echo "Press 'y' to continue..."
#while :; do
#    read -n 1 -s key  # Read one character silently (no echo)
#    if [[ $key == "y" ]]; then
#        break
#    fi
#done

#open -a Karabiner-EventViewer
#echo "opened Karabiner-EventViewer"
#echo "Press 'y' to continue..."
#while :; do
#    read -n 1 -s key  # Read one character silently (no echo)
#    if [[ $key == "y" ]]; then
#        break
#    fi
#done

#open -a Raycast
#echo "opened Raycast"
#echo "Press 'y' to continue..."
#while :; do
#    read -n 1 -s key  # Read one character silently (no echo)
#    if [[ $key == "y" ]]; then
#        break
#    fi
#done

