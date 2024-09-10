local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	color_scheme = "rose-pine-moon",
	font_size = 19,
    macos_window_background_blur = 30,
	default_cursor_style = "BlinkingBlock",
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
}

return config
