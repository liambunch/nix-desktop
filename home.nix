{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    
    # CLI Tools
    neovim
    wget
    fastfetch
    bottom
    git
    yt-dlp

    # Internet (Browsers, Mail, Messaging, etc)
    mullvad-vpn
    firefox
    thunderbird
    vesktop
    nicotine-plus
    telegram-desktop
    qbittorrent

    # Media
    vlc
    mpv

    # Text
    libreoffice
    zed-editor

    # Remote Desktop
    remmina    

    # KDE
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kdenlive
  ];

  programs.git = {
    enable = true;

    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Liam Bunch";
        email = "liam@liambunch.com";
      };
      gpg.format = "ssh";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
