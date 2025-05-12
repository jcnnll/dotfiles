return {
    "thePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>p", function()
            harpoon:list():prepend()
        end, { desc = "[P]repend to harpoon file list" })
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "[A]ppend to harpoon file list" })
        vim.keymap.set("n", "<leader>h", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "[H]arpoon file list" })
        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon file [1]" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon file [2]" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon file [3]" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon file [4]" })
        vim.keymap.set("n", "<leader>r1", function()
            harpoon:list():replace_at(1)
        end, { desc = "Harpoon [r]eplace file [1]" })
        vim.keymap.set("n", "<leader>r2", function()
            harpoon:list():replace_at(2)
        end, { desc = "Harpoon [r]eplace file [2]" })
        vim.keymap.set("n", "<leader>r3", function()
            harpoon:list():replace_at(3)
        end, { desc = "Harpoon [r]eplace file [3]" })
        vim.keymap.set("n", "<leader>r4", function()
            harpoon:list():replace_at(4)
        end, { desc = "Harpoon [r]eplace file [4]" })
    end,
}
