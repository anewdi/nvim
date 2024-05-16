return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'iceberg_dark',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end},'branch'},
                lualine_b = {'%F','diagnostics'},
                lualine_c = {},
                lualine_x = {'diff'},
                lualine_y = {'encoding', 'filesize'},
                lualine_z = {'location', 'progress'}
            },

            tabline = {
                lualine_a = {{'buffers', mode = 2}},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {}
        }
    end,
}
