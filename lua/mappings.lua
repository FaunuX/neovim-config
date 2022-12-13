vim.api.nvim_command('map! <D-v> <C-R>+')
vim.api.nvim_command('map <S-w> <C-w>')
vim.api.nvim_set_keymap( "n", "ter", ":ToggleTerm<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "fil", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

