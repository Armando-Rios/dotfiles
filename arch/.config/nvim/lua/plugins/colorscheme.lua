return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            flavour = "mocha",
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            }
        },
        config = function ()
            vim.cmd.colorscheme"catppuccin-mocha"
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000
    }
}
