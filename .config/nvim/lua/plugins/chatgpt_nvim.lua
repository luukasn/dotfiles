-- This plugins adds ChatGPT support to the editor. (note: you need an API key for this an it costs a little money)
-- NOTE: You need to add your openai API key as an environment variable (OPENAI_API_KEY)

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "",
			popup_layout = {
				default = "right"
			},
			openai_params = {
				model = "gpt-3.5-turbo"
			}
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
