

print("fak emac")       -- fak emac

require("foo.packer")       -- plugins instalados
require("foo.plugins")      -- configurações de plugins

-- vim.g.mapleader = "\\"
vim.keymap.set("x", "<C-c>", "\"+y")            -- Ctrl+c
vim.keymap.set("i", "<C-v>", "\"+p")            -- Ctrl+v
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- explorador de arquivo
vim.keymap.set("x", "<leader>p", "\"_dP")       -- aka greatest remap ever

vim.opt.nu = true               -- set number
vim.opt.relativenumber = true   -- numberos relativos

vim.opt.tabstop = 4             -- indentação
vim.opt.softtabstop = 4         -- !!
vim.opt.shiftwidth = 4          -- !!
vim.opt.expandtab = true        -- !!
vim.opt.smartindent = true      -- !!

vim.opt.swapfile = false        -- desativa swapfile
vim.opt.hlsearch = false        -- desativar highlight da pesquisa
vim.opt.incsearch = true        -- highlight em tempo real

vim.opt.scrolloff = 7           -- borda de scroll
