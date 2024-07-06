return {
	"andweeb/presence.nvim",
	config = function ()
		require("presence").setup({
			auto_update = true,
			neovim_image_text = "writing spaghetti",
			editing_text = "on file %s",
		})
	end,
}
