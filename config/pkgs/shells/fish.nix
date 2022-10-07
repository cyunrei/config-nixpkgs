{ programs, home, pkgs, ... }:
{
  programs = {
    autojump.enable = true;
    fish = {
      enable = true;
      shellInit = ''
        replay source $HOME/.nix-profile/etc/profile.d/nix.sh
        fish_add_path $HOME/.local/bin/
        fish_add_path $HOME/.node_modules/bin
      '';
      shellAliases = {

        # Common alias start #
        glances = "glances --theme-white";
        top = "${pkgs.htop}/bin/htop";
        # Common alias end #

        # Pacman alias start #
        # https://gist.github.com/alekratz/838a3d5b9b679eee8c81
        pac = "sudo pacman -S"; # install
        pacu = "sudo pacman -Syu"; # update, add 'a' to the list of letters to update AUR packages if you use yaourt
        pacr = "sudo pacman -Rs"; # remove
        pacs = "sudo pacman -Ss"; # search
        paci = "sudo pacman -Si"; # info
        paclo = "sudo pacman -Qdt"; # list orphans
        pacro = "paclo && sudo pacman -Rns (sudo pacman -Qtdq)"; # remove orphans
        pacc = "sudo pacman -Scc"; # clean cache
        paclf = "sudo pacman -Ql"; # list files
        # Pacman alias end #

        # yay alias start #
        # https://gist.github.com/tz4678/0d97187a197def57f8b56cabac094401
        yai = "yay -S"; # install package(s)
        yas = "yay -Ss"; # search packages
        yad = "yay - Si"; # description of the package
        yar = "yay -Rns"; # remove package(s)
        yac = "yay -Yc"; # clean unwanted packages
        # yay alias end #

      };
      plugins = [
        {
          name = "done";
          src = pkgs.fetchgit {
            url = "https://github.com/franciscolourenco/done";
            rev = "1.16.5";
            sha256 = "sha256-E0wveeDw1VzEH2kzn63q9hy1xkccfxQHBV2gVpu2IdQ=";
          };
        }
        {
          name = "pisces";
          src = pkgs.fetchgit {
            url = "https://github.com/laughedelic/pisces";
            rev = "v0.7.0";
            sha256 = "sha256-Oou2IeNNAqR00ZT3bss/DbhrJjGeMsn9dBBYhgdafBw=";
          };
        }
        {
          name = "plugin-bang-bang";
          src = pkgs.fetchgit {
            url = "https://github.com/oh-my-fish/plugin-bang-bang";
            rev = "f969c618301163273d0a03d002614d9a81952c1e";
            sha256 = "sha256-A8ydBX4LORk+nutjHurqNNWFmW6LIiBPQcxS3x4nbeQ=";
          };
        }
        {
          name = "replay.fish";
          src = pkgs.fetchgit {
            url = "https://github.com/jorgebucaran/replay.fish";
            rev = "1.2.1";
            sha256 = "sha256-bM6+oAd/HXaVgpJMut8bwqO54Le33hwO9qet9paK1kY=";
          };
        }
        {
          name = "nix-completions.fish";
          src = pkgs.fetchgit {
            url = "https://github.com/kidonng/nix-completions.fish";
            rev = "cd8a43bed96e0acc02228bc77502be8ba5fa0548";
            sha256 = "sha256-spnLmde41qQt8uJZFwiH0igFuVqZ6SvkwdA9Kbe2yz8=";
          };
        }
        {
          name = "docker.fish";
          src = pkgs.fetchgit {
            url = "https://github.com/Cyunrei/docker.fish";
            rev = "7dce1b32973833ffa7024b740869e826357b3082";
            sha256 = "090cb77kwxw867rrp6f3rh623vflh22l24r83dgxav55kakncz90";
          };
        }
      ];
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break = { disabled = true; };
      };
    };
  };
}
