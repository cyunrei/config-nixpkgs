{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      initExtra = ''
        source ${./../../../res/p10k.zsh}
        source $HOME/.nix-profile/etc/profile.d/nix.sh
        # https://github.com/romkatv/powerlevel10k#manual
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        # https://github.com/zdharma/fast-syntax-highlighting#manual
        source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
        # https://github.com/romkatv/powerlevel10k/issues/87
        ZLE_RPROMPT_INDENT=0
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
      shellAliases = {
        top = "${pkgs.htop}/bin/htop";
        cls = "clear";
        hm = "home-manager";
        # https://stackoverflow.com/questions/9445489/performing-http-requests-with-curl-using-proxy
        setproxy = "export http_proxy=http://localhost:8118/ && export http_proxy=http://localhost:8118/";
      };
    };
  };
}