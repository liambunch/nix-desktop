{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    neovim
    wget
    fastfetch
    thunderbird
    vesktop
    keepassxc
    remmina
    vlc
    bottom
    kdePackages.kate
    kdePackages.kcalc
    yt-dlp
    firefox
    git
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Liam Bunch";
        email = "liam@liambunch.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
