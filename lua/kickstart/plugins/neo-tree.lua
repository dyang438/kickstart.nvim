-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree filesystem reveal right<CR>', { desc = 'NeoTree reveal' } },
    { 'P', ':Neotree action=toggle_preview<CR>', { desc = 'NeoTree Preview Mode' } },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          ['<space>'] = 'toggle_node',
        },
      },
    },
  },
  config = function(_, opts)
    -- Auto open Neo-tree on startup
    --
    require('neo-tree').setup(opts)
    vim.cmd [[
      augroup NeotreeOnStartup
        autocmd!
        autocmd VimEnter * Neotree filesystem reveal right
      augroup END
    ]]
  end,
  lazy = false,
}
