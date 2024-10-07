# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
  fonts = {

  fontconfig = {
    defaultFonts = {
      monospace = [ "FiraCode" ];
    };
  };
};

#ssh daemon
services.openssh = {
    enable = true;
};
#swap file
swapDevices = [ 
  { device = "/swapfile"; }
];


services.openssh.settings.PermitRootLogin = "prohibit-password"; # Optional: Control root login
services.openssh.settings.PasswordAuthentication = false; # Optional: Disable password authentication
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver = {
  layout = "us";                    # Set to your desired layout
  xkbVariant = "";                   # Variant (if any)
  displayManager.sddm.enable = true; # Enabling SDDM
  desktopManager.plasma5.enable = true; # Example desktop manager
  };

qt.enable = true;
hardware.bluetooth.enable = true;
  # Configure keymap in X11


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.pranavk = {
    isNormalUser = true;
    description = "Pranavk";
    extraGroups = [ "networkmanager" "wheel" "kvm" "docker"];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

services.blueman.enable = true;
programs.adb.enable = true;
services.docker = {
  enableUserServices = true;
};
virtualisation.docker.enable = true;
environment.variables.EDITOR = "nvim";
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  git
  lazygit
  gcc
  python3
  nodejs_22
  go
  dart
  yarn
  sqlite
  zsh
  fzf
  bat
  neovim
  kitty
  tmux
  tmuxifier
  gh
  distrobox
  flutter319
  
  marktext
  obsidian
  protonvpn-gui
  protonvpn-cli
  networkmanagerapplet
  openssh

  nodePackages_latest.live-server
  nodePackages_latest.nodemon
  nodePackages_latest.ts-node
  nodePackages_latest.expo-cli
  ngrok
  docker
  docker-compose
  docker-client
  android-studio
  android-tools
  sdkmanager
  air

  oh-my-zsh
  zsh-syntax-highlighting
  zsh-autosuggestions
  starship
  fastfetch
  ani-cli

  ripgrep
  xclip
  pavucontrol
  killall

  zoxide
  nerdfonts
  tpmmanager
  pipewire
  wireplumber
  rofi-wayland
  rofi-power-menu
  fuzzel
  bemenu
  dunst
  libnotify
  waybar
  blueman
  cinnamon.nemo
  hyprpaper
  xdg-desktop-portal-gtk
  brightnessctl
  pywal
  grim
  slurp
  wl-clipboard
  wl-clipboard-x11
  cliphist
  networkmanagerapplet
  wofi
  gnome.gnome-clocks
  discord
  libreoffice-qt6-still
  bookworm
];
xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
