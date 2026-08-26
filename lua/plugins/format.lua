return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			cpp = { "clang_format" },
			c = { "clang_format" },
			python = { "ruff_organize_imports", "ruff_format" },
			markdown = { "prettierd" },
			lua = { "stylua" },
		},
		format_on_save = false,
	},
}
