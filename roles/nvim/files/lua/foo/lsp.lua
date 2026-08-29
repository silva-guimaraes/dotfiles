vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
})
vim.lsp.config('templ', {})
vim.lsp.config('html', { filetypes = { "html", "templ", "cshtml", "javascript" } })
vim.lsp.config('htmx', { filetypes = { "html", "templ" }, })
vim.lsp.config['ocamllsp'] = {
    cmd = { 'ocamllsp' },
    filetypes = { 'ocaml' },
    root_markers = { 'dune-project', 'dune' },
}

vim.lsp.enable({
    'gopls',
    'luals',
    'html',
    'ocamllsp',
})


vim.keymap.set("n", "<leader>lr", function()
    vim.cmd [[ LspRestart ]]
    print("Lsp restarted!")
end, { noremap = true })

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)


require("mason").setup {
    log_level = vim.log.levels.DEBUG
}
