vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor)

local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

ufo.setup({
	provider_selector = function(_, filetype, buftype)
		local function handleFallbackException(bufnr, err, providerName)
			if type(err) == "string" and err:match("UfoFallbackException") then
				return require("ufo").getFolds(bufnr, providerName)
			else
				return require("promise").reject(err)
			end
		end

		return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
			or function(bufnr)
				return require("ufo")
					.getFolds(bufnr, "lsp")
					:catch(function(err)
						return handleFallbackException(bufnr, err, "treesitter")
					end)
					:catch(function(err)
						return handleFallbackException(bufnr, err, "indent")
					end)
			end
	end,
})
