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
        'ray-x/go.nvim', -- Go setup
        'leafgarland/typescript-vim', -- TypeScript support
        'leafOfTree/vim-svelte-plugin', -- Svelte syntax highlighting
        'jose-elias-alvarez/null-ls.nvim', -- Formatting and linting
        'nvim-lua/plenary.nvim', -- Dependency for Telescope and other plugins
    },
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }, -- Color scheme
    'windwp/nvim-autopairs', -- Autopairs for brackets
     {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },
})

-- Set the leader key to space
vim.g.mapleader = ' '

vim.opt.clipboard = "unnamedplus"

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set tab to 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- LSP configuration
local lspconfig = require('lspconfig')

-- Rust
lspconfig.rust_analyzer.setup{}

-- Golang
require("go").setup({
    lsp_cfg = true, -- Use LSP configuration from go.nvim
})

-- JavaScript/TypeScript
lspconfig.tsserver.setup{}

-- Svelte
lspconfig.svelte.setup{}

-- Null-LS for formatting
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "svelte", "html", "css", "json" },
        }),
        null_ls.builtins.diagnostics.eslint.with({
            filetypes = { "javascript", "typescript", "svelte" },
        }),
    },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

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
    ensure_installed = { 'rust', 'go', 'typescript', 'svelte', 'javascript', 'html', 'css' },
    highlight = {
        enable = true,
    },
})

-- Fuzzy Finder configuration
require('telescope').setup{}

-- Set Moonfly as the color scheme
vim.cmd [[colorscheme moonfly]]

-- Autopairs configuration
require('nvim-autopairs').setup{}

-- Example key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })

