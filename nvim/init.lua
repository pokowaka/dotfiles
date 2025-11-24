-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--  NOTE: Here is where you install your plugins.
--  You can configure plugins using the `opts` table.
--  You can also configure plugins after installation by requiring them elsewhere in your config.
--
--  See `:help lazy.nvim-lazy.nvim-spec` for more information.
require('lazy').setup({
  spec = {
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- import any extras modules here
    -- { import = 'lazyvim.plugins.extras.lang.typescript' },
    -- { import = 'lazyvim.plugins.extras.lang.json' ' },
    -- { import = 'lazyvim.plugins.extras.ui.mini-animate' },
    -- import/override with your plugins
    { import = 'pokowaka.plugins' },
  },
  defaults = {
    -- By default, plugins are lazy-loaded. If you want to load them on startup,
    -- set `lazy = false` in the plugin spec.
    lazy = true,
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
