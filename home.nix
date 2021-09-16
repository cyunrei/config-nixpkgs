{ config, pkgs, ... }:

{
  home = {
    username = "cyunrei";
    homeDirectory = "/home/cyunrei";
    stateVersion = "21.11";
    file = {
      ".config/htop/htoprc".source = ./res/htoprc;
      ".gradle/gradle.properties".text = ''
        systemProp.http.proxyHost=127.0.0.1
        systemProp.http.proxyPort=8118
        systemProp.https.proxyHost=127.0.0.1
        systemProp.https.proxyPort=8118
      '';
    };
    packages = with pkgs; [
      nixpkgs-fmt
    ];
  };

  imports = [
    ./config/pkgs/applications/editors/neovim.nix
    ./config/pkgs/applications/version-management/git.nix
    ./config/pkgs/shells/zsh.nix
    ./config/pkgs/tools/msic/bat.nix
    ./config/pkgs/tools/msic/lsd.nix
    ./config/pkgs/tools/package-management/home-manager.nix
  ];
}
