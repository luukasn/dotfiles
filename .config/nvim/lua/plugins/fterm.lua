return {
    "numToStr/FTerm.nvim",
    config = function()
        local fterm = require("FTerm")

        fterm.setup({
            border = "double"
        })

        local lazygit = fterm:new({
            cmd = "lazygit"
        })

        vim.keymap.set("n", "<leader>tt", function()
            fterm.toggle()
        end)

        vim.keymap.set("n", "<leader>gl", function()
            lazygit:toggle()
        end)
    end
}
