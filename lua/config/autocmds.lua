local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function Lazygit_toggle()
  lazygit:toggle()
end

-- Ativa cursorline ao entrar no buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*", -- Aplica a todos os buffers
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- Desativa cursorline ao sair do buffer
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*", -- Aplica a todos os buffers
  callback = function()
    vim.opt_local.cursorline = false
  end,
})
