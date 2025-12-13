{config, pkgs, ...}:

{
	home.username = "vodrech";
	home.homeDirectory = "/home/vodrech";
	home.stateVersion = "25.11";
	programs.bash = {
		enable=true;
		profileExtra = ''
		if [ -z "$WAYLAND_DISPlAY" ] && [ "$XDG_VTNR" = 1 ]; then
			ecec hyprland
		fi
		''
	}
}
