local dap, dapui = require("dap"), require("dapui")
local nvim_tree = require("nvim-tree")

-- 记录 nvim-tree 窗口的初始宽度
local original_nvim_tree_width = nil

-- 监听调试会话的开始事件
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()

  -- 获取并保存 nvim-tree 窗口的初始宽度
  local nvim_tree_win = vim.fn.bufwinid(vim.fn.bufnr('NvimTree'))
  if nvim_tree_win ~= -1 then
    original_nvim_tree_width = vim.api.nvim_win_get_width(nvim_tree_win)
  end
end

-- 监听调试会话的结束事件
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()

  -- 恢复 nvim-tree 窗口的宽度
  local nvim_tree_win = vim.fn.bufwinid(vim.fn.bufnr('NvimTree'))
  if nvim_tree_win ~= -1 and original_nvim_tree_width then
    vim.api.nvim_win_set_width(nvim_tree_win, original_nvim_tree_width)
  end
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()

  -- 恢复 nvim-tree 窗口的宽度
  local nvim_tree_win = vim.fn.bufwinid(vim.fn.bufnr('NvimTree'))
  if nvim_tree_win ~= -1 and original_nvim_tree_width then
    vim.api.nvim_win_set_width(nvim_tree_win, original_nvim_tree_width)
  end
end

