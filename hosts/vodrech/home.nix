{config, pkgs, ...}:
{
	home.username = "vodrech";
	home.homeDirectory = "/home/vodrech";
	home.stateVersion = "25.11";


	# Files placed in the .config folder

	home.file = {
	  ".config/hypr".source = ../../
	}
}
