local M = {}

function M.isWin()
  local mySysname = vim.loop.os_uname().sysname

  return mySysname:find("Windows") and true or false
end

function M.isDarwin()
  local mySysname = vim.loop.os_uname().sysname
  return mySysname == "Darwin"
end

function M.isLinux()
  local mySysname = vim.loop.os_uname().sysname
  return mySysname == "Linux"
end

function M.which(exe)
  return vim.fn.executable(exe) == 1
end

return M
