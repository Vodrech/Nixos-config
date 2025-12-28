{ config, pkgs, ... }:
{

imports = [
  ./hardware-configurations.nix # DO NOT REMOVE
  ../../modules/lsp.nix
  ../../modules/builders.nix
];

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "vodrech"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  
  # Experimental
  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vodrech = {
    isNormalUser = true;
    description = "Vodrech";
    uid=1000;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  networking.firewall = {
    enable = true;
    backend = "nftables";
  };

  users.users.sandboxuser = {
    isNormalUser = true;
    uid = 1001; # Identifier
    description = "Sandbox user";  
  };

  networking.nftables.enable = true;
  networking.nftables.ruleset = ''
    table inet sandbox {
      chain input {
        type filter hook forward priority 0;
	policy drop;
	iif lo accept;

      }
      chain output {
        type filter hook output priority 0;
	policy accept;
        meta skuid 1001 drop;
      }
    }
  '';

  #Enable Wayland & Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security.polkit.enable = true;
  services.dbus.enable = true;


  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "hyprland";
      default_session.user = "vodrech";
      default_session.environment = {
	WAYLAND_DISPLAY = "wayland-0";
	XDG_RUNTIME_DIR = "/run/user/1000";
      };
      greeter.command = "bmenu-run";
      greeter.user = "vodrech";
    };
  };

  hardware.graphics.enable = true;
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nftables
    vim # Based editor
    neovim # Another Based editor
    wezterm # Terminal
    alacritty # REMOVE LATER
    inotify-tools
    git # Version Control
    firefox # Web Browser
    wofi # App Launch Manager
    dunst # Notification Manager
    nitch
    kitty
    wget
    waybar
    rofi
    grim
    slurp
    swaybg
    xdg-desktop-portal-hyprland
    wl-clipboard
    pavucontrol
    lutris
    wineWowPackages.staging
    winetricks
    discord
    spotify
    mangohud
    libnotify
    nerd-fonts.fira-code
    bibata-cursors # Cursor lib
    playerctl
    jq
    python314
    clamav
  ];

  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };


  # Font
  fonts.fonts = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.roboto-mono
  ];

  programs.gamemode = {
    enable = true;
  };

environment.variables.TERMINAL = "wezterm";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,us,se";
    variant = ",colemak,";
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = "25.11";

}
