-- DONE
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        -- go = { "goimports" },

        bash = { "shfmt" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
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
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "c, cpp, bash, lua",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
    require("conform").setup({
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
    })
  end,
}
