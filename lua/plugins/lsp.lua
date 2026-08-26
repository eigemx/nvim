return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()

			local registry = require("mason-registry")
			for _, tool in ipairs({ "ruff", "prettierd", "markdownlint-cli2", "stylua" }) do
				local ok, pkg = pcall(registry.get_package, tool)
				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright" },
				automatic_enable = { exclude = { "stylua" } },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable({ "lua_ls", "clangd", "pyright" })

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function()
					local map = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { desc = "LSP: " .. desc })
					end
					map("<leader>r", vim.lsp.buf.rename, "[R]ename")
					map("K", vim.lsp.buf.hover, "Hover docs")
					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				end,
			})
		end,
	},
}
