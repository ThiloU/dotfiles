-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Hotkeys library
local hotkeys_popup = require("awful.hotkeys_popup")

-- Modkey --
modkey = "Mod4"

-- Initial Status of top-bar
barVisible = true
-- Keybindings --
globalkeys = gears.table.join(

    -- Tag --

        -- Cheatsheet help popup
        awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
                {description="show help", group="awesome"}),

        -- Previous workspace
        awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
                {description = "view previous", group = "tag"}),

        -- Next Workspace
        awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
                {description = "view next", group = "tag"}),

        -- Restore workspace
        awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
                {description = "go back", group = "tag"}),

    -- Client --

        -- Next window
        awful.key({ modkey,           }, "j",
            function ()
                awful.client.focus.byidx( 1)
            end,
            {description = "focus next by index", group = "client"}
        ),

        -- Previous window
        awful.key({ modkey,           }, "k",
            function ()
                awful.client.focus.byidx(-1)
            end,
            {description = "focus previous by index", group = "client"}
        ),

        -- Layout manipulation
        awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
                {description = "swap with next client by index", group = "client"}),
        awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
                {description = "swap with previous client by index", group = "client"}),
        awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
                {description = "jump to urgent client", group = "client"}),

        awful.key({ "Mod1",           }, "Tab",
            function ()
                switcher.switch( 1, "Mod1", "Alt_L", "Shift", "Tab")
            end),
    
        awful.key({ "Mod1", "Shift"   }, "Tab",
            function ()
                switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab")
            end),
        -- awful.key({ modkey,           }, "Tab",                         -- Super + Tab behaviour block start
        --           function ()
        --               -- awful.client.focus.history.previous()
        --               awful.client.focus.byidx(-1)
        --               if client.focus then
        --                   client.focus:raise()
        --               end
        --           end,
        --     {description = "go to next client", group = "client"}),

        --       awful.key({ modkey, "Shift"   }, "Tab",
        --           function ()
        --               -- awful.client.focus.history.previous()
        --               awful.client.focus.byidx(1)
        --               if client.focus then
        --                   client.focus:raise()
        --               end
        --           end,
        --     {description = "go to previous client", group = "client"}),  -- Super + Tab behaviour block end

        -- Restore minimized
        awful.key({ modkey, "Control" }, "n",
            function ()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
                end
            end,
            {description = "restore minimized", group = "client"}),

    -- Awesome --

        -- Restart awesome
        awful.key({ modkey, "Control" }, "r", awesome.restart,
                {description = "reload awesome", group = "awesome"}),

        -- Quit awesome
        awful.key({ modkey, "Shift"   }, "q", awesome.quit,
                {description = "quit awesome", group = "awesome"}),

        awful.key({ modkey }, "x",
            function ()
                awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                }
            end,
            {description = "lua execute prompt", group = "awesome"}),

        -- own keybind: toggle visibility of polybar and wibar
        awful.key({ modkey }, "b",
        function ()
            if barVisible then
                -- mouse.screen.mywibox.visible = false
                os.execute("polybar-msg cmd hide")
            else
                -- mouse.screen.mywibox.visible = true
                os.execute("polybar-msg cmd restart")
            end

            barVisible = not barVisible
        end,
        {description = "hide the top bar", group = "awesome"}),

    -- Launcher --

        -- Open terminal
        awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
                {description = "open a terminal", group = "launcher"}),

        -- Run Dmenu
        awful.key({ modkey },            "r",     function ()
            awful.spawn(string.format("dmenu_run")) end,
                {description = "run dmenu", group = "launcher"}),

        -- Menubar
        awful.key({ modkey }, "p", function() menubar.show() end,
                {description = "show the menubar", group = "launcher"}),

    -- Layout --

        awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
                {description = "increase master width factor", group = "layout"}),
        awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
                {description = "decrease master width factor", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
                {description = "increase the number of master clients", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
                {description = "decrease the number of master clients", group = "layout"}),
        awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
                {description = "increase the number of columns", group = "layout"}),
        awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
                {description = "decrease the number of columns", group = "layout"}),
        awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
                {description = "select next", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
                {description = "select previous", group = "layout"})
)

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Mouse buttons --
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Applied in the ui.lua to be managed by all clients
clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)
