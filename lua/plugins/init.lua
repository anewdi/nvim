return {
    { 'norcalli/nvim-colorizer.lua' },
    --Undotree
    {"mbbill/undotree"},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
}
