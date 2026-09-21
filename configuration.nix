{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.swraid.enable = true;

  # Networking
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  # Time and Locales
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Services
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.mullvad-vpn.enable = true;
  services.resolved = {
    enable = true;
  };
  services.hardware.openrgb = {
    enable = true;
    motherboard = "intel";
  };
  services.openssh.enable = true;
  services.flatpak = {
    enable = true;
    packages = [
      "com.usebottles.bottles"
    ];
    uninstallUnmanaged = true;
  };

  # Virtualisation and Docker
  virtualisation.docker = {
    enable = true;
  };
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Users
  users.users."liam" = {
    isNormalUser = true;
    description = "Liam Bunch";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" ];
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.liam = import ./home.nix;
  };

  # System Packages
  nixpkgs.config.allowUnfree = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.oxygen
    claude-code
    ollama
    virt-manager
    dnsmasq
    python3
  ];

  # Dependency for Bitwarden
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    icu
    curl
    libunwind
  ];

  # Nix Config
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
