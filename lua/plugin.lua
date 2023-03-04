local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim' vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path}) print('Done.')
	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'vim-airline/vim-airline'
	use 'm4xshen/autoclose.nvim'        
	use 'ryanoasis/vim-devicons'

	use "akinsho/toggleterm.nvim"
	use "nvim-lua/plenary.nvim"
	use 'habamax/vim-godot'

	use 'mhinz/vim-startify'

	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
	use 'lukas-reineke/indent-blankline.nvim'

	use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	if install_plugins then
		require('packer').sync()
	end
end)

if install_plugins then
	return 
end

require("toggleterm").setup({
	size=20,
	direction="float"
})

local Terminal  = require('toggleterm.terminal').Terminal
local wordle = Terminal:new({ cmd = "~/go/bin/clidle", hidden = true })
local parrot = Terminal:new({ cmd = "curl parrot.live", hidden = true })

function _wordle_toggle()
	wordle:toggle()
end

function _parrot_toggle()
	parrot:toggle()
end


vim.g.godot_executable = '/Applications/Godot.app'
vim.api.nvim_set_keymap("n", "<leader>wor", "<cmd>lua _wordle_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>par", "<cmd>lua _parrot_toggle()<CR>", {noremap = true, silent = true})

require("nvim-tree").setup({ 
	sync_root_with_cwd = true, 
	view = { 
		float = { 
			enable = true ,
			open_win_config = {
				border = "none"
			}
		}
	}
})

require('tabnine').setup({
	disable_auto_comment=true, 
	accept_keymap="<Tab>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 800,
	suggestion_color = {gui = "#808080", cterm = 244},
	exclude_filetypes = {"TelescopePrompt"}
})

require('lualine').setup {
	options = {
		theme = 'tokyonight'
	},
	tabline = {
		lualine_a = {},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	sections = {lualine_c = {'lsp_progress'}, lualine_x = {'tabnine'}}
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
