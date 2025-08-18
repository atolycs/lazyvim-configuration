-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

local function default_opts(opts)
  opts.silent = false
  opts.noremap = true
  return opts
end

local function silent_opts(opts)
  opts.silent = true
  opts.noremap = true
  return opts
end

-- Do things without affecting the registers
keymap.set({ "n", "v" }, "x", '"_x', default_opts({}))
keymap.set({ "n", "v" }, "dd", '"_dd', default_opts({}))

keymap.set({ "n", "v" }, "<Leader>x", "x", default_opts({}))

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', default_opts({}))

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", silent_opts({}))

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", silent_opts({}))
keymap.set("n", "<Leader>O", "O<Esc>^Da", silent_opts({}))

-- Word movement
keymap.set({ "n", "v" }, "<C-l>", "e", silent_opts({}))
keymap.set({ "n", "v" }, "<C-h>", "b", silent_opts({}))

-- Scroll up and down
keymap.set({ "n", "v" }, "<C-j>", "<C-f>", silent_opts({}))
keymap.set({ "n", "v" }, "<C-k>", "<C-b>", silent_opts({}))

-- Hilight off
keymap.set("n", "<esc><esc>", "<cmd>nohl<cr>", silent_opts({}))

-- Window split
keymap.set("n", "ss", "<cmd>split<cr>", silent_opts({}))
keymap.set("n", "sv", "<cmd>vsplit<cr>", silent_opts({}))
-- keymap.set("n", "sv", function()
--   vim.notify("Reload Test")
-- end, silent_opts({}))

if vim.fn.has("nvim-0.12.0") ~= 1 then
  keymap.set("n", "<leader><Enter>", function()
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
  end)
end
