# Miscalanius Packages Remove from user if unwanted
{ config, pkgs, ... }:
{
  programs.nix-ld.enable = true;

	# Provide the missing libraries to unpatched/dlopen binaries
	programs.nix-ld.libraries = with pkgs; [
    wayland
    libxkbcommon
    vulkan-loader
    udev
    alsa-lib
    libx11
    libxcursor
    libxi
    libxrandr
  ];

  environment.systemPackages = with pkgs; [
		prismlauncher # Running Microsoft Games
  ];
}
