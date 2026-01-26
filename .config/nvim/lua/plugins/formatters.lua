-- DONE
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        bash = { "shfmt" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofumpt", "golines", lsp_format = "fallback" },
        -- sql = { "pgformatter", lsp_format = "fallback" },
        sql = { "sqlfmt" },
      },
      formatters = {
        stylua = {
          prepend_args = {
            "--column-width",
            "100",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "AutoPreferDouble",
            "--line-endings",
            "Unix",
          },
        },
        golines = {
          prepend_args = {
            "-m",
            "80",
            "--shorten-comments",
            -- "-t",
            -- "2",
          },
        },
        pgformatter = {
          prepend_args = {
            "--keyword-case=3", -- UPPERCASE ключевые слова
            "--line-number", -- номера строк
            "--spaces", -- пробелы вокруг операторов
            "$FILE",
          },
          stdin_buffer = false, -- pgformatter не читает stdin
        },
      },
    })
    -- vim.api.nvim_create_autocmd("BufWritePre", { -- Autoformat before write
    --   pattern = "c, cpp, bash, lua",
    --   callback = function(args)
    --     require("conform").format({ bufnr = args.buf })
    --   end,
    -- })
    vim.keymap.set("n", "<C-s>", function()
      require("conform").format({ lsp_format = "fallback" })
    end, { desc = "Format on manual save" })
    -- require("conform").setup({
    --   format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 5000,
    --     lsp_format = "fallback",
    --   },
    -- })
  end,
}
