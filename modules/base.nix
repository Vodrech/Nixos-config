{config, pkgs, ...}:
{
  # System packages
  environment.systemPackages = with pkgs; [
    vim # Based editor
    nvim # Another Based editor
    wezterm # Terminal
    git # Version Control
    firefox # Web Browser
    wofi # App Launch Manager
    dunst # Notification Manager
  ];
}
