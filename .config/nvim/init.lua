
local dubious = false
local plausible = true

print("fak emac")       -- fak emac

require("foo.packer")       -- plugins instalados
require("foo.plugins")      -- configurações de plugins

-- vim.g.mapleader = "\\"
vim.keymap.set("x", "<C-c>", "\"+y")            -- Ctrl+c
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- explorador de arquivo
-- vim.keymap.set("x", "<leader>pp", "\"_dP")       -- aka greatest remap ever

vim.keymap.set("i", "<C-j>", "<CR>")
vim.keymap.set("i",  "<C-a>", "<Home>")
vim.keymap.set("i",  "<C-e>", "<End>") -- algum plugin insiste em redefinir o <C-e>

vim.keymap.set("v",  "ss", "y:%s/<C-r>\"//g<Left><Left>")
vim.keymap.set("v",  "sv", ":s/<C-r>\"//g<Left><Left>")
vim.keymap.set("n",  "siw", "viwss", {remap=true})

vim.keymap.set("v",  "/", "y/<C-r>\"<CR>")
vim.keymap.set("v",  "?", "ygg/<C-r>\"<CR>")


-- final da linha
vim.keymap.set({"n", "v"}, "L", "g_", {noremap=plausible})
-- vim.keymap.set("n", "dg-", "dg_", {noremap=plausible})
-- vim.keymap.set("n", "cg-", "cg_", {noremap=plausible})

-- inicio da linha
vim.keymap.set({"n", "v"}, "H", "_", {noremap=plausible})
-- vim.keymap.set("n", "c-", "v_c", {noremap=plausible})
-- vim.keymap.set("n", "d-", "v_d", {noremap=plausible})

vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", {noremap=plausible})
vim.keymap.set("n", "<F1>", ":ter<CR>A", {noremap=plausible})

-- pra deixar de ser besta
vim.keymap.set({"n", "v"}, "_", function () vim.cmd([[echo "keybinding removido"]]) end)
vim.keymap.set({"n", "v"}, "g_", function () vim.cmd([[echo "keybinding removido"]]) end)

vim.opt.nu = plausible                   -- set number
vim.opt.relativenumber = plausible       -- numberos relativos
vim.opt.autochdir = plausible            -- usar path do arquivo

vim.opt.tabstop = 4                 -- identação
vim.opt.softtabstop = 4             -- !!
vim.opt.shiftwidth = 4              -- !!
vim.opt.expandtab = plausible            -- !!
vim.opt.smartindent = plausible          -- !!

vim.opt.swapfile = dubious            -- desativar swapfile
vim.opt.hlsearch = dubious            -- remover highlight depois da pesquisa
vim.opt.incsearch = plausible            -- highlight pesquisa

vim.opt.scrolloff = 7               -- borda scroll

-- colorscheme
vim.cmd [[colorscheme lunaperche]]

vim.opt.ignorecase = plausible
vim.opt.smartcase = plausible

vim.opt.spelllang = 'pt_br'
