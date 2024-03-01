return  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup{
            outline = {
                win_position = 'right',
                detail = false,
                auto_preview = false,
            },
        }
    end,
}
