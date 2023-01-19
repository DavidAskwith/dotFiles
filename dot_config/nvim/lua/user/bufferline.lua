require("bufferline").setup{
    options = {
        separator_style = 'slant',
        numbeers = 'buffer_id',
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
       diagnostic = 'nvim-lsp'
    }
}
