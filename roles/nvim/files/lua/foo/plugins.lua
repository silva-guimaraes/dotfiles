------------------------------
-- configurações de plugins --
------------------------------

-- todo: separar em arquivos.

---------------------
-- nvim-treesitter --
---------------------
-- branch main. É uma reescrita incompatível com o master: não existe mais
-- `configs.setup{}`, nem os módulos `highlight`/`indent`, nem `ensure_installed`
-- ou `auto_install`. O plugin virou só instalador de parsers + coleção de
-- queries; o resto é API nativa do neovim.
--
-- parsers e queries vão para ~/.local/share/nvim/site/{parser,queries}
-- (o install_dir padrão, que já está no runtimepath).
--
-- requer o tree-sitter-cli no PATH.

vim.filetype.add({
    extension = {
        gotmpl = 'gotmpl',
        templ = 'templ',
    },
    pattern = {
        ["*%.tmpl"] = "helm",
    },
})

local ts = require('nvim-treesitter')

-- equivalente ao antigo ensure_installed. roda assíncrono, não trava o startup.
-- no-op para o que já estiver instalado.
ts.install({
    'c', 'lua', 'vim', 'vimdoc', 'query',
    'markdown', 'markdown_inline',
    'go', 'gomod', 'gowork', 'gotmpl',
    'python', 'javascript', 'html', 'css',
    'templ', 'ocaml',
})

-- highlight, indent e auto_install: no master isso era configuração declarativa,
-- aqui tem que ser feito na mão. highlight e indent por buffer, e o auto_install
-- vira "não achou o parser, instala e liga quando terminar".
local grupo = vim.api.nvim_create_augroup('foo.treesitter', { clear = true })

local function ligar(buf, lang)
    if not vim.api.nvim_buf_is_valid(buf) then
        return false
    end
    if not pcall(vim.treesitter.start, buf, lang) then
        return false
    end
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    return true
end

local disponiveis ---@type table<string, true>?

vim.api.nvim_create_autocmd('FileType', {
    group = grupo,
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        if not lang or ligar(ev.buf, lang) then
            return
        end

        -- get_available() dispara o autocmd User TSUpdate a cada chamada,
        -- então vale a pena cachear.
        if not disponiveis then
            disponiveis = {}
            for _, l in ipairs(ts.get_available()) do
                disponiveis[l] = true
            end
        end
        if not disponiveis[lang] then
            return
        end

        ts.install({ lang }):await(function(err)
            if err then
                return
            end
            vim.schedule(function()
                ligar(ev.buf, lang)
            end)
        end)
    end,
})

----------
-- misc --
----------

-- comment.nvim e nvim-autopairs. o setup() destes dois morava no bloco
-- config = function() ... end do packer.lua; vim.pack não tem esse conceito,
-- então a configuração vem para cá.
require('Comment').setup()
require('nvim-autopairs').setup {}

-- trouble. diz o que deu de errado com o lsp.
require('trouble').setup {
    multiline = true,
    -- mode = "document_diagnostics",
}
-- meu irmão em Cristo, eu não compreendo porque mudar a API completamente.
-- vim.keymap.set('n', '<leader>t', '<cmd>TroubleToggle<CR>', {})
vim.keymap.set('n', '<leader>t', '<cmd>Trouble diagnostics toggle<CR>', {})


-- comment.nvim. comenta o seu código.
require('Comment.ft').set('templ', { '//%s', '/*%s*/' })

-- usei emacs por um tempinho e lá eles usavam essa keybind pra comentar
vim.keymap.set('v', '<M-;>', 'gc', { remap = true })
vim.keymap.set('n', '<M-;>', 'gcc', { remap = true })

-- explorador de arquivos
-- local oil_actions = require('oil.actions')
require('oil').setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    default_file_explorer = true,
    delete_to_trash = true,
    keymaps = {
        ['h'] = 'actions.parent',
        ['l'] = 'actions.select',
        ['<C-j>'] = 'actions.select',
        ['g.'] = 'actions.toggle_hidden',
        ['gs'] = 'actions.change_sort',
        ["S"] = "actions.open_terminal",
        ["ss"] = 'actions.open_cmdline',
        ["?"] = 'actions.show_help',
        -- ['yy'] = 'actions.yank_entry',
        ['gx'] = 'actions.open_external',
    },
    view_options = {
        show_hidden = true,
    },
})

-- barra de status
require('lualine').setup()

-- -- wildmenu melhorado
-- local wilder = require 'wilder'
-- wilder.setup {
--     modes = {':', '/', '?'}
-- }

-- wilder.set_option('renderer', wilder.popupmenu_renderer(
--   wilder.popupmenu_palette_theme({
--     -- 'single', 'double', 'rounded' or 'solid'
--     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
--     border = 'rounded',
--     max_height = '75%',      -- max height of the palette
--     min_height = 0,          -- set to the same as 'max_height' for a fixed height window
--     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
--     -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
--     reverse = 0,
--   })
-- ))

require 'smartcolumn'.setup({
    disabled_filetypes = { "help", "text", "markdown", "NvimTree", "lazy",
        "mason", "help", "checkhealth", "lspinfo", "noice", "Trouble",
        "fish", "zsh", "html", "templ" },
    colorcolumn = "115"
})


-- require('slimv').setup()
-- vim.g.slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
-- vim.g.slimv_lisp = 'ros run'
-- vim.g.slimv_impl = 'sbcl'

-- require('example').setup {
--     msg = 'foobar',
-- }


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'LSP References' })



local cfg = {
    floating_window_off_x = 5, -- adjust float windows x position.
    hint_prefix = "📍 ",
    -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
    floating_window_off_y = function()
        local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
        local pumheight = vim.o.pumheight
        local winline = vim.fn.winline() -- line number in the window
        local winheight = vim.fn.winheight(0)

        -- window top
        if winline - 1 < pumheight then
            return pumheight
        end

        -- window bottom
        if winheight - winline < pumheight then
            return -pumheight
        end
        return 0
    end,
}
require "lsp_signature".setup(cfg)
