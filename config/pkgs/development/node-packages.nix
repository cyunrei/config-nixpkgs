{ config, pkgs, ... }:


{
  home = {
    file = {
      ".npmrc".text = ''
      registry=https://registry.npm.taobao.org
      '';
    };
    packages = with pkgs; [
      nodePackages.npm
    ];
  };
}
