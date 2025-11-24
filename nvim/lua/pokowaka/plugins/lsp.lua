return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'mason-org/mason.nvim', config = true },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym for Language Server Protocol. The Language Server Protocol is a protocol that allows editors (like Neovim) to communicate with servers that provide language-specific features.
      --
      -- For example, you might have a language server for Python that provides features like completion, formatting, and diagnostics.
      --
      -- You can learn more about LSP here: https://microsoft.github.io/language-server-protocol/
      --
      --
      --
      --
      -- The `on_attach` function is called when a language server attaches to a buffer.
      -- You can use this function to configure keymaps and other settings for that buffer.
      --
      -- In this case, we're creating a function that will be called when a language server attaches to a buffer.
      -- This function will set up keymaps for LSP features.
      --
      -- See `:help vim.lsp.buf` for more information on the LSP buffer functions.
      local on_attach = function(_, bufnr)
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
      end

      -- mason-lspconfig requires that these setup calls are called in this order
      --
      -- This is where we configure the servers that we want to use.
      --
      -- You can find a list of all the servers that are supported by `mason-lspconfig` here:
      --    https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      --
      -- For each server, we're providing a table of options.
      -- The `on_attach` function we defined earlier will be called when the server attaches to a buffer.
      local servers = {
        clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the configured servers.
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- You can add other tools to this list that will be installed by mason.
      --
      -- For example, if you want to install `stylua`, you can add it to this list.
      --
      -- You can find a list of all the tools that are supported by `mason-tool-installer` here:
      --    https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#available-packges
      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.on_attach = function(client, bufnr)
              on_attach(client, bufnr)
            end
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
