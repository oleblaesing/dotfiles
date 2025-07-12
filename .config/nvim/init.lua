vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.encoding = "UTF-8"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = false
vim.opt.writebackup = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>b", ":bro ol<CR>", { desc = "Browse old files" })
vim.keymap.set("n", "<leader>c", ":e #<CR>", { desc = "Switch to last file" })
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
