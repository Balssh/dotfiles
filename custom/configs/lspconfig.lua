local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "pyright", "ruff_lsp", "tsserver", "biome", "tailwindcss", "bashls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- lspconfig.ruff_lsp.setup({
--
-- })
lspconfig.tsserver.setup({
	on_attach = function(client)
		-- this is important, otherwise tsserver will format ts/js
		-- files which we *really* don't want.
		client.server_capabilities.documentFormattingProvider = false
	end,
})
