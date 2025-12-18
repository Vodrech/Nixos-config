{ pkgs, self, ... }:
{
  # Required Home Manager settings
  home.username = "vodrech";
  home.homeDirectory = "/home/vodrech";
  home.stateVersion = "25.11";

  # Packages to install
  home.packages = [
    pkgs.neovim
    pkgs.alacritty
    pkgs.git
  ];

  # Symlinking configurations to .config folder
  home.file.".config/hypr" = {
    source = "${self}/dotfiles/hypr";
    recursive = true;
  };

  home.file.".config/nvim" = {
    source = "${self}/dotfiles/nvim";
    recursive = true;
  };
}

