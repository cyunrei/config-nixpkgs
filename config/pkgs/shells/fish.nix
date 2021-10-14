{ programs, home, pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      shellInit = ''
        replay source $HOME/.nix-profile/etc/profile.d/nix.sh
        # https://fishshell.com/docs/current/cmds/fish_add_path.html
        fish_add_path $HOME/.local/bin/
      '';
      shellAliases = {
        top = "${pkgs.htop}/bin/htop";
        cls = "clear";
        hm = "home-manager";
        # https://stackoverflow.com/questions/9445489/performing-http-requests-with-curl-using-proxy
        setproxy = "export http_proxy=http://localhost:8118/ && export https_proxy=https://localhost:8118/";
        unsetproxy = "set --erase http_proxy && set --erase https_proxy";
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
