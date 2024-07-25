-- Pull in the wezterm API
local wezterm = require 'wezterm'
	-- This will hold the configuration.
local config = wezterm.config_builder()

	local home_dir = os.getenv("HOME")

	config.font = wezterm.font '3270 Nerd Font'
	config.font_size = 11.0
	-- For example, changing the color scheme:
	-- config.color_scheme = 'primary'
config.color_scheme = 'Rasi (terminal.sexy)'
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = true

	config.inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.8,
	}
config.enable_wayland= true
config.background = {
	{
		source = {
			File = home_dir .. '/.config/imgs/eva_2.gif',
		},
		width = '100%',
		height='Contain',
		repeat_x = 'Mirror',
		hsb = {
			brightness = 0.1,
		},
		attachment = { Parallax = 0.1 },
	},
}
config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = 'w',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.SplitPane{
			direction = 'Up',
			size = { Percent = 50},
		},
	},
	{
		key = 's',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.SplitPane{
			direction = 'Down',
			size = { Percent = 50},
		},
	},
	{
		key = 'a',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.SplitPane{
			direction = 'Left',
			size = { Percent = 50},
		},
	},
	{
		key = 'd',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.SplitPane{
			direction = 'Right',
			size = { Percent = 50},
		},
	},

	{
		key = 'UpArrow',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.ActivatePaneDirection 'Up',
	},
	{
		key = 'DownArrow',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.ActivatePaneDirection 'Down',
	},
	{
		key = 'LeftArrow',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.ActivatePaneDirection 'Left',
	},
	{
		key = 'RightArrow',
		mods = 'SHIFT|SUPER',
		action = wezterm.action.ActivatePaneDirection 'Right',
	},
	{
		key = 'w',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane { confirm = true },
	},


}
-- and finally, return the configuration to wezterm
return config
