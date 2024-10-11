-- This plugin gives you a pretty bottom line to your editor

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function attached_lsp()
            local lsp = vim.lsp.buf_get_clients()[1]

            if not (lsp == nil) and (lsp.name) then
                return [[a ]] .. lsp.name
            else
                return [[a none]]
            end
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                section_separators = "",
                component_separators = "|",
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return " " .. str end } },
                lualine_x = { attached_lsp, 'filetype' }
            }
        })
    end,
}
