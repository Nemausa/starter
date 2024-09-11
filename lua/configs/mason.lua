require('mason').setup({
  -- 在这里配置自动安装的工具
  automatic_installation = true,
  -- 其他配置项
})

-- 自动安装你需要的工具
local ensure_installed = {
  "clangd",    
  "pyright",
  "lua-language-server",
  "marksman",
  "markdown-oxide",
  "clang-format",
  "cpptools",
  "debugpy",
}

local mason_registry = require('mason-registry')
for _, tool in ipairs(ensure_installed) do
  local package = mason_registry.get_package(tool)
  if not package:is_installed() then
    package:install()
  end
end
