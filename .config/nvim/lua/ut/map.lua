local M = {}

M.m = vim.keymap.set

function M.mapN(keys, func, desc)
  -- vim.keymap.set("n", keys, func, { desc = "Default: " .. desc })
  vim.keymap.set("n", keys, func, desc)
end

function M.mapI(keys, func, desc)
  -- vim.keymap.set("i", keys, func, { desc = "Default: " .. desc })
  vim.keymap.set("i", keys, func, desc)
end

return M
