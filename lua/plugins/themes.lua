-- To switch themes: change ACTIVE_THEME here and the `colorscheme`
-- line in init.lua. Disabled themes are not installed by lazy.nvim.
local ACTIVE_THEME = "rose-pine"

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = ACTIVE_THEME == "rose-pine",
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
	{ "catppuccin/nvim", name = "catppuccin", enabled = ACTIVE_THEME == "catppuccin" },
	{ "rebelot/kanagawa.nvim", enabled = ACTIVE_THEME == "kanagawa" },
	{ "sho-87/kanagawa-paper.nvim", enabled = ACTIVE_THEME == "kanagawa-paper" },
	{ "luisiacc/gruvbox-baby", branch = "main", enabled = ACTIVE_THEME == "gruvbox-baby" },
	{ "projekt0n/github-nvim-theme", name = "github-theme", enabled = ACTIVE_THEME == "github" },
	{ "slugbyte/lackluster.nvim", enabled = ACTIVE_THEME == "lackluster" },
	{ "wtfox/jellybeans.nvim", enabled = ACTIVE_THEME == "jellybeans" },
	{ "frenzyexists/aquarium-vim", enabled = ACTIVE_THEME == "aquarium" },
	{ "cdmill/neomodern.nvim", enabled = ACTIVE_THEME == "neomodern" },
	{ "NTBBloodbath/doom-one.nvim", enabled = ACTIVE_THEME == "doom-one" },
	{ "yorickpeterse/vim-paper", enabled = ACTIVE_THEME == "paper" },
	{ "ilof2/posterpole.nvim", enabled = ACTIVE_THEME == "posterpole" },
	{ "tiagovla/tokyodark.nvim", enabled = ACTIVE_THEME == "tokyodark" },
	{ "vague-theme/vague.nvim", enabled = ACTIVE_THEME == "vague" },
	{ "scottmckendry/cyberdream.nvim", enabled = ACTIVE_THEME == "cyberdream" },
}
