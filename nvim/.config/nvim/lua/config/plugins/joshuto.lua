return {
    "theniceboy/joshuto.nvim",
    event = "VeryLazy",
    config = function()
        -- require("joshuto").setup({})
        vim.keymap.set("n", "<leader>fe", ":Joshuto<CR>", { noremap = true, silent = true })
    end,
}
