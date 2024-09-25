return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
            -- auto_install is magic, it installed OpenFOAM and tmux tree sitters just by opening the files! :)
			auto_install = true,
			ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
