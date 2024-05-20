-- configurações de plugins
--
--

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pp', builtin.live_grep, {})
vim.keymap.set('n', '<C-[>', "<cmd>Telescope lsp_references<cr>", {noremap=true})
vim.keymap.set("n", "<leader>ps", function ()
    builtin.grep_string({ search = vim.fn.input("grep: ") });
end)

-- nvim-treesitter
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
----------------------------------------------------------


-- lsp
require'lspconfig'.templ.setup {}

require("mason").setup {
    log_level = vim.log.levels.DEBUG
}
local lsp = require('lsp-zero')
lsp.preset('recommended')
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()

-- trouble
vim.keymap.set('n', '<leader>t', '<cmd>TroubleToggle<CR>', {})

-- comment.nvim
vim.keymap.set('v', '<M-;>', 'gc', {remap=true})
vim.keymap.set('n', '<M-;>', 'gcc', {remap=true})

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
    },
})
