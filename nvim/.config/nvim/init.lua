vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt
local map = vim.keymap.set

opt.shell = "/bin/zsh"
opt.ttimeout = true
opt.ttimeoutlen = 100
opt.updatetime = 300

opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "html", "css", "json"},
    command = "setlocal tabstop=2 shiftwidth=2"
})

map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show error diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "go to prev error" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "go to next error"} )


map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>r", "<cmd>write | !python3 %<CR>", { desc = "Run current Python file" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
