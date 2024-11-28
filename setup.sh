#!/bin/bash

######################################################################
# Title: Dotfiles                                                    #
# Author: Tino Naumann                                               #
# Repository: https://github.com/codingtino/Dotfiles                 #
######################################################################

set -euo pipefail


## install xcode
#xcode-select --install

## install Nix
sh <(curl -L https://nixos.org/nix/install) --yes

## get Dotfiles
/nix/var/nix/profiles/default/bin/nix run --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git clone https://github.com/codingtino/Dotfiles.git ~/.config
#/nix/var/nix/profiles/default/bin/nix-shell -p git --run 'git clone https://github.com/codingtino/Dotfiles.git ~/.config'


## set hostname
sed -i '' "s/simple/$(scutil --get LocalHostName)/" ~/.config/nix-darwin/flake.nix

## isntall nix-darwin
/nix/var/nix/profiles/default/bin/nix run nix-darwin -- switch --flake ~/.config/nix-darwin
