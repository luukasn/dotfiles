vim.cmd("set relativenumber")
vim.cmd("color catppuccin-mocha")
vim.cmd("TransparentEnable")
vim.opt.expandtab = true -- Pressing TAB will insert spaces instead of TAB.
vim.opt.tabstop = 4      -- A TAB character which is 4 spaces
vim.opt.softtabstop = 4  -- Number of spaces inserted when pressing TAB
vim.opt.shiftwidth = 4   -- Number of spaces inserted when indenting a character
vim.opt.cursorline = true

vim.diagnostic.config({
    signs = false
})

-- Function to set the conceallevel to 2 if we're in a markdown file
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- vim.print(vim.bo.filetype)
        if vim.bo.filetype == "markdown" then
            vim.opt.conceallevel = 2
        end
    end
})
