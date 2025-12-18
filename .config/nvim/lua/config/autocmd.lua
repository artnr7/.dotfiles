vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "CMakeLists.txt", "**.cmake" },
  callback = function()
    vim.defer_fn(function()
      -- CMakeIsReady возвращает 1 если проект готов
      if vim.fn.exists(":CMakeIsReady") == 2 and vim.fn["CMakeIsReady"]() == 1 then
        vim.cmd("silent! CMakeStop")
        vim.cmd("CMakeGenerate")
      end
    end, 100)
  end,
})
