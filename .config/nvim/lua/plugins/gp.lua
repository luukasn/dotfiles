return {
    "robitx/gp.nvim",
    config = function()
        local conf = {
            -- For customization, refer to Install > Configuration in the Documentation/Readme
            openai_api_key = os.getenv("OPENAI_API_KEY"),
            providers = {

            },
            agents = {
                {
                    name = "ChatGPT-4",
                    chat = true,
                    command = true,
                    model = { model = "gpt-4" },
                    system_prompt = require("gp.defaults").chat_system_prompt,
                }
            },
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}
