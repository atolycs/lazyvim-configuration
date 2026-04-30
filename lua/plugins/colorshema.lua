return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = (function()
          if
            require("atolycs.util").isDarwin()
            and (vim.env.TERM_PROGRAM == "WezTerm" or vim.env.TERM_PROGRAM == "tmux")
          then
            return true
          else
            return false
          end
        end)(),
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)
      vim.cmd("colorscheme github_dark")
    end,
  },
}
