local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	color_scheme = "rose-pine-moon",
    colors = {
        selection_bg = "#44415a",
    },
	font_size = 19,
    macos_window_background_blur = 30,
	default_cursor_style = "BlinkingBlock",
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},

    -- Disable the CTRL versions in favour of nvim tab navigation
    { key = "PageUp", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    { key = "PageDown", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },

  }
}

return config
