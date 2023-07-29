local Freshfox = require('vim-Freshfox')

Freshfox.setup()

vim.api.nvim_create_autocmd('User', {
    pattern = 'VimtexEventCompileSuccess',
    callback = Freshfox.refresh,
    group = vim.api.nvim_create_augroup('vimtex_refresh_firefox', {clear = true})
})
