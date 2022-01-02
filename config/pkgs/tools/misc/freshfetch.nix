{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      freshfetch
    ];
  };
}
