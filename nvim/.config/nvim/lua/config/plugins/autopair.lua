local autopairs = {
    "windwp/nvim-autopairs",
    dependices = {
        {
            "hrsh7th/nvim-cmp",
        },
    },
    event = "InsertEnter",
}

autopairs.config = function()
    local cmp = require("cmp")
    local autopairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- setup
    autopairs.setup({ {} })

    -- Mapping <CR>
    -- Before        Input         After
    ----------------------------------------
    --{|}           <CR>          {
    --                                |
    --                            }}
    ----------------------------------------
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

local autotag = {
    "windwp/nvim-ts-autotag",
    dependices = {
        "nvim-treesitter/nvim-treesitter",
    },
    event = "InsertEnter",
}

autotag.config = function()
    -- require("nvim-ts-autotag").setup({
    --     filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    -- })
    require("nvim-treesitter.configs").setup({
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
            filetypes = { "html", "xml", "vue" },
        },
    })
end

local M = {
    autopairs,
    autotag,
}

return M
