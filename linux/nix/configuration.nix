
{ config, pkgs,inputs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
			./hosts.nix
			inputs.home-manager.nixosModules.default
		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.


		networking.networkmanager.enable = true;

	time.timeZone = "Europe/Madrid";

	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "es_ES.UTF-8";
		LC_IDENTIFICATION = "es_ES.UTF-8";
		LC_MEASUREMENT = "es_ES.UTF-8";
		LC_MONETARY = "es_ES.UTF-8";
		LC_NAME = "es_ES.UTF-8";
		LC_NUMERIC = "es_ES.UTF-8";
		LC_PAPER = "es_ES.UTF-8";
		LC_TELEPHONE = "es_ES.UTF-8";
		LC_TIME = "es_ES.UTF-8";
	};

	i18n.inputMethod = {
		type = "fcitx5";
		enable = true;
		fcitx5.addons = with pkgs; [
				fcitx5-mozc-ut
					fcitx5-gtk
			];

	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.misha = {
		isNormalUser = true;
		description = "misha";
		extraGroups = [ "networkmanager" "wheel" "sudo" "docker" "audio"];
		packages = with pkgs; [];
		shell = pkgs.zsh;
	};

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"misha" = import ./home.nix;
		};
	};

	users.defaultUserShell = pkgs.zsh;
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};

# Docker
	virtualisation.docker.enable = true;
	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};
	virtualisation.docker.enableOnBoot = true;

	programs = {
		hyprland = {
			enable = true;
			xwayland.enable = true;
		};
		zsh= {
			enable = true;
			promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
			ohMyZsh = {
				enable = true;
				plugins = [
					"git"
						"themes"
						"emoji"
						"emoji-clock"
				];
			};
		};
		nix-ld = {
			enable = true;
		};
	};

	xdg = {
		portal = {
			enable = true;
			extraPortals = with pkgs; [
				xdg-desktop-portal-wlr
					xdg-desktop-portal-hyprland
			];
		};
	};

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
			localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	environment.sessionVariables = {
		WLN_NO_HARDWARE_CURSOR = "1";
		NIXOS_OZON_WL = "1";
		QT_IM_MODULE = "fcitx";
		XMODIFIERS = "@im=fcitx";
		GTK_IM_MODULE = "fcitx";
	};

	hardware = {
		graphics.enable = true;
		nvidia.modesetting.enable = true;
	};

	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
# If you want to use JACK applications, uncomment this
		jack.enable = true;
	};



	fonts.packages = with pkgs; [
		nerdfonts
			ipafont
			kochi-substitute
			mplus-outline-fonts.osdnRelease
			noto-fonts-cjk-sans
			noto-fonts-emoji
	];

	fonts.fontconfig.defaultFonts = {
		sansSerif = [ "Noto Sans CJK JP" "Noto Sans" ];
		serif = [ "Noto Serif CJK JP" "Noto Serif" ];
		monospace = [ "Noto Sans Mono CJK JP" "Hack Nerd Font" ];
	};


	environment.systemPackages = with pkgs; [
# Main
		neovim
			vim
			git
			firefox
			kitty
			wezterm
			tmux

# ZSH and shell
			oh-my-zsh
			zsh-powerlevel10k
			zsh-git-prompt

# Nix
			home-manager
			nix-search-cli

# Desktop and tiling manager stuff
			waybar	
			dunst
			swww

# CLI
			unzip
			alsa-utils
			killall
			lsof
			xclip
			fzf

# development
			jetbrains.idea-community
			nodejs_22
			docker
			gcc
			rustup
			python3
			openvpn
			sqlx-cli
			go
			yarn
			hoppscotch

# Desktop apps
			flameshot
			spotify-player
			discord
			vscode
			obsidian
			kitty-themes
			vlc
			bruno
			inputs.superfile.packages.x86_64-linux.default
			swappy
			grim
			slurp
			google-chrome
			opera
			fcitx5-configtool


# Libs
			libnotify
			openssl
			gnumake
			xdg-utils
			ripgrep
			];
	system.stateVersion = "24.05"; # Did you read the comment?
}
