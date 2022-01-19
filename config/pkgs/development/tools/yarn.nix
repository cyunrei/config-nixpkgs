{ config, pkgs, ... }:


{
  home = {
    file = {
      # Fix Error: EACCES: permission denied
      # https://github.com/nix-community/home-manager/issues/676#issuecomment-787901002
      ".yarnrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixpkgs/res/.yarnrc";
    };
    packages = with pkgs; [
      pkgs.yarn
    ];
    sessionPath = [ "$HOME/.yarn/bin/" ];
  };

}
