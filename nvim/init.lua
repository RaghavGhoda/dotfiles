-- init.lua

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/lazy.nvim')

require('lazy').setup({
    -- LSP plugins
    {
        'neovim/nvim-lspconfig', -- LSP configurations
        'hrsh7th/nvim-cmp', -- Autocompletion
        'hrsh7th/cmp-nvim-lsp', -- LSP completion source
        'nvim-treesitter/nvim-treesitter', -- Treesitter for syntax highlighting
        'rust-lang/rust.vim', -- Rust syntax highlighting
	'ray-x/go.nvim',
        'leafgarland/typescript-vim', -- TypeScript support
    },
    -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    -- Rosepine theme
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    -- Autopairs plugin
    'windwp/nvim-autopairs',
})

-- Set the leader key to space
vim.g.mapleader = ' '

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- LSP configuration
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup{}
lspconfig.gopls.setup{}
lspconfig.tsserver.setup{}

-- Autocompletion configuration
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})


-- Treesitter configuration
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'rust', 'go', 'typescript' },
    highlight = {
        enable = true,
    },
})

-- Fuzzy Finder configuration
require('telescope').setup{}

-- Set Rosepine as the color scheme
vim.cmd [[colorscheme moonfly]]


-- Autopairs configuration
require('nvim-autopairs').setup{}

-- Example key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })


config = function()
    require("go").setup()
  end
