{config, pkgs, ...}:
{
  # System packages
  environment.systemPackages = with pkgs; [
    vim # Based editor
    neovim # Another Based editor
		opencode # AI Code Agent
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
    ripgrep # Grep tool

    # SHOULD BE REMOVED?
    pavucontrol # Sound controller | find better solution
    swaybg # UNKNOWN if used
    grim # UNKNOWN | good with slurp
    slurp # UNKNOWN | good with grim
  ];

  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

	environment.variables.TERMINAL = "wezterm";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,us,se";
    variant = ",colemak,";
  };
}
