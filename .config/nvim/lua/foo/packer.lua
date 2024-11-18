
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use 'chaoren/vim-wordmotion' -- faz com que os comandos w,e & b sejam case sensitve
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- wildmenu readline shortcuts
    use 'tpope/vim-rsi'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- treesitter
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use 'vrischmann/tree-sitter-templ'
    -- colorscheme
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    -- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
    -- display de erros de sintaxe
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- explorador de arquivos
    use {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
        requires = 'nvim-tree/nvim-web-devicons',
    }
    -- colorscheme
    use 'marko-cerovac/material.nvim'
    -- barra de status
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- wildmenu melhorado
    use {
        'gelguy/wilder.nvim',
        config = function()
            -- config goes here
        end,
    }
    -- mostra barra na lateral após N colunas
    use "m4xshen/smartcolumn.nvim"
    -- use "~/desktop/prog/lua/autocomplete.nvim"
    use "kovisoft/slimv"
end)
