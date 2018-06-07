" Beginners section
"
"^ -> Ctrl
"# Objects
	"w -> words
	"s -> sentences
	"p -> paragraphs
	"t -> tags
"
"# Motions
	"a -> all (around)
	"i -> in
	"f -> find forward
	"F -> find backwards
"
"# Commands
	"d -> delete (cut)
	"c -> change (and enter insert mode)
	"y -> yank (copy)
	"v -> visually select
"
"# Useful stuff
	"^e -> scroll down
	"^y -> scroll up
	"^f -> page down
	"^b -> page up
	"^a -> increment one
	"^x -> decrement one
	"^s -> STOP
	"^q -> CONTINUE
	"^n -> displays autocomplete
	"^x^n -> displays autocomplete for just this file
	"^x^f -> same, but just for filenames
	"* # g* g#     : find word under cursor (forwards/backwards) 
	" ga      : display hex, ascii value of character under cursor
	" g8      : display hex value of utf-8 character under cursor
	" ggg?G   : rot13 whole file
	":b{substring} -> jumps to an open file containing the substring in its name
	":echo expand ("%") -> displays the current file name
	"
	"
"
	"{command}{object or motion}
"
	"diw -> delete in word
	"yi) -> yank text inside parenthesis
	"va" -> visually select inside (including) double quotes
	"dd -> delete line
	"yy -> yank line
	"p -> paste below cursor
	"P -> paste above cursor
"
"# Macros
	"- q{register}
	"- (do the things)
	"- q
	"- @{register}
	


" Just get over VI, man
"set nocompatible

" The standard color scheme looks shitty with tmux 
colorscheme desert 

" Show matching brackets when text indicator is over them
"set showmatch 
" How many tenths of a second to blink when matching brackets
"set mat=2
" Expand tabs into spaces
"set expandtab
"set ruler


"setlocal spell spelllang=en_us
set number
"set relativenumber
"set rulerformat=%l\:%c
set tabstop=3
set shiftwidth=3
syntax on
set hlsearch

" No more ex-mode
map q: <nop>
nnoremap Q <nop>

" Save using :W
" Save and quit using :WQ or :Wq
command WQ wq
command Wq wq
command W w
command Q q

" Change panes without <C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set clipboard=unnamed

" Eliminate esc delay
set ttimeoutlen=100

" If you search a file using :find
" Vim will search recursively inside the active directory
set path+=**
" :set path? to check

" Display all matching files when we tab complete
set wildmenu

" Create the 'tags' file (must install ctags first) by issuing the command MakeTags
" Use ^] to jump to tag under cursor
" Use ^t to jump back up the tag stack
command! MakeTags !ctags -R .


" change the mapleader from \ to ,
let mapleader = ","

" Reload ~/.vimrc
"nmap <leader>s :source ~/.vimrc<CR>!

" Read from the .skeleton.html file (a little template)
nnoremap ,template :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a


" HTML shenanigans
nnoremap ,ç :%s/ç/\&ccedil;/g<CR>
nnoremap ,ã :%s/ã/\&atilde;/g<CR>
nnoremap ,Ã :%s/Ã/\&Atilde;/g<CR>
nnoremap ,á :%s/á/\&aacute;/g<CR>
nnoremap ,Á :%s/Á/\&Aacute;/g<CR>
nnoremap ,à :%s/à/\&agrave;/g<CR>
nnoremap ,À :%s/À/\&Agrave;/g<CR>
nnoremap ,é :%s/é/\&eacute;/g<CR>
nnoremap ,É :%s/É/\&Eacute;/g<CR>
nnoremap ,í :%s/í/\&iacute;/g<CR>
nnoremap ,Í :%s/Í/\&Iacute;/g<CR>

" Highlights the word under the cursor by pressing ^k
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction
