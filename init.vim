":::instalacion de plugins:::

call plug#begin('~/.config/nvim/plugged') 	"directorio donde se van a instalar los plugins

"plugins

Plug 'nvim-lualine/lualine.nvim' " Bottom bar colors
Plug 'nvim-tree/nvim-web-devicons' " Bottom bar icons
Plug 'sainnhe/gruvbox-material' " Theme
Plug 'nvim-tree/nvim-tree.lua' " Left file explorer
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

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

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>

" coc.nvim config -------------------------------------------------

"Install dependecies
let g:coc_global_extensions = ['coc-eslint', 'coc-elixir', 'coc-tsserver', 'coc-prettier', 'coc-rust-analyzer', 'coc-go']

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add `:GoToDefinition` command to show var, func, import definition.
command! -nargs=0 GoToDefinition :call CocActionAsync('jumpDefinition')

" coc.nvim config end -----------------------------------------------

lua << END

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

require('lspconfig').vls.setup{}

require'lualine'.setup {
  options = {
    theme = 'codedark'
  }
}

vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])

END


