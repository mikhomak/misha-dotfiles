
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

# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.misha = {
		isNormalUser = true;
		description = "misha";
		extraGroups = [ "networkmanager" "wheel" "sudo" "docker" "audio"];
		packages = with pkgs; [];
	};

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"misha" = import ./home.nix;
		};
	};

	users.defaultUserShell = pkgs.zsh;
	users.users.misha.shell = pkgs.zsh;
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
						"alias-tips"
				];
			};
		};
		nix-ld = {
			enable = true;
		};
	};

	environment.sessionVariables = {
		WLN_NO_HARDWARE_CURSOR = "1";
		NIXOS_OZON_WL = "1";
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
#jack.enable = true;
	};

# $ nix search wget
	environment.systemPackages = with pkgs; [
		neovim
			vim
			git
			firefox
			kitty
			wezterm

			oh-my-zsh
			zsh-powerlevel10k
			zsh-git-prompt
			nerdfonts

			home-manager
			nix-search-cli

			waybar	
			dunst

			unzip
			alsa-utils

			sdkmanager
			jetbrains.idea-community
			nodejs_22
			docker
			cargo
			python3
			openvpn

			flameshot
			spotify-player
			discord
			vscode
			obsidian
			kitty-themes

			libnotify
			];

	system.stateVersion = "24.05"; # Did you read the comment?
}
