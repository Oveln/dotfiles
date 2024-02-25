local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Afterglow"
config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true
config.window_background_opacity = 0.95

-- font config
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13.0
config.line_height = 0.9
config.cell_width = 1

config.initial_cols = 120
config.initial_rows = 50

-- open wsl in windows
config.default_prog = { "wsl.exe" }
config.default_cwd = "//wsl$/Ubuntu/home/oveln"

return config
