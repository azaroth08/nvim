return {
    "nvim-telescope/telescope.nvim",

    branch = "0.1.x",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "folke/todo-comments.nvim"
    },

    config = function()

      local telescope = require("telescope")

      telescope.setup({})

      telescope.load_extension("fzf")

      local builtin = require('telescope.builtin')


      vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Fuzzy find files in cwd"})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pws', function()

        local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
          local word = vim.fn.expand("<cWORD>")
          builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>pd', "<cmd>TodoTelescope<cr>", {desc =  "Find TODO's"})
    end
}
