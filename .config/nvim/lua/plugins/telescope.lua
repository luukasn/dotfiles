-- This is a plugin which provides us with fuzzy finding, file finder etc etc...

return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }, -- This is a dependency which just provides API functions for the lua runtime in neovim
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>man", builtin.man_pages, {})
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
