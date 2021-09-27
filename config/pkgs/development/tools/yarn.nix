{ config, pkgs, ... }:


{
  home = {
    file = {
      ".yarnrc".text = ''
        registry "https://registry.npm.taobao.org/"
      '';
    };
    packages = with pkgs; [
      pkgs.yarn
    ];
    sessionPath = [ "$HOME/.yarn/bin/" ];
  };
  
}
