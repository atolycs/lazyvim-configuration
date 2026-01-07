return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "tree-sitter-cli",
        "typescript-language-server",
      })
    end,
  },
}
