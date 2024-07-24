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

        --Apply default keybinds
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            --autoformat, only works properly when only one active lsp(for buffer)
            --lsp_zero.buffer_autoformat()
        end)

        --Remove lsp highlighting
        lsp_zero.set_server_config({
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        })

        --Format on save
        --lsp_zero.format_on_save({
        --    format_opts = {
        --        async = false,
        --        timeout_ms = 10000,
        --    }
        --})


        local servers = {
            clangd = {},
            cssls = {},
            bashls = {},
            lua_ls = {},
            nil_ls = {},
        }

        if vim.fn.exepath('nix') ~= "" then
            servers.nixd = {}
            --NIX solution(add in nix shell or syspkgs)
            for server,i in pairs(servers) do
                if vim.fn.exepath(server) ~= "" then 
                    lsp_zero.default_setup(server)
                end
            end
        else
            --Standard
            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                },
                ensure_installed = vim.tbl_keys(servers),
            })
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

        --Diagnostic setup
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

        --Remove signs and only highlight number and text
        local signs = { Error = "x", Warn = "x", Hint = "!", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = '', linehl = '', texthl = hl, numhl = hl })
        end
    end
}
