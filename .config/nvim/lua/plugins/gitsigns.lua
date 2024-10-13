return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            current_line_blame_opts = {
                delay = 500
            },
            current_line_blame_formatter = ' <author>, <author_time:%R>: "<summary>"',
        }

        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
        vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
}
