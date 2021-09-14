{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  # programs.zsh.enableSyntaxHighlighting = true;

  programs.zsh.initExtra = ''
    source $HOME/.nix-profile/etc/profile.d/nix.sh
  
    # https://github.com/romkatv/powerlevel10k#manual
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ${./res/p10k.zsh}

    # https://github.com/zdharma/fast-syntax-highlighting#manual
    source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
  '';

  home.file.".config/htop/htoprc".source = ./res/htoprc;
  programs.zsh.shellAliases = {
    top = "${pkgs.htop}/bin/htop";
    cls = "clear";
    hm = "home-manager";
  };

  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "git" ];

  programs.lsd.enable = true;
  programs.lsd.enableAliases = true;

  programs.bat.enable = true;
  programs.bat.config = { theme = "TwoDark"; };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cyunrei";
  home.homeDirectory = "/home/cyunrei";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
}
