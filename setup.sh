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

## copy Rectangle-Config to default Path
#mv ~/.config/Rectangle/ ~/Library/Application\ Support/
#mv ~/.config/com.raycast.macos/ ~/Library/Application\ Support/
mv ~/.config/Services/* ~/Library/Services/
mv ~/.config/com.apple.symbolichotkeys.plist ~/Library/Preferences/

## isntall nix-darwin
/nix/var/nix/profiles/default/bin/nix run nix-darwin -- switch --flake ~/.config/nix-darwin

## open every app to grant permissions

open -a Homerow
echo "opened Homerow"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

#open -a Rectangle
#echo "opened Rectangle"
#echo "Press 'y' to continue..."
#while :; do
#    read -n 1 -s key  # Read one character silently (no echo)
#    if [[ $key == "y" ]]; then
#        break
#    fi
#done

open -a Karabiner-Elements
echo "opened Karabiner-Elements"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

open -a Karabiner-EventViewer
echo "opened Karabiner-EventViewer"
echo "Press 'y' to continue..."
while :; do
    read -n 1 -s key  # Read one character silently (no echo)
    if [[ $key == "y" ]]; then
        break
    fi
done

#open -a Raycast
#echo "opened Raycast"
#echo "Press 'y' to continue..."
#while :; do
#    read -n 1 -s key  # Read one character silently (no echo)
#    if [[ $key == "y" ]]; then
#        break
#    fi
#done
