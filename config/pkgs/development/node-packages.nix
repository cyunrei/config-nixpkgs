{ config, pkgs, ... }:


{
  home = {
    file = {
      ".npmrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixpkgs/res/.npmrc";
    };
    packages = with pkgs; [
      nodePackages.npm
    ];
    sessionPath = [ "$HOME/.node_modules/bin/" ];
  };

}
