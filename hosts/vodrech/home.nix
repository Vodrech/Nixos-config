{pkgs, dotfiles, ... }:
{
  home.username = "vodrech";
  home.homeDirectory = "/home/vodrech";
  home.stateVersion = "25.11";

  home.packages = [
    pkgs.swww
  ];

  # Hyprland
  home.file.".config/hypr" = {
    source = "${dotfiles}/hypr";
    force = true;
  };

  # Waybar
  home.file.".config/waybar" = {
    source = "${dotfiles}/waybar";
    force = true;
  };

  # Neovim
  home.file.".config/nvim" = {
    source = "${dotfiles}/nvim";
    force = true;
  };
}
