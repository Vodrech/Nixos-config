{pkgs, ...}:
{
	programs.bash.shellAliases = {
		nvim-dot = "XDG_CONFIG_HOME=$HOME/dotfiles nvim";
	};
}
