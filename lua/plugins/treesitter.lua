return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
			ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
