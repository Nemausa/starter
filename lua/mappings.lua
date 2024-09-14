require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('i', 'jj', '<Esc>')
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Comment
map('n', '<leader>cf', ':!clang-format -i %<CR><CR>', { noremap = true, silent = true })
map('n', '<leader>ba', ':bufdo bd <CR>', { desc = "close all buffers",  noremap = true, silent = true })
map('n', '<leader>bn', ':bnext | bd#<CR>', { desc = "close current tab and buffer goto next",  noremap = true, silent = true })

-- Gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
map("n", "<leader>gcl", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Markdown
map("n", "<leader>mp", ":MarkdownPreview<CR>", {})

-- Move
map('x', '<A-Up>', ":move '<-2<CR>gv=gv")
map('n', '<A-Up>', ":move .-2<CR>==")
map('x', '<A-Down>', ":move '>+1<CR>gv=gv")
map('n', '<A-Down>', ":move .+1<CR>==")

-- Debug
map('n', '<F2>', '<cmd>lua require("dapui").toggle()<CR>')
map('n', '<F5>', '<cmd>lua require("dap").continue()<CR>')
map('n', '<F10>', '<cmd>lua require("dap").step_over()<CR>')
map('n', '<F11>', '<cmd>lua require("dap").step_into()<CR>')
map('n', '<F12>', '<cmd>lua require("dap").step_out()<CR>')
map('n', '<F9>', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
map('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')
map('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>')

map('n', '<leader>ts', ':tselect<CR>t')
map('n', 'gd', '<C-]>', {noremap = true, silent = true })
vim.cmd [[
  let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'build']
]]
vim.api.nvim_create_user_command('Ctags', function()
  local cwd = vim.fn.getcwd()
  local result = vim.fn.system('ctags -R ' .. cwd)
  print(result)
end, {})
map('n', '<leader>ct', ':Ctags<CR>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: "), search_dirs = { vim.fn.expand("%") } })<CR>')

-- switch header or source file
map('x', '<A-o>', ":A<CR>")
map('n', '<A-o>', ":A<CR>")
map('n', '<leader>z', ':A<CR>')

vim.api.nvim_create_user_command('CustomDiffviewOpen', function()
  local nvim_tree_view = require'nvim-tree.view'
  if nvim_tree_view.is_visible() then
      vim.cmd('NvimTreeClose')
  end

  vim.cmd('DiffviewOpen')
end, {})
map('n', '<leader>do', ':CustomDiffviewOpen<CR>')
map('n', '<leader>dc', ':DiffviewClose<CR>')
map('v', '<leader>cc', ':CarbonNow<CR>', { noremap = true, silent = true })
