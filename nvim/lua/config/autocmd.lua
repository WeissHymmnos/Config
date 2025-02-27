-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable automatic commenting on newline
vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' }, {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove 'c'
    vim.opt_local.formatoptions:remove 'r'
    vim.opt_local.formatoptions:remove 'o'
  end,
})

--INFO: resession:
local resession = require 'resession'
-- Automatically save sessions on by working directory on exit
-- vim.api.nvim_create_autocmd('VimLeavePre', {
--   callback = function()
--     resession.save(vim.fn.getcwd(), { notify = true })
--   end,
-- })
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    resession.save 'last'
  end,
})

--highlights
if not vim.g.transparent() then
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
      vim.cmd 'source ~/.config/nvim/lua/config/highlights.lua'
    end,
  })
end


