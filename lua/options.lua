require "nvchad.options"
require ("configs.dap_cpp")
require ("configs.dap_python")
require ("configs.dap_config")
require ("configs.mason")
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
if vim.fn.has('nvim-0.8') == 1 then
  vim.g.do_filetype_lua=1
  vim.g.did_load_filetypes=0
end
vim.opt.expandtab=true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guifont = 'Consolas:h14'
vim.opt.colorcolumn = '80'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.ale_enabled = 0
vim.opt.list = true
vim.opt.listchars:append("space:.")

vim.api.nvim_set_keymap('n', '<leader>sc', ':lua SetTabOptions()<CR>', { noremap = true, silent = true })
function SetTabOptions()
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.expandtab = true
end

vim.cmd [[
    augroup AutoSave
        autocmd!
        autocmd TextChanged,TextChangedI * silent! lua vim.cmd('write!')
    augroup END
]]


vim.cmd('autocmd FileType c,cpp setlocal commentstring=//\\ %s')
vim.api.nvim_create_augroup("SetTabOptionsGroup", { clear = true })
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
  group = "SetTabOptionsGroup",
  pattern = {"*.c", "*.cpp", "*.h"},
  callback = function()
      SetTabOptions()
  end,
})
