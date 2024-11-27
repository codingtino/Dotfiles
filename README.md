# Dotfiles

## install Nix
sh <(curl -L https://nixos.org/nix/install) --yes

## get Dotfiles
zsh nix run --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git clone https://github.com/codingtino/Dotfiles.git .config

## set hostname
sed -i '' "s/simple/$(scutil --get LocalHostName)/" ~/.config/nix-darwin/flake.nix

## isntall nix-darwin
zsh nix run nix-darwin -- switch --flake ~/.config/nix-darwin

