return {
	"mfussenegger/nvim-lint",
	config = function()
		local config = require("lint")

		-- Configure which linters each filetype use
		config.linters_by_ft = {
			javascript = { "eslint_d" },
		}

		vim.keymap.set("n", "<leader>lf", function()
			require("lint").try_lint()
		end)
	end,
}
