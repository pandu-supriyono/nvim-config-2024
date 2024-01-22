vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.syntax = "enable"

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.cursorline = true

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  "n", "<Leader>e", ":lua vim.diagnostic.open_float()<CR>", 
  { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  "n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>",
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  "n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>",
  { noremap = true, silent = true }
)

-- Sets line numbers in netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

-- extension settings
vim.filetype.add({ extension = { templ = "templ" } })

-- Podfiles and podspecs are ruby files.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.podspec", "Podfile" },
  command = "set filetype=ruby",
})
