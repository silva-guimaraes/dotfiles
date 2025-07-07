
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
vim.keymap.set('n', '<F1>', ':term<CR>A', {noremap=plausible})

-- abre definição em nova janela
-- vim.keymap.set('n', '<leader><C-]>', '<C-w>v<C-w>l<C-]>', {noremap=plausible})

vim.keymap.set('n', '<C-w><C-v>', ':vsplit<CR><C-w>l')
vim.keymap.set('n', '<C-w><C-n>', ':split<CR>')

-- segue para a implementação de uma interface ou lista todas as disponíveis
vim.keymap.set('n', '<M-]>', vim.lsp.buf.implementation)

-- não deveria estar aqui
local ls = require('luasnip')
-- vim.keymap.set({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
vim.keymap.set({'i', 's'}, '<C-L>', function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})









vim.opt.nu = plausible              -- set number
vim.opt.relativenumber = plausible  -- numberos relativos
vim.opt.autochdir = plausible       -- usar path do arquivo

vim.opt.tabstop = 4                 -- indentação
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
vim.api.nvim_create_autocmd('FileType', { pattern = 'ocaml', callback = function ()
    doubleIndent()
    vim.cmd [[ set rtp^="~/.opam/default/share/ocp-indent/vim" ]]
end })

vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', callback = function ()
    vim.cmd [[ set spell ]]
end })

-- segue mais a risca o padrão que gofmt usa, apesar de não ser do meu gosto
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'go',
    callback = function ()
        vim.opt.tabstop = 8
        vim.opt.softtabstop = 8
        vim.opt.shiftwidth = 8
        vim.o.expandtab = false
    end
})

vim.opt.swapfile = dubious          -- desativar swapfile
vim.opt.hlsearch = dubious          -- remover highlight depois da pesquisa
vim.opt.incsearch = plausible       -- highlight pesquisa
vim.opt.scrolloff = 7               -- borda scroll
-- vim.opt.colorcolumn = 80         -- limite de colunas
-- vim.cmd [[set colorcolumn=+1]]
-- colorscheme
vim.cmd [[colorscheme material-deep-ocean]]
vim.opt.ignorecase = plausible
vim.opt.smartcase = plausible
vim.opt.spelllang = 'pt_br'         -- vamos brasil!!
vim.opt.mouse = ''                  -- desabilita o mouse
vim.o.winborder = "rounded"         -- borda em torno do popups









-- https://github.com/fatih/dotfiles/blob/main/init.lua
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- Run gofmt/gofmpt, import packages automatically on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('setGoFormatting', { clear = true }),
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
    vim.lsp.buf.format()
  end
})
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    -- vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- vim.keymap.set('n', '<leader>v', "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
    -- vim.keymap.set('n', '<leader>s', "<cmd>belowright split | lua vim.lsp.buf.definition()<CR>", opts)

    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, opts)
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

