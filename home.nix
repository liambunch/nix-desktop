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
    dig

    # Internet (Browsers, Mail, Messaging, etc)
    mullvad-vpn
    firefox
    ungoogled-chromium
    thunderbird
    vesktop
    nicotine-plus
    telegram-desktop
    qbittorrent

    # Media
    vlc
    mpv
    gimp

    # Text
    libreoffice

    # KDE
    kdePackages.kdenlive
    kdePackages.kcalc

    # Password Managers
    keepassxc
    bitwarden-desktop
    bitwarden-cli

    # Misc
    remmina
    bottles
    heroic
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
