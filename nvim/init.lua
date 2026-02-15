vim.loader.enable()

require("options")
require("keybinds")
require("appearance")
require("extensions")

vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
