":::instalacion de plugins:::

call plug#begin('~/.config/nvim/plugged') 	"directorio donde se van a instalar los plugins

"plugins

Plug 'nvim-lualine/lualine.nvim' " Bottom bar colors
Plug 'nvim-tree/nvim-web-devicons' " Bottom bar icons
Plug 'sainnhe/gruvbox-material' " Theme
Plug 'nvim-tree/nvim-tree.lua' " Left file explorer
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

call plug#end() 			"cerramos el llamado de los plugins

" Auto open CHADTree
autocmd VimEnter * NvimTreeOpen

" Enable gruvbox material theme

" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'

" For better performance
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material

lua << END

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

require'lualine'.setup {
  options = {
    theme = 'codedark'
  }
}
END

nnoremap <C-p> <cmd>Telescope find_files<cr>
