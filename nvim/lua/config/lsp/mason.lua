local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		border = "rounded",
	},
})

local status_ok_mason_lspc, mason_lspc = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspc then
	return
end

mason_lspc.setup()

local opts = {
	on_attach = require("config.lsp.handlers").on_attach,
	capabilities = require("config.lsp.handlers").capabilities,
}

mason_lspc.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup(opts)
	end,
})
