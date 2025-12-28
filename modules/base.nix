{config, pkgs, ...}:
{
  # System packages
  environment.systemPackages = with pkgs; [
    vim # Based editor
    neovim # Another Based editor
    wezterm # Terminal
    kitty # Terminal
    git # Version Control
    firefox # Web Browser
    wofi # App Launch Manager
    wget # File Fetcher
    dunst # Notification Manager
    waybar # Wayland - Statusbar
    jq # Json Parser
    clamav # Antivirus
    nerd-fonts.fira-code # NerdFont
    bibata-cursors # Cursor Library
    playerctl # Media Controller
    nitch  # System Display terminal
    xdg-desktop-portal-hyprland # Backend Hyprland
    wl-clipboard # Clipboard terminal
    libnotify # Notification
    nftables # IPTables replacement
    inotify-tools # Notification tools

    # SHOULD BE REMOVED?
    pavucontrol # Sound controller | find better solution
    swaybg # UNKNOWN if used
    grim # UNKNOWN | good with slurp
    slurp # UNKNOWN | good with grim
  ];
}
