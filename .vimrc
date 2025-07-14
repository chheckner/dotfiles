call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'ron89/thesaurus_query.vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'preservim/vimux'
"Plug 'ycm-core/YouCompleteMe'
Plug 'BenGH28/neo-runner.nvim', {'do': ':UpdateRemotePlugins'}
call plug#end()


 let mapleader =","
 let maplocalleader =";"

    filetype plugin on
	syntax on
	set encoding=utf-8
	set number 
	set relativenumber
	set nocompatible
	set incsearch	
	set hidden
	set scrolloff=8
	set noswapfile
	"colo jellybeans

	" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" Vertically center document in insert mode
autocmd InsertEnter * norm zz

" Text to top in Insert mode
"autocmd InsertEnter * norm zt
"
"copy-paste from/into system clipboard
"
vnoremap <C-y> "+y
map <C-p> "+P

"""""""""""""""""""""""""""""Markdown"""""""""""""""""""""""""""""""
"note taking in md

autocmd fileType markdown inoremap ;. <Esc>mnGA<CR><CR>
autocmd fileType markdown inoremap ;m <Esc>'nA

" quotes in markdown

autocmd fileType markdown inoremap <C-i> ""++<Left><Left><Left>
autocmd fileType markdown inoremap <C-a> <Esc>/++<CR>xxa
autocmd fileType markdown nnoremap <C-i> i""++<Left><Left><Left>
autocmd fileType markdown nnoremap <C-a> /++<CR>xxa

command W w !sudo tee % >/dev/null

"save notes to file "note" in gdk Directory
"
autocmd fileType markdown nnoremap <F6> /#<Space>notes<CR>2jVG:!cat>>~/vimwiki/notes.wiki<CR>

"general markdown
"
au fileType markdown set nonu
au fileType markdown set norelativenumber
au fileType markdown set formatoptions+=a

"""""""""""""""""""""""""""""""Python"""""""""""""""""""""""""""""
"
au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix
	\set smarttab

"string autocomplete
au fileType python inoremap <Localleader>i <Esc>i("")++<Esc>F)<Left>i
au fileType python inoremap <C-a> <Esc>/++<CR>xxa

function! VimuxSlime()
	call VimuxRunCommand(@v, 0)
endfunction

" Vimux snippets
" attach shell running python
au fileType python vmap <Localleader>f :!python3<CR>

" run selection in attached shell
au fileType python vmap <Localleader>vs "vy :call VimuxSlime()<CR>

" run whole script including input
au fileType python map <Localleader>r :w<CR>:!python3<Space>%<CR>

" run codeblock in new tab and create temp file:
au fileType python map <Localleader>a vipy:tabnew<CR>p:saveas!<Space>temp<CR>:!python<Space>%<CR>

au fileType python inoremap <C-l> tippe_text("")++<Esc>hhhi
au fileType python inoremap <C-o> time.sleep(1)<Esc>o
au fileType python vnoremap <Localleader>n do<Esc>pA")<Esc>Itippe_text("<Esc>Otime.sleep(1)<Esc>j



"""""""""""""""""""""""""""" C """""""""""""""""""""""""""""


autocmd FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c setlocal autoindent smartindent
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType c setlocal formatoptions+=cro
autocmd FileType c setlocal textwidth=120
autocmd FileType c setlocal number relativenumber
autocmd FileType c setlocal showmatch
autocmd FileType c setlocal enc=utf-8 fenc=utf-8 termencoding=utf-8
autocmd FileType c setlocal termguicolors
autocmd FileType c setlocal colorcolumn=80
autocmd FileType c setlocal nosplitbelow
autocmd FileType c setlocal splitright

" c hauptfunktion:
" Header function
autocmd Filetype c inoremap <C-H> #include <stdio.h>\<CR>#include <stdlib.h>\<CR>\<CR>int main() {\<CR>	return 0;\<CR>}
"Comments
"one-line comment
autocmd Filetype c nnoremap <leader>c :s/^/\/\/ /<CR>:noh<CR>
"multi-line comment (visual mode)
autocmd Filetype c vnoremap <leader>c :s/^/\/\/ /<CR>:noh<CR>

"function shortcut
autocmd Filetype c inoremap <C-F> int function_name() {\<CR>	// code insert\<CR>}
"for-loop shortcut
autocmd Filetype c inoremap <C-F> for (int i = 0; i < N; i++) {\<CR>	// code insert\<CR>}
autocmd Filetype c nnoremap  <F5> :w<CR>:!make run<CR>

" Spezielle Einstellungen für C-Dateien
augroup CConfig
  autocmd!
  autocmd FileType c setlocal nosplitbelow
  autocmd FileType c setlocal splitright
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


"Split window
nnoremap <leader>s :60vsplit<CR><C-w>r

" Adjust Splitsize ctrl + arrow keys
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" move on individual lines in paragraphs
map j gj
map k gk

" end and beginnig of line remap:
nnoremap gl $
nnoremap gh 0

"Nerdtree
map <C-n> :NERDTreeToggle<CR>

" navigate between windows using ctrl + vim keys

	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l



" remove pipes that seperate splits
"set fillchars+=vert:


"urlview in files:

:noremap <leader>u :w<Home>silent <End> !urlview<CR>


"find files 

"search subdirectories

set path+=**

"display matching filenames when tab-complete

set wildmenu

"set spell
"set spelllang=de


"autocmd BufRead,BufNewFile *.md setlocal spell

"Print the line numbers on output (change to y to print):
:set printoptions=number:n



" Folding:

  set nocompatible
    if has("autocmd")
      filetype plugin indent on
    endif
