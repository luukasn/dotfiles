return {
    "robitx/gp.nvim",
    config = function()
        local custom_prompts = {
            code_assistant = "You are an AI assistant for a programmer\n\n"
                .. "Your main purpose is to help with programming topics and coding, follow these guides:\n\n"
                .. "- Always format code blocks using markdown syntax for code blocks\n"
                .. "- When the user is asking for code generation, briefly explain what the code does\n"
                .. "- When generating code for the user, add brief comments to the code explaining the code\n"
                .. "- If you need more clarification on some parts, ask the user.\n"
        }

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
                    system_prompt = custom_prompts.code_assistant,
                }
            },
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}
