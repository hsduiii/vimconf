local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }
vim.keymap.set("n", "<leader>d", function()
  local output = vim.fn.execute "RustLsp renderDiagnostic current"
  if output:match "No renderable diagnostics found." then
    vim.cmd "lua _G.show_diagnostics()"
  end
end, opts)
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.lsp.inlay_hint.enable(true)
