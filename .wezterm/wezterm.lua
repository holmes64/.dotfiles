local wezterm = require("wezterm")
local act = wezterm.action

require('format')
require('status')

-- configure hot keys
local keybinds = require('keybinds')
local keys = keybinds.keys or {}
table.insert(keys, { key = '"', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } })
table.insert(keys, { key = '%', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } })

return {
    status_update_interval = 1000,
    color_scheme = 'Catppuccin Mocha',
    window_background_opacity = 0.93,
    font = wezterm.font("Firge35Nerd Console"),
    font_size = 12.0,
    window_frame = {
        font = wezterm.font('Roboto'),
        font_size = 8.0,
    },
    use_fancy_tab_bar = false,
    leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 2000 },
    keys = keys,
    key_tables = keybinds.key_tables,
}

