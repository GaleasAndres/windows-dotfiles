local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ============================================================================
-- FONT CONFIGURATION
-- ============================================================================
config.font = wezterm.font("JetBrains Mono")
config.font_size = 10.0

-- ============================================================================
-- APPEARANCE
-- ============================================================================
config.window_background_opacity = 0.92

-- Cursor style
config.default_cursor_style = "SteadyBar"

-- Catppuccin Mocha theme
config.colors = {
	-- Basic colors
	foreground = "#CDD6F4",
	background = "#1E1E2E",
	cursor_bg = "#F5E0DC",
	cursor_fg = "#1E1E2E",
	cursor_border = "#F5E0DC",
	selection_fg = "#1E1E2E",
	selection_bg = "#F5E0DC",
	-- ANSI colors
	ansi = {
		"#45475A", -- black
		"#F38BA8", -- red
		"#A6E3A1", -- green
		"#F9E2AF", -- yellow
		"#89B4FA", -- blue
		"#F5C2E7", -- magenta
		"#94E2D5", -- cyan
		"#BAC2DE", -- white
	},
	brights = {
		"#585B70", -- bright black
		"#F38BA8", -- bright red
		"#A6E3A1", -- bright green
		"#F9E2AF", -- bright yellow
		"#89B4FA", -- bright blue
		"#F5C2E7", -- bright magenta
		"#94E2D5", -- bright cyan
		"#A6ADC8", -- bright white
	},
	-- Tab bar colors
	tab_bar = {
		background = "#252536",
		active_tab = {
			bg_color = "#98c379",
			fg_color = "#11111B",
		},
		inactive_tab = {
			bg_color = "#e06c75",
			fg_color = "#000000",
		},
		inactive_tab_hover = {
			bg_color = "#e06c75",
			fg_color = "#000000",
		},
		new_tab = {
			bg_color = "#252536",
			fg_color = "#CDD6F4",
		},
	},
}

-- ============================================================================
-- WINDOW SETTINGS
-- ============================================================================
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"

-- Window padding
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

-- ============================================================================
-- TAB BAR
-- ============================================================================
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- ============================================================================
-- SHELL
-- ============================================================================
config.default_prog = { "pwsh.exe" }

-- ============================================================================
-- KEYBINDINGS
-- ============================================================================
config.keys = { -- ============================================================================
	-- PANE NAVIGATION
	-- ============================================================================
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- ============================================================================
	-- PANE SPLITTING
	-- ============================================================================
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- ============================================================================
	-- PANE CLOSING
	-- ============================================================================
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- ============================================================================
	-- ROTATE PANE LAYOUT
	-- ============================================================================
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},

	-- ============================================================================
	-- ZOOM/MAXIMIZE PANE
	-- ============================================================================
	{
		key = "z",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},

	-- ============================================================================
	-- TAB MANAGEMENT
	-- ============================================================================
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},

	{
		key = "t",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- ============================================================================
	-- FONT SIZE
	-- ============================================================================
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.ResetFontSize,
	},

	-- ============================================================================
	-- COPY/PASTE
	-- ============================================================================
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- ============================================================================
	-- FOR CLAUDE WRITE IN NEXT LINE
	-- ============================================================================
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x1b\r"),
	},

	-- ============================================================================
	-- WORD DELETION
	-- ============================================================================
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendString("\x17"),
	},
}

return config
