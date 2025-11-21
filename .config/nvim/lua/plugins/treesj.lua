return {
    "Wansmer/treesj",
    keys = { "<space>m" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
        require("treesj").setup({--[[ your config ]]
            use_default_keymaps = false,
        })
        vim.keymap.set("n", "<leader>m", require("treesj").toggle)
    end,
}
