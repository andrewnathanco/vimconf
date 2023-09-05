local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup({
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        all_features = true,
      }
    }
  }
})

lspconfig.gopls.setup({
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  cmd = {"gopls"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})
-- 
-- lspconfig.pyright.setup { blabla}
