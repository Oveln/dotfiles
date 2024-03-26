local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Afterglow"
config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true
config.window_background_opacity = 1

-- font config
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 19.0
config.line_height = 0.9
config.cell_width = 1

config.initial_cols = 100
config.initial_rows = 35

-- open tmux default
config.default_prog = { "tmux" }

-- open wsl in windows
-- config.default_prog = { "wsl.exe" }
-- config.default_cwd = "//wsl$/Ubuntu/home/oveln"

return config
