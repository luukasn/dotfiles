--[[
	CUSTOM LUA KEYMAPS CAN BE FOUND HERE.
--]]

-- Set custom keymap bindings
-- Open this config directory
vim.keymap.set("n", "<leader>config", ":edit /home/luukas/.config/nvim/init.lua | :cd ~/.config/nvim<CR>", {})
-- Open a file finder in telescope
-- ff: File Finder
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
-- Open a live grep on telescope
-- lg: Live Grep
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")
-- Open a (horizontal) terminal in a new buffer
vim.keymap.set("n", "<leader>term", ":split | :terminal<CR>")
-- Open a (vertical) terminal in a new buffer
vim.keymap.set("n", "<leader>vsh", ":vsplit | :terminal<CR>")
-- Save all changed files and then open a shell in a new buffer
vim.keymap.set("n", "<leader>wt", ":wa | :split | :terminal<CR>")
-- Open a neovim cheatsheet
vim.keymap.set("n", "<leader>csh", ":Cheatsheet<CR>")
-- Open the ChatGPT window
vim.keymap.set("n", "<leader>gpt", ":ChatGPT<CR>")
-- Open the todos menu
vim.keymap.set("n", "<leader>todo", ":TodoTelescope<CR>")
-- Go to the end of the current line:
-- vim.keymap.set("n", "<leader>el", "$");
-- Go to the beginning of the line
-- vim.keymap.set("n", "<leader>bl", "0");
-- Toggle comment on the selected code block:
vim.keymap.set("n", "<leader>pw", ":MarkdownPreviewToggle<CR>")

-- Map Ctrl+c as esc
vim.keymap.set("i", "<C-c>", "<Esc>")

--
-- Custom functionality
--

-- Replace word under cursor with the word returned from the prompt
vim.keymap.set("n", "<leader>raw", function()
    local word_under_cursor = vim.fn.expand("<cword>")
    local to_replace_with = vim.fn.input(string.format("Replace word '%s' with (q to cancel): ", word_under_cursor))

    if to_replace_with == "q" then
        vim.print("Operation cancelled...")
    else
        vim.cmd("%s/" .. string.format("%s/%s", word_under_cursor, to_replace_with))
        vim.print(
            string.format("All occurances of string '%s' has been changed to '%s'", word_under_cursor, to_replace_with)
        )
    end
end)

-- Format the current buffer (if a valid formatter is attached to the buffer
vim.keymap.set("n", "<leader>gf", function()
    require("conform").format({
        lsp_fallback = true,
        timeout_ms = 500,
        async = false,
    })
end)

-- Map the keys for moving in between the luasnip inputs
-- Move forward
local luasnip = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

-- Move backwards
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })
