{config, pkgs, ...}:
{
  # System packages
  environment.systemPackages = with pkgs; [

	  # Mandatory
    vim # Based editor
		herdr # Multiplexer agents
    neovim # Another Based editor
		hyprcursor # Cursor Theme
		awww # Wallpaper Engine
    walker # App Launch Manager
		elephant # Data Provider for Walker
    wezterm # Terminal
    git # Version Control
    firefox # Web Browser
    dunst # Notification Manager
    waybar # Wayland - Statusbar
    nerd-fonts.fira-code # NerdFont
		matugen # Color Generation Tool
		quickshell # Overlay Interface toolkit
		claude-code # Cluade
		firejail # Networking

		# Necessary
		opencode # AI Code Agent
    kitty # Terminal
    wget # File Fetcher
    jq # Json Parser
    clamav # Antivirus
    bibata-cursors # Cursor Library
    playerctl # Media Controller
    nitch  # System Display terminal
    wl-clipboard # Clipboard terminal
    libnotify # Notification
    nftables # IPTables replacement
    inotify-tools # Notification tools
    ripgrep # Grep tool
		ffmpeg # MP4 Converter

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
