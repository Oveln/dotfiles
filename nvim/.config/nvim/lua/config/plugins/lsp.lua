local M = {
    -- event = "VeryLazy",
    lazy = false,
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "nvimdev/lspsaga.nvim",
            config = function()
                require("lspsaga").setup({
                    outline = {
                        -- layout = "float",
                    },
                })
            end,
            dependencies = {
                "nvim-treesitter/nvim-treesitter", -- optional
                "nvim-tree/nvim-web-devicons", -- optional
            },
        },
        { "williamboman/mason-lspconfig.nvim" },
        { "williamboman/mason.nvim" },
    },
}
M.config = function()
    -- lsp_zero.on_attach(function(client, bufnr)
    --     if client.name == "copilot" then
    --         return
    --     end
    --     -- see :help lsp-zero-keybindings
    --     -- to learn the available actions
    --     lsp_zero.default_keymaps({ buffer = bufnr })
    --     local keymap = vim.keymap
    --     local keymap_opts = { noremap = true, silent = true, buffer = bufnr }
    --     keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", keymap_opts)
    --     keymap.set("n", "go", ":Lspsaga peek_type_definition<CR>", keymap_opts)
    --     -- map.set("n", "<leader>gd", ":Lspsaga goto_definition<CR>", map_opts)
    --     -- map.set("n", "<leader>gt", ":Lspsaga goto_type_definition<CR>", map_opts)
    --     if client.name == "rust-analyzer" then
    --         print("Rust LSP attached to buffer %d", bufnr)
    --         keymap.set("n", "?", ":RustLsp renderDiagnostic<CR>", keymap_opts)
    --         keymap.set("n", "ga", ":RustLsp codeAction<CR>", keymap_opts)
    --     else
    --         print("Other LSP attached to buffer %d", bufnr)
    --         keymap.set("n", "ga", ":Lspsaga code_action<CR>", keymap_opts)
    --         keymap.set("n", "?", ":Lspsaga show_line_diagnostics<CR>", keymap_opts)
    --     end
    --     keymap.set("n", "K", ":Lspsaga hover_doc<CR>", keymap_opts)
    --     keymap.set("n", "gi", ":Lspsaga finder imp<CR>", keymap_opts)
    --     keymap.set("n", "gf", ":Lspsaga finder<CR>", keymap_opts)
    --     keymap.set("n", "gr", ":Lspsaga rename<CR>", keymap_opts)
    --     keymap.set("n", "gO", ":Lspsaga outline<CR>", keymap_opts)
    --     vim.diagnostic.config({
    --         severity_sort = true,
    --         underline = true,
    --         signs = true,
    --         virtual_text = {
    --             severity = vim.diagnostic.severity.E,
    --         },
    --         update_in_insert = true,
    --         float = true,
    --     })
    --     -- 类型推断
    --     vim.lsp.inlay_hint.enable()
    -- end)

    -- lsp_zero.set_sign_icons({
    --     error = "✘",
    --     warn = "▲",
    --     hint = "⚑",
    --     info = "»",
    -- })

    vim.opt.signcolumn = "yes"
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            -- 类型推断
            vim.lsp.inlay_hint.enable()
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
            end

            -- Jump to the definition of the word under your cursor.
            --  This is where a variable was first declared, or where a function is defined, etc.
            --  To jump back, press <C-T>.
            -- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            map("gd", ":Lspsaga peek_definition<CR>", "[G]oto [D]efinition")
            map("gD", ":Lspsaga goto_definition<CR>", "[G]oto [D]efinition")

            -- Find references for the word under your cursor.
            map("gr", ":Lspsaga ", "[G]oto [R]eferences")

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

            -- Fuzzy find all the symbols in your current workspace
            --  Similar to document symbols, except searches over your whole project.
            map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            -- Rename the variable under your cursor
            --  Most Language Servers support renaming across files, etc.
            map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map("<leader>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")
            map("<leader>?", ":Lspsaga show_line_diagnostics<CR>", "?")

            -- Opens a popup that displays documentation about the word under your cursor
            --  See `:help K` for why this keymap
            map("K", ":Lspsaga hover_doc", "Hover Documentation")

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
            vim.diagnostic.config({
                severity_sort = true,
                underline = true,
                signs = true,
                virtual_text = {
                    severity = vim.diagnostic.severity.E,
                },
                update_in_insert = true,
                float = true,
            })
        end,
    })
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
            -- cmd = {...},
            -- filetypes { ...},
            -- capabilities = {},
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = {
                        checkThirdParty = false,
                        -- Tells lua_ls where to find all the Lua files that you have loaded
                        -- for your neovim configuration.
                        library = {
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                        },
                        -- If lua_ls is really slow on your computer, you can try this instead:
                        -- library = { vim.env.VIMRUNTIME },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                    -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                    -- diagnostics = { disable = { 'missing-fields' } },
                },
            },
        },
    }
    require("mason").setup({})

    local ensure_installed_list = {
        "eslint",
        "rust_analyzer",
        "lua_ls",
        "volar",
        "clangd",
    }

    require("mason-lspconfig").setup({
        ensure_installed = ensure_installed_list,
        handlers = {
            rust_analyzer = function() end,
            function(server_name)
                local server = servers[server_name] or {}
                require("lspconfig")[server_name].setup(server)
            end,
        },
    })
end

return M
