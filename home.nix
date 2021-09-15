{ config, pkgs, ... }:

{
  home = {
    file = { ".config/htop/htoprc".source = ./res/htoprc; };
    homeDirectory = "/home/cyunrei";
    packages = with pkgs; [
      nixpkgs-fmt
      tomcat9
    ];
    stateVersion = "21.11";
    username = "cyunrei";
  };
  programs = {
    bat = {
      enable = true;
      config.theme = "TwoDark";
    };
    home-manager.enable = true;
    lsd = {
      enable = true;
      enableAliases = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      initExtra = ''
        source $HOME/.nix-profile/etc/profile.d/nix.sh
        # https://github.com/romkatv/powerlevel10k#manual
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        source ${./res/p10k.zsh}
        # https://github.com/zdharma/fast-syntax-highlighting#manual
        source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
      shellAliases = {
        top = "${pkgs.htop}/bin/htop";
        cls = "clear";
        hm = "home-manager";
      };
    };
  };
}
