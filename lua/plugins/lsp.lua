return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    lazy=false, 
    dependencies = {
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.extend_lspconfig()

      lsp_zero.configure("emmet_ls", {
        filetypes = {
          "css",
          "eruby",
          "html",
          "htmldjango",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "templ",
          "typescriptreact",
          "vue"
        },
    })

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
    }
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {"L3MON4D3/LuaSnip"},
      {"saadparwaiz1/cmp_luasnip"}
    },
    config = function()
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()

      cmp.setup({
        sources = {
          {
            name = "nvim_lsp"
          }
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({select = false}),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        })
      })
    end
  }
}
