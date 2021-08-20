-- ==================================================================================
--
--  ██████╗ ███╗   ██╗███████╗    ██████╗  █████╗ ██████╗ ██╗  ██╗███████╗██████╗
--  ██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
--  ██║   ██║██╔██╗ ██║█████╗      ██║  ██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
--  ██║   ██║██║╚██╗██║██╔══╝      ██║  ██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
--  ╚██████╔╝██║ ╚████║███████╗    ██████╔╝██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
--  ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
--
--                              One Darker Theme.
--      Inspired by eserozvataf's vscode theme One Dark Pro Monokai Darker.
--
-- =================================================================================

-- Basic libraries
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi

local theme = {}
-- theme.wallpaper = "~/Bilder/Wallpapers/Nordic.png" handled by nitrogen in rc.lua
-- Variables --

theme.name = "one_darker"

theme.useless_gap = 7

-- Font
--theme.font = "SF Pro Text 9"
--theme.title_font = "SF Pro Display Medium 10"

theme.font = "Noto Sans Regular 11"
--theme.title_font = "SF Mono 10"

-- Menu
theme.menu_height = 20
theme.menu_width  = 150


-- Background
theme.bg_normal = "#313742"
theme.bg_dark = "#121212"
theme.bg_urgent = "#181a1f"
theme.bg_focus = "#4c566a"
theme.bg_minimize = "#121212"

-- Foreground
theme.fg_normal = "#f8f8f0"
theme.fg_focus = "#d7dae0"
theme.fg_urgent = "#f8f8f0"
theme.fg_minimize = "#f8f8f0"

-- Corner Radius
theme.corner_radius = dpi(7)

-- Window Borders
theme.border_width = dpi(0)
theme.border_normal = "#3E435C"
theme.border_focus = "#708ED2"
theme.border_marked = theme.fg_urgent

-- Taglist
theme.taglist_bg_empty = theme.bg_dark
theme.taglist_bg_occupied = theme.bg_dark
theme.taglist_bg_urgent = "#e06c75"
theme.taglist_bg_focus = theme.bg_dark
theme.taglist_spacing = dpi(0)

-- Icons --

-- Layout icons
theme.layout_floating = "~/.config/awesome/themes/one_darker/icons/layouts/floating.png"

theme.layout_tile       = "~/.config/awesome/themes/one_darker/icons/layouts/tiled.png"
theme.layout_tileleft   = "~/.config/awesome/themes/one_darker/icons/layouts/tileleft.png"
theme.layout_tileleft   = "~/.config/awesome/themes/one_darker/icons/layouts/tileright.png"

theme.layout_tilebottom = "~/.config/awesome/themes/one_darker/icons/layouts/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/themes/one_darker/icons/layouts/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/themes/one_darker/icons/layouts/fairv.png"
theme.layout_fairh      = "~/.config/awesome/themes/one_darker/icons/layouts/fairh.png"
theme.layout_spiral     = "~/.config/awesome/themes/one_darker/icons/layouts/spiral.png"

-- theme.icon_theme = "Tela-dark"

-- Titlebars

theme.titlebars_enabled = true

local icon_dir = "~/.config/awesome/themes/one_darker/icons/"

theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_normal
theme.titlebar_fg_normal = theme.fg_focus

-- Close Button
theme.titlebar_close_button_normal = icon_dir .. 'normal.png'
theme.titlebar_close_button_focus  = icon_dir .. 'close_focus.png'
theme.titlebar_close_button_normal_hover = icon_dir .. 'close_focus_hover.png'
theme.titlebar_close_button_focus_hover  = icon_dir .. 'close_focus_hover.png'

-- Minimize Button
theme.titlebar_minimize_button_normal = icon_dir .. 'normal.png'
theme.titlebar_minimize_button_focus  = icon_dir .. 'minimize_focus.png'
theme.titlebar_minimize_button_normal_hover = icon_dir .. 'minimize_focus_hover.png'
theme.titlebar_minimize_button_focus_hover  = icon_dir .. 'minimize_focus_hover.png'

-- Maximized Button (While Window is Maximized)
theme.titlebar_maximized_button_normal_active = icon_dir .. 'normal.png'
theme.titlebar_maximized_button_focus_active  = icon_dir .. 'maximized_focus.png'
theme.titlebar_maximized_button_normal_active_hover = icon_dir .. 'maximized_focus_hover.png'
theme.titlebar_maximized_button_focus_active_hover  = icon_dir .. 'maximized_focus_hover.png'

-- Maximized Button (While Window is not Maximized)
theme.titlebar_maximized_button_normal_inactive = icon_dir .. 'normal.png'
theme.titlebar_maximized_button_focus_inactive  = icon_dir .. 'maximized_focus.png'
theme.titlebar_maximized_button_normal_inactive_hover = icon_dir .. 'maximized_focus_hover.png'
theme.titlebar_maximized_button_focus_inactive_hover  = icon_dir .. 'maximized_focus_hover.png'

return theme
