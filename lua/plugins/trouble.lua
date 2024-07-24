return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
        open_no_results = true,
        warn_no_results = false,
        auto_preview = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        icons = {
            indent = {
                middle = " ",
                last = " ",
                top = " ",
                ws = "│  ",
            },
        },
        modes = {
            diagnostics = {
                groups = {
                    { "filename", format = "{file_icon} {basename:Title} {count}" },
                },
            },
        },
    },
    keys = {
       {
         "<leader>t",
         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
       },
    },
}
