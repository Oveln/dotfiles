local M = {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "zbirenbaum/copilot-cmp",
            dependencies = {
                {
                    "zbirenbaum/copilot.lua",
                    config = function()
                        require("copilot").setup({
                            suggestion = { enabled = false },
                            panel = { enabled = false },
                        })
                    end,
                },
            },
            config = function()
                require("copilot_cmp").setup()
            end,
        },
        { "VonHeikemen/lsp-zero.nvim" },
        { "L3MON4D3/LuaSnip" },
        -- {'saadparwaiz1/cmp_luasnip'}
    },
}

M.config = function()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    cmp_action.tab_complete()
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            -- 'Enter' key to confirm completion
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            -- Ctrl+Space to trigger completion menu
            ["<C-Space>"] = cmp.mapping.complete(),
            -- Navigate between snippet placeholder
            ["<C-f>"] = cmp_action.luasnip_jump_forward(),
            ["<C-b>"] = cmp_action.luasnip_jump_backward(),
            -- Scroll up and down in the completion documentation
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            -- Super Tab
            ["<Tab>"] = cmp_action.luasnip_supertab(),
            ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        }),
        sources = cmp.config.sources(
            -- Copilot Source
            {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
            -- Other Sources
            {
                { name = "path" },
                { name = "luasnip" },
            }
        ),
    })
end

return M
