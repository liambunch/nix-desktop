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

    # KDE
    kdePackages.kdenlive
    kdePackages.kcalc

    # Misc
    remmina
    bottles
    keepassxc
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

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      anthropic.claude-code
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
  };
}
