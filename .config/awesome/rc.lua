-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
beautiful.init("/home/thilo/.config/awesome/themes/one_darker/theme.lua")



-- Error Handling
require("error_handling")

-- Default editor and terminal
terminal = "alacritty"
editor = os.getenv("EDITOR") or "code"
editor_cmd = terminal .. " -e " .. editor

awesome.set_preferred_icon_size(32)

-- Keybindings
require("keys")

-- UI
require("ui")

-- Layouts
require("layouts")

-- Menu
require("menu")

-- Wibar
require("bar")


-- Set keys
root.keys(globalkeys)


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- show titlebar of new window

    if c.first_tag.layout.name ~= "floating" then
        awful.titlebar.hide(c)
    end
    

    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- Enable sloppy focus, so that focus follows mouse.

function delayFunctionCall(time, c)
local t = gears.timer({ timeout = time or 0.5 })  --initiate timer
t:connect_signal("timeout", function()
     t:stop() 
     if c == mouse.current_client then 
        c:emit_signal("request::activate", "mouse_enter", {raise = true}) 
    end; 
end) --focus window
t:start()
end

client.connect_signal("mouse::enter", function(c) -- gets called when mouse enters client(=window)
    delayFunctionCall(0.4, c)
end)

client.connect_signal("focus", function(c) 
    c.border_color = beautiful.border_focus 
--     if c.fullscreen then
--         c.screen.mywibox.ontop = false -- put the wibox in background while window is fullscreen
--     else
--         c.screen.mywibox.ontop = true 
--     end
end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

tag.connect_signal("property::layout", function(t)                  --hide titlebars while tiling
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            if c.class ~= "Polybar" then
              awful.titlebar.show(c)
            end
        else
            awful.titlebar.hide(c)
        end
    end
end)

-- client.connect_signal("property::size", function(c)
--     if c.fullscreen then
--         c.screen.mywibox.ontop = false -- put the wibox in background while window is fullscreen
--     else
--         c.screen.mywibox.ontop = true
--     end

-- end)

-- }}}



-- Autostart Applications
awful.spawn.with_shell("~/.config/picom/ibhagwan-picom/picom --experimental-backends --xrender-sync-fence&")
awful.spawn.with_shell("nitrogen --restore&")

awful.spawn.with_shell("~/.config/polybar/launch.sh&")
-- Unused but maybe is important idk --

-- Keyboard map indicator and switcher
--mykeyboardlayout = awful.widget.keyboardlayout()
