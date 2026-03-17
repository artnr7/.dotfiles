local M = {}

function M.mapN(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = "Default: " .. desc })
end

return M
