{ config, pkgs, ... }:

{
  home = {
    username = "cyunrei";
    homeDirectory = "/home/cyunrei";
    stateVersion = "21.11";
    packages = with pkgs; [
      nixpkgs-fmt
      nodejs
    ];
  };

  imports = [
    config/pkgs/applications/editors/neovim.nix
    config/pkgs/applications/misc/ranger.nix
    config/pkgs/applications/version-management/git.nix
    config/pkgs/development/tools/build-managers/gradle.nix
    config/pkgs/development/tools/yarn.nix
    config/pkgs/development/node-packages.nix
    config/pkgs/shells/zsh.nix
    config/pkgs/tools/misc/bat.nix
    config/pkgs/tools/misc/lsd.nix
    config/pkgs/tools/package-management/home-manager.nix
    config/pkgs/tools/system/htop.nix
  ];
}
