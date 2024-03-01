return {
    --Lsp Zero
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        --LSP support
        --Autocomp
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        --Lsp servers from neovim management
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver',
                'eslint',
                'lua_ls',
                'rust_analyzer',
                'svelte',
                'pylsp',
                'clangd',
                'bashls',
                'quick_lint_js',
                'csharp_ls',
            },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
            })
        })

        vim.diagnostic.config({
            virtual_text = false,
            underline = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local signs = { Error = "x", Warn = "x", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = '',linehl = '', texthl = hl, numhl = hl })
        end

    end
}
