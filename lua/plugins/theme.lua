return {
    --'catppuccin/nvim',
    --name = 'catppuccin',
    --priority = 1000,
    --config = function()
    --    require("catppuccin").setup({
    --       no_italic = true,
    --    })
    --    vim.cmd.colorscheme "catppuccin"
    --end,
    'sainnhe/everforest',
    name = 'everforest',
    priority = 1000,
    config = function()
        vim.g.everforest_background = 'medium'
        vim.cmd.colorscheme "everforest"
    end,
}
