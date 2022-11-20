local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.prettier.with {
		extra_filetypes = { "toml" },
		extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
	},
	b.formatting.prettier.with {
		extra_filetypes = { "svelte" },
	},
	b.formatting.stylua,
	b.formatting.google_java_format,
	b.formatting.gofmt,
	b.formatting.goimports,
	b.diagnostics.staticcheck,
	b.diagnostics.eslint.with {
		extra_filetypes = { "svelte" },
	},
	b.diagnostics.tsc,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup {
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
}
