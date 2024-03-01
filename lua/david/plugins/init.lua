return {
    { 'norcalli/nvim-colorizer.lua' },
    --Undotree
    { "mbbill/undotree" },
    --Git integration/wrapper
    { 'tpope/vim-fugitive' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl", opts = {}
    },
}
