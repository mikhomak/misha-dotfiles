-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font '3270 Nerd Font'
config.font_size = 16.0
-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-latte'

-- and finally, return the configuration to wezterm
return config
