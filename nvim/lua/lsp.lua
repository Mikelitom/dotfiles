-- ======================
-- LSP y Flutter-tools
-- ======================
local cmp_nvim_lsp = require('cmp_nvim_lsp')

require("flutter-tools").setup{
    lsp = {
        on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true }

            -- ESTO ACTIVA LOS HINTS EN FLUTTER/DART
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            -- Flutter keymaps por buffer
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fr', ':FlutterRun<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fh', ':FlutterHotReload<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fR', ':FlutterHotRestart<CR>', opts)
        end,
        capabilities = cmp_nvim_lsp.default_capabilities(),
    },
    debugger = { enabled = true },
}

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "pyright" }
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        -- ESTO ES LO QUE BUSCAS PARA PYTHON
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = true,
          parameterTypes = true,
        },
      },
    },
  },
})

-- También debemos asegurar que se activen al iniciar el buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

vim.lsp.enable("pyright")
