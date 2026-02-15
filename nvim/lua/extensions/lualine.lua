local colors = require('onenord.colors').load()

local switch_color = {
  active = { fg = colors.active, bg = colors.mypink },
  inactive = { fg = colors.active, bg = colors.light_gray },
}

require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },

  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        shorting_target = 24,
        symbols = { modified = '_󰷥', readonly = ' ', newfile = '󰄛' },
      },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'nvim_lsp' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
      },
      { 'navic' }
    },
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_x = {
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' }, source = diff_source },
    },

    lualine_y = {
      { 'b:gitsigns_head', icon = { '', color = { fg = colors.orange } }, color = { fg = colors.fg } },
    },

    lualine_z = {
      { 'fileformat', icons_enabled = true, separator = { left = '', right = '' } },
    },
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = switch_color,
        symbols = { modified = '_󰷥', alternate_file = ' ', directory = ' ' },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
      'diff'
    },
    lualine_y = {
      'branch'
    },
    lualine_z = {
      { 'tabs', tabs_color = switch_color },
    },
  },

}

vim.api.nvim_set_option('showmode', false)

