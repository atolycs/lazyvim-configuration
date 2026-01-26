return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "tree-sitter-cli",
        "typescript-language-server",
        "gh-actions-language-server",
        "systemd-lsp",
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      automatic_enable = {
        exclude = {
          "lua_ls",
        },
      },
    },
  },
}
