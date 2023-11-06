# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
    127.0.0.1 dev.domain
  '';


  time.timeZone = "Europe/Rome";

  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs29;
    };
    upower.enable = true;
    ntp.enable = true;
    picom = {
      enable = true;
      # activeOpacity = 1.0;
      # inactiveOpacity = 1.0;
      # backend = "glx";
      # fade = true;
      # fadeDelta = 5;
      # shadow = true;
      # shadowOpacity = 0.75;
    };
    xserver = {
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


  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };
  users = {
    mutableUsers = false;
    users.albertodvp = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/albertodvp";
      extraGroups = [ "wheel" "networkmanager" "audio" "jackaudio" "docker" ];
      hashedPassword = "";
    };
  };
  programs = {
    zsh.enable = true;
    slock.enable = true;
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
        termonad
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
      ];
    };
  };
  environment = {
    systemPackages = with pkgs; [
      git
      vim
      wget
      docker-compose
      nodejs
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
  };
  fonts.fonts = with pkgs; [
    hasklig
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];
  system.stateVersion = "23.05";
}
