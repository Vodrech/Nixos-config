{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
	  steam # Games Executor
    lutris # Game Launcher
    wineWowPackages.staging
    winetricks # Gaming
    bolt-launcher # Jagex launcer 3rd party
		vesktop # Discord
  ];

	programs.steam = {
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};
}
