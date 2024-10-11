-- This plugin gives you a pretty bottom line to your editor

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Function to return all the attached lsps
        -- in a string
        local function attached_lsp()
            local attached_lsps = vim.lsp.buf_get_clients()

            local lsp_string = [[]]

            -- Check if the list is empty, if it is then no
            -- lsp servers are attached to the buffer.
            if attached_lsps[1] == nil then
                return lsp_string .. "none"
            end

            -- Loop over the attached clients and
            -- add the names to the lsp_string
            for i, value in ipairs(attached_lsps) do
                if value.name ~= nil then
                    if i == 1 then
                        lsp_string = lsp_string .. value.name
                    else
                        lsp_string = lsp_string .. ", " .. value.name
                    end
                end
            end

            return lsp_string
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                section_separators = "",
                component_separators = "|",
            },
            sections = {
                lualine_a = { { 'mode', icon = { '' } } },
                lualine_x = { { attached_lsp, icon = { '󰒍', color = { fg = '#64B5F6' } } }, 'filetype' }
            }
        })
    end,
}
