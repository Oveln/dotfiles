local M = {
    "nvim-telescope/telescope.nvim",
    --tag = '0.1.5',
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "LukasPietzschmann/telescope-tabs",
            config = function()
                local tstabs = require("telescope-tabs")
                tstabs.setup({})
                -- vim.keymap.set('n', '<C-t>', tstabs.list_tabs, {})
            end,
        },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
}
M.config = function()
    -- 设置键位
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")
    keymap.set("n", "<leader>ff", builtin.find_files, {})
    keymap.set("n", "<leader>fg", builtin.live_grep, {})
    keymap.set("n", "<leader>fb", builtin.buffers, {})
    keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

return M
