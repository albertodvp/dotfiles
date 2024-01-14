# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./cachix.nix
    ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };
  boot.initrd.luks.devices = {
    luksroot = {
      device = "TODO";
      preLVM = true;
      allowDiscards = true;
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    extraHosts = ''
      127.0.0.1 dev.domain
    '';
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;

  };
  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
    udev.packages = [ pkgs.bazecor ];
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    emacs = {
      enable = true;
      package = pkgs.emacs-unstable;
    };
    ntp.enable = true;
    picom = {
      enable = true;
      activeOpacity = 1.0;
      inactiveOpacity = 1.0;
      fade = true;
      fadeDelta = 5;
      shadow = true;
      shadowOpacity = 0.75;
    };
    xserver = {
      dpi = 180;
      layout = "us";
      enable = true;
      libinput.enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hpkgs: [
          hpkgs.xmonad-contrib
          hpkgs.xmonad-extras
          hpkgs.xmonad
        ];
      };
    };
  };
  hardware = {
    bluetooth.enable = true;
  };
  nixpkgs = {
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      }))
    ];
    config = {
      allowUnfree = true;
    };
  };
  users = {
    mutableUsers = false;
    users.albertodvp = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/albertodvp";
      extraGroups = [ "wheel" "networkmanager" "audio" "jackaudio" "docker" ];
      hashedPassword = "TODO";
    };
  };
  programs = {
    zsh.enable = true;
    slock.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.albertodvp = { pkgs, ... }: {
      home.stateVersion = "23.05";
      programs = {
        home-manager.enable = true;
        zsh = {
          enable = true;
          history = {
            size = 10000;
          };
          oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "robbyrussell";
          };
        };
        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        git = {
          enable = true;
          package = pkgs.gitAndTools.gitFull;
          userEmail = "alberto.fanton@protonmail.com";
          userName = "Alberto Fanton";
          signing = {
            key = "63FD3A4F4832946CB8088E3CC852405269E7A087";
            signByDefault = true;
          };
          extraConfig = {
            core = {
              editor = "emacsclient -c -nw";
              pager = "delta";
            };
            pull.rebase = true;
            interactive.diffFilert = "delta --color-only";
            delta = {
              navigate = true;
              light = false;
            };
            merge.conflictStyle = "diff3";
            diff.colorMoved = "default";
            init.defaultBranch = "main";
          };
          aliases = {
            f = "fetch -p";
            c = "commit";
            p = "push";
            bd = "branch -d";
            bD = "branch -D";
            acan = "!git add -u && git commit --amend --no-edit";
            st = "status -sb";
            s = "switch";
            lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
            cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d";
          };
        };
        zoxide.enable = true;
      };
      home.packages = with pkgs; [
        firefox
        feh
        rofi
        xmobar
        alacritty
        htop
        gimp-with-plugins
        python39
        delta
        ripgrep
        bat
        dig
        redis
        slack
        insomnia
        tmux
        tree
        libnotify
        dunst
        nixpkgs-fmt
        pavucontrol
        discord-ptb
        vlc
        tree-sitter
        gnumake
        gcc
        nixd
        actionlint
        nil
        fzf
        gnupg
        (vivaldi.override { proprietaryCodecs = true; enableWidevine = false; })
      ];
    };
  };
  security = {
    rtkit.enable = true;
    sudo.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      git
      vim
      wget
      docker-compose
      nodejs
      bazecor
    ];
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
      WORKON_HOME = "$HOME/.virtualenvs";
    };
    variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    };
  };
  fonts.packages = with pkgs; [
    hasklig
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  nix.settings = {
    cores = 11;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.iog.io"
    ];
    trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };
  system.stateVersion = "24.05";
}

# Use the systemd-boot EFI boot loader.

