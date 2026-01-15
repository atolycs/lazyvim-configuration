local v = vim.version()
local version_str = string.format("%d.%d.%d", v.major, v.minor, v.patch)

local logo = [[
          ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
          ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
          ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
          ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
          ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
]]

local max_logo_width = 0

local logo_lines = {}

for line in logo:gmatch("[^\n]+") do
  local w = vim.fn.strdisplaywidth(line)
  max_logo_width = math.max(max_logo_width, w)
  -- table.insert(logo_lines, { text = line })
end

local logo_padding = 5

local header = logo
  .. string.rep(" ", math.max(0, max_logo_width - #("ver " .. version_str)) - logo_padding)
  .. "ver "
  .. version_str

-- for _, l in ipairs(logo_lines) do
--   max_logo_width = math.max(max_logo_width, vim.fn.strdisplaywidth(l.text))
-- end
--
-- table.insert(logo_lines, {
--   text = string.rep(" ", math.max(0, max_logo_width - vim.fn.strdisplaywidth(version_str))) .. version_str,
--   hl = "Comment",
-- })
--
-- vim.notify(logo_lines)

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
          {
            icon = require("atolycs.icons").dash.open,
            key = "C",
            desc = "open [C]urrent Directory",
            action = ":e .",
          },
          { icon = require("atolycs.icons").dash.lazy, key = "l", desc = "[L]azy", action = ":Lazy" },
          { icon = require("atolycs.icons").dash.exit, key = "q", desc = "[Q]uit", action = ":qa" },
        },
        header = header,
      },
    },
  },
}
