vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "\\", ":b#<CR>")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("n", "<Esc>", ':let @/ = ""<CR>')

vim.keymap.set("n", "<C-c>", ":q<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { noremap = true, silent = true })

