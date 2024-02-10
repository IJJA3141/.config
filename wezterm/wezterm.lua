local wezterm = require("wezterm")
local config = wezterm.config_builder()
local font_name = "FantasqueSansMNerdFontMono"

local function font_with_fallback(name, params)
  local names = { name, "noto fonts emoji", "noto-fonts-cjk" }
  return wezterm.font_with_fallback(names, params)
end

config.color_scheme = "GruvboxDarkHard"

--config.front_end = "OpenGL"
config.font = font_with_fallback(font_name)
config.font_rules = {
  {
    italic = true,
    font = font_with_fallback(font_name, { italic = true }),
  },
  {
    italic = false,
    font = font_with_fallback(font_name, { bold = true }),
  },
  {
    intensity = "Bold",
    font = font_with_fallback(font_name, { bold = true }),
  },
}

config.font_size = 10
config.line_height = 1.0

config.default_cursor_style = "BlinkingUnderline"

config.enable_wayland = true

config.disable_default_key_bindings = true

-- Aesthetic Night Colorscheme
config.bold_brightens_ansi_colors = true
-- Padding
config.window_padding = {
  left = 25,
  right = 25,
  top = 25,
  bottom = 25,
}

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

-- General
config.automatically_reload_config = true
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }
config.window_background_opacity = 0.4
config.window_close_confirmation = "NeverPrompt"
config.window_frame = { active_titlebar_bg = "#45475a", font = font_with_fallback(font_name, { bold = true }) }

config.dpi = 192.0

return config
