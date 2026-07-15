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
    kdePackages.kdenlive
    yt-dlp
    firefox
    git
    libreoffice
    mullvad-vpn
    qbittorrent
    mpv
    nicotine-plus
    telegram-desktop
    zed-editor
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
