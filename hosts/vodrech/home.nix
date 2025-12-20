{pkgs, dotfiles, ... }:
{
  home.username = "vodrech";
  home.homeDirectory = "/home/vodrech";
  home.stateVersion = "25.11";

  #home.packages = with pkgs; [
  # vim
  #];

  # Symlink submodule directories to .config
  # home.file.".config/hypr".source = "${dotfiles}/hypr"

  #home.file.".config/hypr" = {
  #  source = "${dotfiles/hypr}";
  #  force = true; # <- This allows HM to overwrite the file
  #};

  home.file.".config/waybar".source = "${dotfiles}/waybar";
  home.file.".config/nvim".source = "${dotfiles}/nvim";
  home.file.".config/hypr" = {
    source = "${dotfiles}/hypr";
    force = true;
  };
}
