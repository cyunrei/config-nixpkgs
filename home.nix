{ config, pkgs, ... }:

{
  home = {
    username = "cyunrei";
    homeDirectory = "/home/cyunrei";
    stateVersion = "21.11";
  };

  imports = [

    config/pkgs/applications/misc/hugo.nix
    config/pkgs/applications/misc/ranger.nix

    config/pkgs/applications/system/glances.nix

    config/pkgs/applications/version-management/git.nix

    config/pkgs/development/tools/build-managers/gradle.nix
    config/pkgs/development/tools/yarn.nix
    
    config/pkgs/development/web/nodejs.nix

    config/pkgs/development/node-packages.nix

    config/pkgs/shells/fish.nix

    config/pkgs/tools/misc/bat.nix
    config/pkgs/tools/misc/exa.nix
    config/pkgs/tools/misc/neofetch.nix

    config/pkgs/tools/nix/nixpkgs-fmt.nix

    config/pkgs/tools/package-management/home-manager.nix
    config/pkgs/tools/package-management/nix-prefetch-git.nix

    config/pkgs/tools/system/htop.nix
  ];
}
