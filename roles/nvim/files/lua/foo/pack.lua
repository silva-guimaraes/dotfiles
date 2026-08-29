--------------------------------------------------
-- gerenciamento de plugins com vim.pack (0.12+) --
--------------------------------------------------
-- Instala em ~/.local/share/nvim/site/pack/core/opt/ e carrega com
-- :packadd!. O estado fica travado em ~/.config/nvim/nvim-pack-lock.json.
--
-- comandos úteis:
--   :lua vim.pack.update()                     -- atualiza tudo (revisar, :w confirma / :q descarta)
--   :lua vim.pack.update(nil, {offline=true})  -- só lista o que está instalado
--   :lua vim.pack.del({'nome'})                -- remove do disco de verdade
--   :lua =vim.pack.get()                       -- inspeciona estado

local gh = function(repo)
    return 'https://github.com/' .. repo
end

-- no branch main do nvim-treesitter os parsers são versionados junto com o
-- plugin: se o plugin mudou, os parsers têm que ser regerados. É o equivalente
-- ao `run = ':TSUpdate'` do packer -- vim.pack não tem hook de build, só eventos.
vim.api.nvim_create_autocmd('PackChanged', {
    group = vim.api.nvim_create_augroup('foo.pack', { clear = true }),
    callback = function(ev)
        local d = ev.data
        if d.spec.name ~= 'nvim-treesitter' or d.kind == 'delete' then
            return
        end
        if not d.active then
            vim.cmd.packadd('nvim-treesitter')
        end
        require('nvim-treesitter').update()
    end,
})

vim.pack.add({
    -- comenta o seu código
    gh 'numToStr/Comment.nvim',
    -- wildmenu readline shortcuts
    gh 'tpope/vim-rsi',
    gh 'windwp/nvim-autopairs',

    -- treesitter. o branch main é o único que suporta o 0.12.
    -- o parser e as queries de templ vêm de fábrica aqui, por isso o
    -- vrischmann/tree-sitter-templ não é mais necessário.
    { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },

    -- colorscheme (material-palenight, ver init.lua)
    gh 'marko-cerovac/material.nvim',

    -- LSP. sem lsp-zero: a configuração é nativa agora (ver foo.lsp).
    -- o nvim-lspconfig hoje só fornece os presets em lsp/, consumidos por
    -- vim.lsp.enable() -- é de lá que vem o gopls, html, templ e htmx.
    gh 'neovim/nvim-lspconfig',
    gh 'williamboman/mason.nvim',
    gh 'L3MON4D3/LuaSnip',
    -- assinatura de funções
    gh 'ray-x/lsp_signature.nvim',

    -- display de erros de sintaxe
    gh 'folke/trouble.nvim',
    gh 'nvim-tree/nvim-web-devicons',
    -- explorador de arquivos
    gh 'stevearc/oil.nvim',
    -- barra de status
    gh 'nvim-lualine/lualine.nvim',
    -- mostra barra na lateral após N colunas
    gh 'm4xshen/smartcolumn.nvim',

    { src = gh 'nvim-telescope/telescope.nvim', version = '0.1.8' },
    gh 'nvim-lua/plenary.nvim', -- dependência do telescope

    -- faz com que os comandos w,e & b sejam case sensitive
    gh 'chaoren/vim-wordmotion',
})
