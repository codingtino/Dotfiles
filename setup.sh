#!/bin/bash

######################################################################
# Title: Dotfiles                                                    #
# Author: Tino Naumann                                               #
# Repository: https://github.com/codingtino/Dotfiles                 #
######################################################################

set -euo pipefail


## install xcode
#if ! [[ "xcode-select -p" ]]; then
#    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
#    PROD=$(
#        grep "Label:" |
#        awk -F ': ' 'END{print $2}'
#    )
#    softwareupdate -i "$PROD" --verbose
#    rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
#fi
xcode-select --install
while ! [[ $(xcode-select -p &>/dev/null) ]]; do
    echo "Waiting for Xcode installation to complete..."
    sleep 10
done

## install Nix
sh <(curl -L https://nixos.org/nix/install) --yes

## get Dotfiles
/nix/var/nix/profiles/default/bin/nix run --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git clone https://github.com/codingtino/Dotfiles.git ~/.config

## set hostname
sed -i '' "s/simple/$(scutil --get LocalHostName)/" ~/.config/nix-darwin/flake.nix

## isntall nix-darwin
/nix/var/nix/profiles/default/bin/nix run nix-darwin -- switch --flake ~/.config/nix-darwin

