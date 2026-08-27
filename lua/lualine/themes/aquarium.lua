-- Override for the lualine theme shipped with aquarium-vim.
-- Upstream (lua/lualine/themes/aquarium.lua in that plugin) passes
-- `bold,` -- bold with a trailing comma -- as gui. lualine appends
-- ",nocombine" to it and :highlight rejects "bold,,nocombine" (E418).
-- lualine's theme loader prefers non-lualine-repo files on rtp,
-- so this config copy wins over the broken one.
local colors = vim.fn['aquarium#colors#definitions']()
if type(colors.bold) == 'string' then
	colors.bold = (colors.bold:gsub(',$', ''))
end
return {
	normal = {
		a = { bg = colors.gui0F, fg = colors.gui03, gui = colors.bold },
		b = { bg = colors.gui01, fg = colors.gui04 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
	insert = {
		a = { bg = colors.gui0B, fg = colors.gui03, gui = colors.bold },
		b = { bg = colors.gui0C, fg = colors.gui03 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
	visual = {
		a = { bg = colors.gui06, fg = colors.gui04, gui = colors.bold },
		b = { bg = colors.gui05, fg = colors.gui03 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
	replace = {
		a = { bg = colors.gui0E, fg = colors.gui03, gui = colors.bold },
		b = { bg = colors.gui06, fg = colors.gui04 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
	command = {
		a = { bg = colors.gui0E, fg = colors.gui03, gui = colors.bold },
		b = { bg = colors.gui0D, fg = colors.gui03 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
	inactive = {
		a = { bg = colors.gui03, fg = colors.gui04, gui = colors.bold },
		b = { bg = colors.gui03, fg = colors.gui04 },
		c = { bg = colors.gui03, fg = colors.gui04 },
	},
}
