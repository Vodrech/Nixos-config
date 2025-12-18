{ pkgs, ... }:

{
  # Required Home Manager settings
  home.username = "vodrech";
  home.homeDirectory = "/home/vodrech";
  home.stateVersion = "25.11";  # required!

  # Packages to install
  home.packages = [
    pkgs.neovim
    pkgs.alacritty
    pkgs.git
  ];
}

