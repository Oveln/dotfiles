local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
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
        -- { "VonHeikemen/lsp-zero.nvim" },
        { "L3MON4D3/LuaSnip" },
        -- {'saadparwaiz1/cmp_luasnip'}
    },
}

M.config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup()
    -- local cmp_action = require("lsp-zero").cmp_action()
    -- cmp_action.tab_complete()
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            -- Select the [n]ext item
            ["<Down>"] = cmp.mapping.select_next_item(),
            -- Select the [p]revious item
            ["<Up>"] = cmp.mapping.select_prev_item(),

            -- Accept ([y]es) the completion.
            --  This will auto-import if your LSP supports it.
            --  This will expand snippets if the LSP sent a snippet.
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            ["<Enter>"] = cmp.mapping.confirm({ select = true }),

            -- Manually trigger a completion from nvim-cmp.
            --  Generally you don't need this, because nvim-cmp will display
            --  completions whenever it has completion options available.
            ["<C-Space>"] = cmp.mapping.complete({}),

            -- Think of <c-l> as moving to the right of your snippet expansion.
            --  So if you have a snippet that's like:
            --  function $name($args)
            --    $body
            --  end
            --
            -- <c-l> will move you to the right of each of the expansion locations.
            -- <c-h> is similar, except moving you backwards.
            ["<C-l>"] = cmp.mapping(function()
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { "i", "s" }),
            ["<C-h>"] = cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { "i", "s" }),
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
