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
                    name = "ChatGPT-3.5-turbo",
                    chat = true,
                    command = true,
                    model = { model = "gpt-3.5-turbo" },
                    system_prompt = custom_prompts.code_assistant,
                }
            },
            hooks = {
                -- example of adding command which writes unit tests for the selected code
                UnitTests = function(gp, params)
                    local template = "I have the following code from {{filename}}:\n\n"
                        .. "```{{filetype}}\n{{selection}}\n```\n\n"
                        .. "Please respond by writing unit test for the code above."
                    local agent = gp.get_command_agent()
                    gp.Prompt(params, gp.Target.vnew, agent, template)
                end,

                -- Ask AI to generate a comment of a function
                GenComment = function(gp, params)
                    local template = "I have the following code from {{filename}}:\n\n"
                        .. "```{{filetype}}\n{{selection}}\n```\n\n"
                        .. "Please respond by writing a comment in {{filetype}} explaining the code.\n"
                        ..
                        "If a function is present, provide the function parameters and their types and the function return type in the comment.\n"
                        ..
                        "If possible, do not return any other than the comment itself, so the end user can paste the generated comment on top of the code"
                    local n_template = [[
                        You are a highly advanced AI model specialized in understanding and explaining programming concepts. Your task is to generate a detailed, concise, and
                        helpful comment that explains the purpose and functionality of the provided code block.

                        ### Input:
                        You will be provided with the following information:
                        - **Filetype**: {{filetype}} (e.g., Python, JavaScript, etc.)
                        - **Filename**: {{filename}}
                        - **Selected Code Block**: {{selection}}

                        ### Requirements:
                        1. Analyze the provided function to understand its purpose and structure.
                        2. Generate a concise comment that:
                           - Quickly explains **what the function does**.
                           - Includes the **parameter types** and the **return value type**.
                        3. The comment should not include explanations of individual lines within the function.
                        4. Use the appropriate commenting syntax for the provided **filetype** (e.g., `#` for Python, `//` for JavaScript).
                        5. Favour multiline commenting
                        6. The output should only include the generated comment block, without repeating the function itself.

                        ### Example Format:

                        **Code Block:**
                        ```javascript
                        function add_numbers(a, b) {
                            return a + b;
                        }
                        ```
                        Generated comment:
                        /*
                        * This function adds two numbers and returns the result.
                        * Parameters:
                        * @param {number} a - The first number to be added
                        * @param {number} b - The second number to be added
                        * @return {number} Sum of a and b
                        */

                        Additional notes:
                        - If a function or code structure appears unclear, default to high-level descriptions based on common use cases for similar code.
                    ]]
                    local agent = gp.get_command_agent()
                    gp.Prompt(params, gp.Target.vnew, agent, n_template)
                end,
            }
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
        vim.keymap.set("n", "<leader>an", ":GpChatNew vsplit<CR>", {})
        vim.keymap.set("n", "<leader>al", ":GpChatFinder<CR>", {})
        vim.keymap.set("v", "<leader>at", ":GpUnitTests<CR>", {})  -- at = Ai Test
        vim.keymap.set("v", "<leader>ac", ":GpGenComment<CR>", {}) -- ac = Ai Comment
    end,
}
