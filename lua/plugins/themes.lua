-- All themes below are installed and eagerly loaded so every name
-- shows up in `:colorscheme <Tab>` and in the Telescope picker (<leader>th).
-- Switching at runtime does not persist; the startup theme is whatever
-- `lua/colorscheme.lua` sets (managed by theme-switch for its 3 bundled themes).
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "sho-87/kanagawa-paper.nvim", lazy = false },
	{ "luisiacc/gruvbox-baby", branch = "main", lazy = false },
	{ "projekt0n/github-nvim-theme", name = "github-theme", lazy = false },
	{ "slugbyte/lackluster.nvim", lazy = false },
	{ "wtfox/jellybeans.nvim", lazy = false },
	-- lualine integration fixed by our override file lua/lualine/themes/aquarium.lua
	{ "frenzyexists/aquarium-vim", branch = "develop", lazy = false },
	{ "cdmill/neomodern.nvim", lazy = false },
	{ "NTBBloodbath/doom-one.nvim", lazy = false },
	{ "yorickpeterse/vim-paper", lazy = false },
	{ "ilof2/posterpole.nvim", lazy = false },
	{ "tiagovla/tokyodark.nvim", lazy = false },
	{ "vague-theme/vague.nvim", lazy = false },
	{ "scottmckendry/cyberdream.nvim", lazy = false },
}
