local vim = vim
local opt = vim.opt

opt.fileencoding = "utf-8" -- the encoding written to a file
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.swapfile = false -- creates a swapfile
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.termguicolors = false -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = false -- disable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.showtabline = 0 -- always show tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false
opt.number = true -- set numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.cursorline = true -- highlight the current line
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.fillchars.eob = " "
opt.shortmess:append "c"
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.pumheight = 10 -- pop up menu height
opt.colorcolumn = "100"
