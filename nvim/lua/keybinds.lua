-- if enter x, it's not added into the registry. So you can paste the same copy over and onver
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('n', 's', '"_s')
vim.api.nvim_set_var('mapleader', '\\')

--[[
-- sample to use anonymous function
function testfunc()
  print('i am test function')
end
vim.keymap.set('n', '<Leader>3', testfunc)
]]



