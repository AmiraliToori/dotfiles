-- File: lua/plugins/go-lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    -- TABLE: opts
    -- Merges with LazyVim's default LSP configuration.
    opts = {
      -- TABLE: servers
      -- This contains configurations for individual Language Servers.
      servers = {
        -- TABLE: gopls
        -- Specific configuration settings for the official Go language server.
        gopls = {
          -- TABLE: settings
          -- Nested options recognized natively by the gopls binary.
          settings = {
            gopls = {
              -- ARGUMENT: usePlaceholders
              -- Set to false to stop gopls from filling function arguments 
              -- automatically upon confirming a completion item.
              usePlaceholders = false,
              
              -- Example of another useful Go setting you can keep or omit:
              completeUnimported = true, -- Automatically handles your imports when completing
            },
          },
        },
      },
    },
  },
}
