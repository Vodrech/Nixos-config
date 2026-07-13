# Miscalanius Packages Remove from user if unwanted
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
		prismlauncher # Running Microsoft Games
  ];
}
