{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    vim
    wget
    fastfetch
    thunderbird
    vesktop
    keepassxc
    remmina
    vlc
    htop
    kdePackages.kate
    kdePackages.kcalc
    yt-dlp
    firefox
  ];
}
