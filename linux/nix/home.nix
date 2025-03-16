{ imports, config, pkgs, ... }:

{


	home.username = "misha";
	home.homeDirectory = "/home/misha";

	home.stateVersion = "24.05"; # Please read the comment before changing.

		home.packages = [
# fun
		pkgs.cava
		pkgs.teams-for-linux 
# werk related
			pkgs.jdk17
			pkgs.gradle
			pkgs.maven
			pkgs.gettext
			pkgs.procps
			pkgs.nodePackages_latest.grunt-cli
		];
	home.file = {
	};

	home.sessionVariables = {
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_DATA_HOME   = "$HOME/var/lib";
		XDG_CACHE_HOME  = "$HOME/var/cache";
	    EDITOR = "vim";
	};
# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
