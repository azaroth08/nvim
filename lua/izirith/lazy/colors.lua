function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
        opts = {
            dim_inactive = false,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(hl, c)
                hl.LspDiagnosticsDefaultHint = {fg = c.blue }
                hl.LspDiagnosticsDefaultInformation = {fg = c.blue}
                hl.LspDiagnosticsDefaultWarning = { fg = c.yellow}
                hl.LspDiagnosticsDefaultError = {fg = c.red}
                --remove telescope background
                hl.TelescopeNormal = {bg =  "NONE"}
                hl.TelescopeBorder = {bg  = "NONE"}
                hl.TelescopePromptBorder = { bg = "NONE" }
                hl.TelescopePreviewBorder = { bg = "NONE" }
            end,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "tokyonight",
            }
        }
    },
--    {
--        "kdheepak/tabline.nvim",
--        opts = {
            -- Defaults configuration options
--            enable = true,
--            options = {
                -- If lualine is installed tabline will use separators configured in lualine by default.
                -- These options can be used to override those settings.
--                section_separators = { "", "" },
--                component_separators = { "", "" },
--                max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
--                show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
--                show_devicons = true, -- this shows devicons in buffer section
--                show_bufnr = false, -- this appends [bufnr] to buffer section,
--                show_filename_only = false, -- shows base filename only instead of relative path in filename
--                modified_icon = "+ ", -- change the default modified icon
--                modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
--                show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
--            },
--        },
--    },
}
