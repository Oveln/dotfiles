-- 显示缩进线
return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                use_treesitter = true,
                style = {
                    { fg = "#806d9c" },
                },
            },
            indent = {
                chars = { "│", "¦", "┆", "┊" },
                use_treesitter = true,
            },
            blank = {
                enable = false,
            },
            line_num = {
                use_treesitter = true,
            },
        })
    end,
}
