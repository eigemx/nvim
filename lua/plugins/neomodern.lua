return {
	"cdmill/neomodern.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			-- Can be one of: 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
			theme = "roseprime",
			variant = "dark",
		})
		require("neomodern").load()
	end,
}
