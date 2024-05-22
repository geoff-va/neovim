
return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "pyright", "lua_ls", "bashls", "ruff_lsp" },
        },
    },
    {
        "neovim/nvim-lspconfig",
    }
}
