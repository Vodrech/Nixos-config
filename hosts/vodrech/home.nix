{pkgs, dotfiles, ... }:
{
  home.username = "vodrech";
  home.homeDirectory = "/home/vodrech";
  home.stateVersion = "25.11";

  #home.packages = with pkgs; [
  # vim
  #];

  # Symlink submodule directories to .config
  home.file.".config/hypr".source = "${dotfiles}/hypr";
  home.file.".config/nvim".source = "${dotfiles}/nvim";
}
