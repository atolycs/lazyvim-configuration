return {
  -- dashboard snacks
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = require("atolycs.icons").dash.new, key = "n", desc = "[N]ew File", action = ":ene | startinsert" },
          {
            icon = require("atolycs.icons").dash.config,
            key = "c",
            desc = "[C]onfig",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = require("atolycs.icons").dash.lazy, key = "l", desc = "[L]azy", action = ":Lazy" },
          { icon = require("atolycs.icons").dash.exit, key = "q", desc = "[Q]uit", action = ":qa" },
        },
      },
    },
  },
}
