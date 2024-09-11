-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright",  }
local nvlsp = require "nvchad.configs.lspconfig"
local capabilities = require("nvchad.configs.lspconfig").capabilities
vim.diagnostic.config({
  virtual_text = false,  -- 禁用行内错误提示
  signs = false,         -- 禁用左侧符号显示
  underline = false,     -- 禁用错误的下划线
  update_in_insert = false,  -- 插入模式下不更新诊断
  severity_sort = true,   -- 按严重性排序诊断
  float = { border = "rounded" },  -- 配置浮动窗口边框样式（可选）
})


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- clangd for C/C++
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

-- Pyright for Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  root_dir = lspconfig.util.root_pattern(".git", "pyrightconfig.json"),
}

-- Marksman for Markdown
lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown" },
  root_dir = lspconfig.util.root_pattern(".git", ".marksman.json"),
}
