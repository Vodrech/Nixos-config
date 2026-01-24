
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo # Rust builder
    rustc # Rust Compiler
    nodejs_24 # NoteJS version 24
    python315 # Python 3.15
    gcc
		docker
		alsa-lib # Sound for rust
		libudev-zero # unknown
  ];

	virtualisation.docker = {
		enable = true;
	};
}
