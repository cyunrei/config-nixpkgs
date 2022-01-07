{ programs, home, pkgs, ... }:
{
  programs = {
    autojump.enable = true;
    fish = {
      enable = true;
      shellInit = ''
        replay source $HOME/.nix-profile/etc/profile.d/nix.sh
        fish_add_path $HOME/.local/bin/
      '';
      shellAliases = {

        # Common alias start #
        cls = "clear";
        hm = "home-manager";
        glances = "glances --theme-white";
        top = "${pkgs.htop}/bin/htop";
        pc4 = "proxychains4 -q";
        # Common alias end #

        # Proxy alias start #
        # https://stackoverflow.com/questions/9445489/performing-http-requests-with-curl-using-proxy
        setproxy = "export http_proxy=http://localhost:8118/ && export https_proxy=https://localhost:8118/";
        unsetproxy = "set --erase http_proxy && set --erase https_proxy";
        # Proxy alias end #

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
        yay = "pc4 yay"; # proxychains4 proxy
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
            rev = "1.16.3";
            sha256 = "sha256-Xld66z9vVp3kxikndZ9k/zlNvP0YSoSCNTBkJ8rT3uo=";
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
            rev = "1.2.0";
            sha256 = "sha256-Q/9YVdiRSJw1SdcfQv2h7Lj6EyFustRk+kmh1eRRQ6k=";
          };
        }
        {
          name = "nix-completions.fish";
          src = pkgs.fetchgit {
            url = "https://github.com/kidonng/nix-completions.fish";
            rev = "dcb15c4f7d3e85d8f7cd3eb09b3014ccd278aab8";
            sha256 = "sha256-3HHcaX2yVZXrRjOeSlI8tPhSjRR2tPU6AWq6eU5nPOs=";
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
