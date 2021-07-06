{ config, pkgs, lib, ... }:

{
  # Import config broken out into files
  # imports = [ ./git.nix ./kitty.nix ./fish ];
  imports = [ ./git.nix ./fish ];

  # Packages with configuration --------------------------------------------------------------- {{{

  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = { theme = "Dracula"; };

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  # Zoxide, a faster way to navigate the filesystem
  # https://github.com/ajeetdsouza/zoxide
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.zoxide.enable
  programs.zoxide.enable = true;
  # }}}

  home.sessionVariables = {
    PGDATA = "/usr/local/var/postgres";
    JAVA_HOME = "$(/usr/libexec/java_home -v 11)";
    EDITOR = "nvim";
  };

  # Other packages ----------------------------------------------------------------------------- {{{

  home.packages = with pkgs; [
    go
    kotlin
    colorls
    bash # /bin/bash
    curl # An old classic
    wget
    direnv # Per-directory environment variables
    fzf # Fuzzy finder
    fd
    ranger
    highlight
    gnupg # gpg
    pinentry_mac # Necessary for GPG
    gradle
    htop # Resource monitoring
    gotop # A terminal based graphical activity monitor inspired by gtop and vtop
    httpie # Like curl but more user friendly
    jq # JSON parsing for the CLI

    # python3 # Have you upgraded yet???
    ripgrep # grep replacement written in Rust
    tokei # Handy tool to see lines of code by language
    tree # Should be included in macOS but it's not
    vagrant # Virtualization made easy
    urlview # required for tmux-urlview

    yarn # Node.js package manager
    tldr
    ncdu
    exa
    ffmpeg
    rename

    tmux

    # Doom Emacs Prereq
    coreutils
    gawk
    # :checkers grammar
    languagetool
    imagemagick # for image-dired
    # :tools editorconfig
    editorconfig-core-c # per-project style config
    # :checkers spell
    (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
    nixfmt

    # zathura # A highly customizable and functional PDF viewer
    # mupdf # Lightweight PDF, XPS, and E-book viewer and toolkit written in portable C
    ueberzug
    silver-searcher
    # universal-ctags
    lazygit
    lazydocker

    shellcheck
    neofetch # A fast, highly customizable system info script
    dive # A tool for exploring each layer in a docker image

    cacert
    # comma # run software from without installing it
    redis

    gitAndTools.gh
  ];
  # }}}

  # This value determines the Home Manager release that your configuration is compatible with. This
  # helps avoid breakage when a new Home Manager release introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See the Home Manager release notes for
  # a list of state version changes in each release.
  home.stateVersion = "21.05";
}
# vim: foldmethod=marker
