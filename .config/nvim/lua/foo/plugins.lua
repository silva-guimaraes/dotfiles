------------------------------
-- configurações de plugins --
------------------------------

-- todo: separar isso tudo em arquivos.

---------------------
-- nvim-treesitter --
---------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = {
        "c", "lua", "vim", "go", "python", "javascript", "html", "css"
        --[[ , "help" ]]
    },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true
  }
}
local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
treesitter_parser_config.templ = {
    install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "master",
    },
}

vim.treesitter.language.register("templ", "templ")

treesitter_parser_config.d2 = {
  install_info = {
    url = 'https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'd2',
};
vim.treesitter.language.register('d2', 'd2')

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})





----------
-- lsp ---
----------

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup{
    settings = {
        implicitProjectConfiguration = {
            checkJs = true
        },
    }
}
lspconfig.templ.setup {}
lspconfig.html.setup { filetypes = { "html", "templ", "cshtml", "javascript"}, }
lspconfig.htmx.setup{ filetypes = { "html", "templ" }, }


vim.keymap.set("n", "<leader>lr", function ()
    vim.cmd [[ LspRestart ]]
    print("Lsp restarted!")
end, {noremap=true})


require("mason").setup {
    log_level = vim.log.levels.DEBUG
}
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()





----------
-- misc --
----------

-- trouble. diz o que deu de errado com o lsp.
require('trouble').setup {
    multiline = true,
    -- mode = "document_diagnostics",
}
vim.keymap.set('n', '<leader>t', '<cmd>TroubleToggle<CR>', {})


-- comment.nvim. comenta o seu código.
require('Comment.ft').set('templ', {'//%s', '/*%s*/'})

-- usei emacs por um tempinho e lá eles usavam essa keybind pra comentar
vim.keymap.set('v', '<M-;>', 'gc', {remap=true})
vim.keymap.set('n', '<M-;>', 'gcc', {remap=true})

-- explorador de arquivos
require('oil').setup({
    default_file_explorer = true,
    delete_to_trash = true,
    keymaps = {
        ['h'] = 'actions.parent',
        ['l'] = 'actions.select',
        ['<C-j>'] = 'actions.select',
        ['g.'] = 'actions.toggle_hidden',
        ['gx'] = 'actions.open_external',
        ['gs'] = 'actions.change_sort',
        ["S"] = "actions.open_terminal",
    },
})

-- barra de statu
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

require'smartcolumn'.setup({
    disabled_filetypes = { "help", "text", "markdown", "NvimTree", "lazy",
        "mason", "help", "checkhealth", "lspinfo", "noice", "Trouble",
        "fish", "zsh", "html", "templ"},
    colorcolumn = "115"
})


-- require('slimv').setup()
vim.g.slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
vim.g.slimv_lisp = 'ros run'
vim.g.slimv_impl = 'sbcl'

-- require('example').setup {
--     msg = 'foobar',
-- }

