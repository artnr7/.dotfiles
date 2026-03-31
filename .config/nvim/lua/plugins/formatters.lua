-- :ConformInfo
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang_format", lsp_format = "fallback" },
        cpp = { "clang_format", lsp_format = "fallback" },
        cc = { "clang_format", lsp_format = "fallback" },
        h = { "clang_format", lsp_format = "fallback" },
        cmake = { "cmake_format" },
        make = { "cmake-format", "mbake", "checkmake", stop_after_first = true },
        bash = { "shfmt" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- python = { "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofumpt", "golines", lsp_format = "fallback" },
        nginx = { "nginxfmt" },
        -- sql = { "pgformatter", lsp_format = "fallback" },
        -- sql = { "sqlfmt" },
      },
      formatters = {
        stylua = {
          prepend_args = {
            "--column-width",
            "80",
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
        clang_format = {
          prepend_args = { "--style=file", "--fallback-style=Google" }, -- "--style=file"
          stdin = true, -- Обязательно для комментариев!
          -- prepend_args = function(self, ctx)
          --   return { "--style=file:" .. vim.fs.dirname(ctx.dirname) .. "/.clang-format" }
          -- end,
        },

        shfmt = {
          prepend_args = { "-i", "4" },
        },
        -- pgformatter = {
        --   prepend_args = {
        --     "--keyword-case=3", -- UPPERCASE ключевые слова
        --     "--line-number", -- номера строк
        --     "--spaces", -- пробелы вокруг операторов
        --     "$FILE",
        --   },
        --   stdin_buffer = false, -- pgformatter не читает stdin
        -- },
      },
    })
    -- vim.api.nvim_create_autocmd("BufWritePre", { -- Autoformat before write
    --   pattern = "c, cpp, bash, lua",
    --   callback = function(args)
    --     require("conform").format({ bufnr = args.buf })
    --   end,
    -- })

    -- vim.keymap.set("n", "<C-s>", function()
    --   require("conform").format({ lsp_format = "fallback" })
    -- end, { noremap = false, silent = false, desc = "Format on manual save" })

    -- require("conform").setup({
    --   format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 5000,
    --     lsp_format = "fallback",
    --   },
    -- })
  end,
}
