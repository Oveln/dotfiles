local M = {
    "windwp/nvim-autopairs",
    dependices = {
        {
            "hrsh7th/nvim-cmp",
        },
    },
    event = "InsertEnter",
}

M.config = function()
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

return M
