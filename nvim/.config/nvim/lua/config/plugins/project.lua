local M = {
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

return M
