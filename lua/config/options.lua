-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.conceallevel = 0

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.g.lazyvim_cmp = "blink.cmp"
vim.g.lazyvim_picker = "telescope"

if util.isWin() then
  if util.which("pwsh") then
    vim.opt.shell = "pwsh"
  else
    vim.opt.shell = "powershell"
  end
end

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end
