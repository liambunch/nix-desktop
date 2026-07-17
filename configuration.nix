{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
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
  services.flatpak.enable = true;

  # Users
  users.users."liam" = {
    isNormalUser = true;
    description = "Liam Bunch";
    extraGroups = [ "networkmanager" "wheel" ];
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
  environment.systemPackages = with pkgs; [ ];

  # Nix Config
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
