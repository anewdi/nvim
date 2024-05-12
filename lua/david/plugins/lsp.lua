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
        --Lsp zero stuff
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        lsp_zero.set_server_config({
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        })


        --Loading of language servers
        --Use this on normal distro
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                --'tsserver',
                --'eslint',
                --'lua_ls',
                --'rust_analyzer',
                --'svelte',
                --'pylsp',
                --'clangd',
                --'bashls',
                --'quick_lint_js',
            },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        --Use this duct tape solution for nix type devflow(add lsp in shell.nix)
        local servers = {
            'tsserver',
            'eslint',
            'lua_ls',
            'nixd',
            'rust_analyzer',
            'svelte',
            'pylsp',
            'clangd',
            'bashls',
            'quick_lint_js',
        }
        for i,server in pairs(servers)
        do
            lsp_zero.default_setup(server)
        end


        --Completion setup
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

        local signs = { Error = "x", Warn = "x", Hint = "!", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = '', linehl = '', texthl = hl, numhl = hl })
        end

    end
}
