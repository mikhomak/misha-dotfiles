{ imports, config, pkgs, ... }:

{


  home.username = "misha";
  home.homeDirectory = "/home/misha";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
	  pkgs.jdk17
	  pkgs.gradle
	  pkgs.maven
	  pkgs.gettext
	  pkgs.procps
  ];
  home.file = {
  };

  home.sessionVariables = {
	XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/var/lib";
    XDG_CACHE_HOME  = "$HOME/var/cache";
    # EDITOR = "emacs";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
