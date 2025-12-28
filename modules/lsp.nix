{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lua-language-server # .lua
    typescript-language-server # .ts / .js
    rust-analyzer # .rs
    bash-language-server # .sh
  ];
}
