local lspconfig = require "lspconfig"
-- local on_attach = lspconfig.on_attach
-- local capabilities = lspconfig.capabilities
local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local servers = { "gopls" }

for _, ls in ipairs(servers) do
  lspconfig[ls].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup{}
lspconfig.golangci_lint_ls.setup{}
lspconfig.bufls.setup{}
lspconfig.graphql.setup{
  root_dir = lspconfig.util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*", ".gqlgenc.yml")
}
lspconfig.yamlls.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.dockerls.setup{}
lspconfig.jsonls.setup{}
lspconfig.eslint.setup{
  on_attach =
    function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
}
lspconfig.bashls.setup{}
lspconfig.volar.setup{
  filetypes = {"typescript", "javascript", "vue", "json"}
}
-- lspconfig.csharp_ls.setup{}
lspconfig.omnisharp.setup{
  cmd = {"/usr/bin/omnisharp"},
}
-- lspconfig.phan.setup{}
lspconfig.phpactor.setup{
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = true,
  }
}

