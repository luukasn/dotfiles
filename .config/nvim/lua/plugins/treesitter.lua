-- This is a parser plugin, it will parse the current file you're editing
-- and offer some functionality such as better syntax highlighting

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "javascript", "typescript", "c", "rust"},
			highlight = { enable = true },
			indent = { enable = true }
		})
	end,
}
