-- DONE
-- Useful https://www.youtube.com/watch?v=y1WWOaLCNyI&t=20s
return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "mason-org/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("lint").linters_by_ft = {
      cpp = { "cpplint" },
      hpp = { "cpplint" },
      cc = { "cpplint" },
      h = { "cpplint" },
      -- markdown = { "vale" },
      lua = { "luacheck" },
      -- go = { "golangci-lint" },
      py = { "ruff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
    -- Для ручного запуска
    vim.keymap.set("n", "<leader>l", function()
      require("lint").try_lint()
    end, { desc = "Trigger linting" })
  end,
}
