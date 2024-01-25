return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("telescope").load_extension('harpoon')
    local harpoon = require("harpoon")

		harpoon.setup()

		vim.keymap.set("n", "<leader>x", function()
       require("harpoon.mark").add_file()
		end)

		vim.keymap.set("n", "<leader>ht", function()
      require("harpoon.ui").toggle_quick_menu()
		end)
  end
}
