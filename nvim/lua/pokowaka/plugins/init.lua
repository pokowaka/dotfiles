return {
  --  NOTE: To add a plugin, just add a new entry to this list in the following format:
  --
  --  {
  --    "username/repo-name",
  --    -- an optional list of plugin names that should be loaded before this plugin
  --    dependencies = { "plugin-1", "plugin-2" },
  --    -- an optional list of events that should trigger loading the plugin
  --    event = { "BufRead", "BufNewFile" },
  --    -- an optional function to configure the plugin
  --    config = function()
  --      -- an example of how to call the setup function for a plugin
  --      require("plugin-name").setup()
  --    end,
  --  },
  --
  --  For more information, see `:help lazy.nvim-lazy.nvim-spec`
  --
  --  To disable a plugin, you can add `enabled = false` to the plugin spec.
  --  To override a plugin's options, you can add `opts = { ... }` to the plugin spec.
  --
  --  For example, to disable the Telescope plugin, you can add the following to this file:
  --
  --  {
  --    "nvim-telescope/telescope.nvim",
  --    enabled = false,
  --  },
  --

}
