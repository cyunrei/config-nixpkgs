{ config, pkgs, ... }:

{
  home = {
    file = {
      ".config/htop/htoprc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixpkgs/res/htoprc";
    };
    packages = with pkgs; [
      htop
    ];
  };
}
