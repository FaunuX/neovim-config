vim.api.nvim_command('map! <D-v> <C-R>+')

function toggle_theme()
	if vim.o.background == 'light' then
		vim.o.background = 'dark'
	else
		vim.o.background = 'light'
	end
end

vim.g.mapleader = ' '

vim.api.nvim_set_keymap( "n", "<leader>ter", ":ToggleTerm<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>fil", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>out", ":w | qa!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>tem", ":lua toggle_theme()<CR>", {noremap = true, silent = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
