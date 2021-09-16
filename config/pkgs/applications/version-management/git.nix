{
  programs = {
    git = {
      enable = true;
      userName = "Cyunrei";
      userEmail = "cyunrei@gmail.com";
      aliases = {
        st = "status";
      };
      extraConfig = {
        http.proxy = "socks5://localhost:1080";
        core.editor = "nvim";
      };
    };
  };
}
