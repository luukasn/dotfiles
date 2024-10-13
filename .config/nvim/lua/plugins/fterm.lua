return {
    "numToStr/FTerm.nvim",
    lazy = true,
    config = function()
        local fterm = require("FTerm")

        fterm.setup({
            border = "single",
            dimensions = {
                height = 0.9,
                width = 0.9
            }
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
