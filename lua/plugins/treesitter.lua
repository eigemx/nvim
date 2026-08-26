return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local parsers =
			{ "c", "cpp", "python", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "html" }
		-- Only fetch parsers that are missing, and only when the tree-sitter
		-- CLI is available (required by the new main-branch build pipeline).
		local installed = require("nvim-treesitter").get_installed()
		local missing = vim.tbl_filter(function(p)
			return not vim.list_contains(installed, p)
		end, parsers)
		if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
			require("nvim-treesitter").install(missing)
		end

		-- One-time local build of the community OpenFOAM grammar
		-- (no longer in upstream registry). Requires cc + git.
		local function ensure_foam()
			local data = vim.fn.stdpath("data")
			local so = data .. "/site/parser/foam.so"
			if vim.uv.fs_stat(so) or vim.fn.executable("cc") == 0 then
				return
			end
			local repo = vim.fn.stdpath("cache") .. "/tree-sitter-foam"
			if not vim.uv.fs_stat(repo) then
				vim.system({ "git", "clone", "--depth=1",
					"https://github.com/FoamScience/tree-sitter-foam", repo }):wait()
			end
			if not vim.uv.fs_stat(repo .. "/src/parser.c") then
				return
			end
			vim.fn.mkdir(data .. "/site/parser", "p")
			vim.fn.mkdir(data .. "/site/queries/foam", "p")
			local out = vim
				.system({ "cc", "-O2", "-fPIC", "-I", "src", "-shared",
					"src/parser.c", "src/scanner.c", "-o", so },
					{ cwd = repo })
				:wait()
			if out.code ~= 0 then
				return
			end
			for _, q in ipairs(vim.fn.glob(repo .. "/queries/highlights.scm", false, true)) do
				vim.uv.fs_copyfile(q, data .. "/site/queries/foam/highlights.scm")
			end
		end
		pcall(ensure_foam)

		-- Detect extensionless OpenFOAM case files (Vim regex patterns)
		vim.filetype.add({
			pattern = {
				["\\w*Dict$"] = "openfoam",
				["\\w*Properties$"] = "openfoam",
				["fv\\S+$"] = "openfoam",
			},
		})
		if vim.uv.fs_stat(vim.fn.stdpath("data") .. "/site/parser/foam.so") then
			vim.treesitter.language.register("foam", "openfoam")
			table.insert(parsers, "openfoam")
		end

		local group = vim.api.nvim_create_augroup("ts-start", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = parsers,
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
