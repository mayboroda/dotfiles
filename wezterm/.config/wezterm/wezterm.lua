local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config = {
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = true,
  use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
  color_scheme = "rose-pine-moon",
  colors = {
    selection_bg = "#44415a",
  },
  -- color_scheme = 'Google Light (base16)',
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

    { key = 'p', mods = 'CTRL|SHIFT', action = act.ShowLauncher },
    { key = 'w', mods = 'CTRL|SHIFT', action = act.ShowLauncherArgs { flags = 'WORKSPACES' } },
    {
      key = 'E',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.PromptInputLine {
        description = 'Rename tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    }
  },
  -- On macOS, Option (Alt) can behave like a special character input instead of Meta.
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,
}

return config
