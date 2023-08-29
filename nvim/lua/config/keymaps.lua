-- Fixes typos
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qa
]])

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<Tab>", "^==<ESC>", opts)

-- Config reload
keymap("n", "<leader>rc", ":source $MYVIMRC<CR>", opts)

-- Fast split
keymap("n", "vv", ":vsplit<CR>", opts)
keymap("n", "vs", ":split<CR>", opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<CMD>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>bd", "<CMD>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Fast save
keymap("n", "<leader>w", ":w!<CR>", { noremap = true })
keymap("n", "<leader>wa", ":wall!<CR>", { noremap = true })

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Navigator
keymap("n", "<C-h>", ":NavigatorLeft<CR>", opts)
keymap("n", "<C-l>", ":NavigatorRight<CR>", opts)
keymap("n", "<C-k>", ":NavigatorUp<CR>", opts)
keymap("n", "<C-j>", ":NavigatorDown<CR>", opts)

keymap("i", "<C-h>", "<ESC>:NavigatorLeft<CR>", opts)
keymap("i", "<C-l>", "<ESC>:NavigatorRight<CR>", opts)
keymap("i", "<C-k>", "<ESC>:NavigatorUp<CR>", opts)
keymap("i", "<C-j>", "<ESC>:NavigatorDown<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("v", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("x", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "ff", ":Telescope find_files<CR>", opts)
keymap("n", "ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", opts)
