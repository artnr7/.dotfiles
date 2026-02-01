return {
	"mason-org/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason and mason_lspconfig
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "⚡",
					package_pending = "➜",
					-- package_uninstalled = "☹",
					-- package_uninstalled = "💀",
					package_uninstalled = "🗿",
				},
			},
		})

		-- LSP servers
		mason_lspconfig.setup({
			auto_enable = true,
			auto_install = true,
			ensure_installed = {
				"stylua",
				-- "clangd",
				-- "marksman",
				"gopls",
				-- "pyright", -- python
			},
		})

		-- Other tools
		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"goimports", -- go
				"gofumpt", -- go
				"golines", -- go
				------------------------
				"shfmt", -- shell files
				"clang-format", -- C/C++
				"black", -- python
				"sqlfmt", -- sql
				"prettierd", -- html
				"prettier", -- html
				-- Linters -------------------------
				"golangci-lint",
				-- "luacheck",
				-- "cpplint",
				-- "ruff", -- python
				-- "vale",
			},
			-- automatically install / update on startup. If set to false nothing
			-- will happen on startup. You can use :MasonToolsInstall or
			-- :MasonToolsUpdate to install tools and check for updates.
			auto_enable = true,
			auto_install = true,

			-- Default: true
			run_on_start = true,

			-- set a delay (in ms) before the installation starts. This is only
			-- effective if run_on_start is set to true.
			-- Default: 0
			start_delay = 3000, -- 3 second delay

			-- Only attempt to install if 'debounce_hours' number of hours has
			-- elapsed since the last time Neovim was started. This stores a
			-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
			-- This is only relevant when you are using 'run_on_start'. It has no
			-- effect when running manually via ':MasonToolsInstall' etc....
			-- Default: nil
			debounce_hours = nil, -- at least 5 hours between attempts to install/update
		})
	end,
}
