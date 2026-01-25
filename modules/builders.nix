
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo # Rust builder
    rustc # Rust Compiler
    nodejs_24 # NoteJS version 24
    python315 # Python 3.15
    gcc
		docker
  ];

	virtualisation.docker = {
		enable = true;
	};
}
