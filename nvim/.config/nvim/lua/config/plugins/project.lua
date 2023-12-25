local rooter = {
    "airblade/vim-rooter",
    lazy = false,
    init = function()
        vim.g.rooter_patterns = { "__vim_project_root", ".git/", "Makefile", "Cargo.toml" }
        vim.g.rooter_silent_chdir = true

        -- vim.api.nvim_create_autocmd("VimEnter", {
        --     pattern = "*",
        --     callback = function()
        --         vim.cmd([[silent! source .vim.lua]])
        --     end,
        -- })
    end,
}

local lazygit = {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

lazygit.config = function()
    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
end

local M = {
    rooter,
    lazygit,
}

return M
