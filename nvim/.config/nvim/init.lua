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
--error viewing
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show error diagnostic" })
map("n", "<leader>[", vim.diagnostic.goto_prev, { desc = "go to prev error" })
map("n", "<leader>]", vim.diagnostic.goto_next, { desc = "go to next error"} )
--save
map("n", "<leader>s", ":wa")
--split
map("n", "<leader>v", ":vsplit")

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
