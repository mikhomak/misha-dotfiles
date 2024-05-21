-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font '3270 Nerd Font'
config.font_size = 16.0
-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-latte'
config.window_decorations = "NONE"
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'k',
    mods = 'SHIFT|SUPER',
	action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'SHIFT|SUPER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
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
