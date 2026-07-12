# Update packages
nix flake update

# Update only the dotfiles
nix flake lock --update-input dotfiles

# Rebuild System
nixos-rebuild switch --flake .#USER
