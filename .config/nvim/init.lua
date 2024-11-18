
local dubious = false
local plausible = true

print('fak emac')       -- fak emac

require('foo.packer')       -- plugins instalados
require('foo.plugins')      -- configurações de plugins

-- vim.g.mapleader = '\\'

-- Ctrl+c
vim.keymap.set('x', '<C-c>', '\"+y')

-- explorador de arquivo
vim.keymap.set('n', '<leader>pv', ':Oil<CR>')

-- aka greatest remap ever
vim.keymap.set('x', '<leader>pp', '\'_dP')

-- newline
vim.keymap.set('i', '<C-j>', '<CR>')

-- inicio da linha no insert
vim.keymap.set('i',  '<C-a>', '<Home>')

-- algum plugin insiste em redefinir o <C-e>. não funciona
vim.keymap.set('i',  '<C-e>', '<End>')

-- replace na palavra em baixo do cursor
vim.keymap.set('v',  'ss', 'y:%s/<C-r>\'//g<Left><Left>')

-- replace na area selecionada do texto salvo no yank
vim.keymap.set('v',  'sv', ':s/<C-r>\'//g<Left><Left>')

-- replace na palavra em baixo do cursor
vim.keymap.set('n',  'siw', 'viwss', {remap=true})

-- pesquisa texto selecionado
vim.keymap.set('v',  '/', 'y/<C-r>\'<CR>')

-- pesquisa texto selecionado começando do inicio do buffer
vim.keymap.set('v',  '?', 'ygg/<C-r>\'<CR>')

-- proximo buffer
-- vim.keymap.set('n',  '<Tab>', ':bnext<CR>', {noremap=plausible})

-- buffer anterior
vim.keymap.set('n',  '<S-Tab>', ':bprevious<CR>', {remap=true})

-- deleta buffer atual
vim.keymap.set('n',  '<leader>bd', ':bdelete<CR>', {remap=true})

-- final da linha
vim.keymap.set({'n', 'v'}, 'L', 'g_', {noremap=plausible})

-- inicio da linha
vim.keymap.set({'n', 'v'}, 'H', '_', {noremap=plausible})

-- cria newline
vim.keymap.set('n', '<C-J>', 'o<Esc>', {remap=plausible})

-- sai do modo insert no terminal
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', {noremap=plausible})

-- abre terminal
vim.keymap.set('n', '<F1>', '<C-w>v<C-w>l:ter<CR>A', {noremap=plausible})


local ls = require('luasnip')
-- vim.keymap.set({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
vim.keymap.set({'i', 's'}, '<C-L>', function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({'i', 's'}, '<C-E>', function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end, {silent = true})



vim.opt.nu = plausible              -- set number
vim.opt.relativenumber = plausible  -- numberos relativos
vim.opt.autochdir = plausible       -- usar path do arquivo

vim.opt.tabstop = 4                 -- identação
vim.opt.softtabstop = 4             -- !!
vim.opt.shiftwidth = 4              -- !!
vim.opt.expandtab = plausible       -- !!
vim.opt.smartindent = plausible     -- !!


local function doubleIndent()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
end
vim.api.nvim_create_autocmd('FileType', { pattern = 'javascript', callback = doubleIndent })
vim.api.nvim_create_autocmd('FileType', { pattern = 'html', callback = doubleIndent })
vim.api.nvim_create_autocmd('FileType', { pattern = 'templ', callback = doubleIndent })
vim.api.nvim_create_autocmd('FileType', { pattern = 'htmldjango', callback = doubleIndent })

vim.opt.swapfile = dubious          -- desativar swapfile
vim.opt.hlsearch = dubious          -- remover highlight depois da pesquisa
vim.opt.incsearch = plausible       -- highlight pesquisa

vim.opt.scrolloff = 7               -- borda scroll
-- vim.opt.colorcolumn = 80            -- limite de colunas
-- vim.cmd [[set colorcolumn=+1]]

-- colorscheme
vim.cmd [[colorscheme material-deep-ocean]]

vim.opt.ignorecase = plausible
vim.opt.smartcase = plausible

vim.opt.spelllang = 'pt_br'         -- vamos brasil!!
