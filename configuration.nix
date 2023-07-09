{ config, pkgs, ... }:

{
  imports =
    [
    ./hardware-configuration.nix <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-partuuid/TODO";
      header = "/dev/disk/by-partuuid/TODO";
      allowDiscards = true;
      preLVM = true;
    };
  };
  virtualisation.docker.enable = true;
  networking.hostName = "TODO";
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
    127.0.0.1 dev.domain
    '';
  
  
  time.timeZone = "Europe/Rome";

  networking.useDHCP = false;
  networking.interfaces.[TODO].useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  services = {
    upower.enable = true;
    ntp.enable = true;
    picom = {
      enable = true;
      activeOpacity = 1.0;
      inactiveOpacity = 1.0;
      backend = "glx";
      fade = true;
      fadeDelta = 5;
      shadow = true;
      shadowOpacity = 0.75;
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
    users.alberto = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/alberto";
      extraGroups = [ "wheel" "networkmanager" "audio" "jackaudio" "docker"];
      hashedPassword = "TODO";
    };
  };
  programs.zsh.enable = true;
  
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.alberto = { pkgs, ... }: {
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
    git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userEmail = "alberto.fanton@protonmail.com";
      userName = "Alberto Fanton";
	    extraConfig = {
        core = {
          editor = "emacs -nw";
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
    emacs = {
      enable = true;
    };
    zoxide.enable = true;
  };
  home.packages = with pkgs; [
        firefox
        brave
        discord
        feh
        rofi
        xmobar
        alacritty
        htop
        obs-studio
        gimp-with-plugins
        python39
	delta     
        ripgrep
        bat
        dig
        redis
        slack
        insomnia
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
      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      XDG_STATE_HOME  = "$HOME/.local/state";

      XDG_BIN_HOME    = "$HOME/.local/bin";
      PATH = [ 
        "${XDG_BIN_HOME}"
      ];
      WORKON_HOME     = "$HOME/.virtualenvs";
    };
  };
  fonts.fonts = with pkgs; [
    hasklig
  ];
  nix = {
    settings = {
      substituters        = [ "https://hydra.iohk.io" "https://iohk.cachix.org" ];
      trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];
    };
  };
  system.stateVersion = "23.05";
}
