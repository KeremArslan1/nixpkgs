{ config, pkgs, lib, ... }:

{
  # Nix configuration ------------------------------------------------------------------------------

  users.nix.configureBuildUsers = true;

  # Enable experimental version of nix with flakes support
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';
  
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;


  # Shells -----------------------------------------------------------------------------------------

  # Add shells installed by nix to /etc/shells file
  environment.shells = with pkgs; [
    bashInteractive
    fish
    zsh
  ];

  # Make Fish the default shell
  programs.fish.enable = true;
  programs.fish.useBabelfish = true;
  programs.fish.babelfishPackage = pkgs.babelfish;
  # Needed to address bug where $PATH is not properly set for fish:
  # https://github.com/LnL7/nix-darwin/issues/122
  programs.fish.shellInit = ''
    for p in (string split : ${config.environment.systemPath})
      if not contains $p $fish_user_paths
        set -g fish_user_paths $fish_user_paths $p
      end
    end
  '';
  environment.variables.SHELL = "${pkgs.fish}/bin/fish";

  # Install and setup ZSH to work with nix(-darwin) as well
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
