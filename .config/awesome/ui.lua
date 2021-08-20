-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

-- Theme handling library
local beautiful = require("beautiful")

-- Titlebar --
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
    local titlebar = awful.titlebar(c, {
      size = dpi(25)
    })

    titlebar: setup {
        -- { -- Left
        --     awful.titlebar.widget.iconwidget(c),
        --     buttons = buttons,
        --     layout  = wibox.layout.fixed.horizontal
        -- },
        nil,
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            -- awful.titlebar.widget.floatingbutton (c),
            -- awful.titlebar.widget.maximizedbutton(c),
            -- awful.titlebar.widget.stickybutton   (c),
            -- awful.titlebar.widget.ontopbutton    (c),
            -- awful.titlebar.widget.closebutton    (c),
            wibox.layout.margin(awful.titlebar.widget.minimizebutton(c), dpi(4), dpi(6), dpi(6), dpi(6)),
            wibox.layout.margin(awful.titlebar.widget.maximizedbutton(c), dpi(4), dpi(6), dpi(6), dpi(6)),
            wibox.layout.margin(awful.titlebar.widget.closebutton(c), dpi(4), dpi(6), dpi(6), dpi(6)),
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Rules --
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          -- "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {
      type = { "normal", "dialog" }},

      properties = { titlebars_enabled = true }
    },

    
    { rule = { 
      class = "Polybar" }, 
      properties = {  focusable = false, titlebar = false, border_width = 0 } },

    { rule = { 
      class = "Polydock" }, 
      properties = {  focusable = false, titlebar = false, border_width = 0 } },

    { rule = { 
      class = "Plank" }, 
      properties = {titlebar = false, border_width = 0, below = true, focusable = false } },

    { rule = { 
      class = "GLava" }, 
      properties = {  focusable = false, 
                      titlebars_enabled = false, 
                      border_width = 0, 
                      maximized = true, 
                      below = true,
                      sticky = true} 
      },
                    
    { rule = { 
      class = "Chromium-browser" },  
      properties = {floating = false}},
}
