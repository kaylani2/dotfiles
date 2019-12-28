" Kaylani Bochie
" Github: github.com/kaylani2
" Email: kaylani2 at hotmail.com
" Don't put anything in your .vimrc you don't understand!

" #################################################
" ############### Beginners section ###############
" #################################################
" ^ -> Ctrl
" <CR> -> Carriage return (Enter)
"
" #################################################
"# Objects
	"w -> words
	"s -> sentences
	"p -> paragraphs
	"t -> tags
"
" #################################################
"# Motions
	" a -> all (around)
	" i -> in
	" f -> find forward
	" F -> find backwards
"
" #################################################
"# Commands
	" d -> delete (cut)
	" c -> change (and enter insert mode)
	" y -> yank (copy)
	" v -> visually select
"
" #################################################
"# Useful stuff
	" ^e -> scroll down
	" ^y -> scroll up
	" ^f -> page down
	" ^b -> page up
	" ^a -> increment one
	" ^x -> decrements one
	" ^s -> STOP
	" ^q -> CONTINUE
	" ^v -> makes a visual block
	" ^n -> displays autocomplete
	" ^x^n -> displays autocomplete for just this file
	" ^x^f -> same, but just for filenames
	" * # g* g#     : find word under cursor (forwards/backwards)
	" ga      : display hex, ascii value of character under cursor
	" g8      : display hex value of utf-8 character under cursor
	" ggg?G   : rot13 whole file
	" :b{substring} -> jumps to an open file containing the substring in its name
	" :echo expand ("%") -> displays the current file name
	" :10,100sort -> alphabetize lines 10 through 100
	" :%sort -> alphabetize entire file
	" :10,100s/foo/bar/g -> search and replace every "foo" for "bar" from between lines 10 and 100
	" :%s/foo/bar/g -> search and replace every "foo" for "bar" on the entire file
	" :g/^\(.*\)$\n\1$/p -> highlight duplicate lines in the open file
"
	" {command}{object or motion}
"
	" diw -> delete in word
	" yi) -> yank text inside parenthesis
	" va" -> visually select inside (including) double quotes
	" dd -> delete line
	" yy -> yank line
	" p -> paste below cursor
	" P -> paste above cursor
"
" #################################################
"# Macros
	" q{register}
	" (do the things)
	" q
	" @{register}
"
" #################################################
" # Regex
" Grouping:
"" :%s/\(GROUP1\)something\(group2\)/\1something\2
"" :%s/\ \(late game\)/\ \\textit{\1}/g -> replaces occureences of late game with \textit{late game}

" #################################################
"# Spellchecker
"
	" :setlocal spell! spelllang=en_us -> toggles spellcheck in english
	" ]s -> moves to next misspelled word
	" [s -> moves to previous misspelled word
	" z= -> shows suggestions for the word under the cursor
	" zg -> tags word as good word
	" zw -> tags word as bad word

" Syntax file and other settings for TypeScript.
" git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

" #################################################
" #################################################
" #################################################



" Just get over VI, person
set nocompatible

" change the mapleader from \ to ,
let mapleader = ","

" The standard color scheme looks shitty with tmux
colorscheme desert
set background=dark


syntax on
set number
set relativenumber
set rulerformat=%l\:%c
set tabstop=2
"set softtabstop=2
set shiftwidth=2
set expandtab
" /\ tabs are spaces now
" set cursorline
" /\ underline the current line
set hlsearch
" /\ highlight search results
set incsearch
" /\ search as characters are being typed
set linebreak
" /\ Wrap text on the screen appropriately (don't wrap in the middle of the word)
"set foldenable
" /\ enables code folding

" Use tab to auto cycle through autocomplete list instead of arrows
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" No more ex-mode
map q: <nop>
nnoremap Q <nop>

" Save using :W
" Save and quit using :WQ or :Wq
" No more Q! problems
command! WQ wq
command! Wq wq
command! W w
command! Q q
cmap Q! q!

" No more help (my terminal still provides the damn help)
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
"map <F1> <Esc>
"imap <F1> <Esc>
"nnoremap <F1> <Esc>g<C-G>


" Change panes without <C-W>
" Conflicts with 'scroll faster holding ctrl'
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Reload ~/.vimrc
" Doesn't work
"nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <F5> :setlocal spell! spelllang=en_us<CR>
nnoremap <F6> :setlocal spell! spelllang=pt_br<CR>
nnoremap <F7> :setlocal spell! spelllang=en_us,pt_br<CR>
nnoremap <F8> :g/^\(.*\)$\n\1$/p<CR>
" /\ highlights duplicate lines

" Stop using arrow keys
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>

" Move faster holding ctrl
nnoremap <C-J> 4j
nnoremap <C-K> 4k
nnoremap <C-L> 4l
nnoremap <C-H> 4h
" Don't skip visually wrapped lines
"nnoremap j gj
"nnoremap k gk

" Move easily between tabs
map <C-P> :tabp<cr>
map <C-N> :tabn<cr>


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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Easier serach and replace
noremap ;; :%s///g<Left><Left><Left>

" Read from the .skeleton.html file (a little template)
"nnoremap ,template :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a


" HTML shenanigans
"nnoremap <leader>ç :%s/ç/\&ccedil;/g<CR>
"nnoremap <leader>ã :%s/ã/\&atilde;/g<CR>
"nnoremap <leader>Ã :%s/Ã/\&Atilde;/g<CR>
"nnoremap <leader>á :%s/á/\&aacute;/g<CR>
"nnoremap <leader>Á :%s/Á/\&Aacute;/g<CR>
"nnoremap <leader>à :%s/à/\&agrave;/g<CR>
"nnoremap <leader>À :%s/À/\&Agrave;/g<CR>
"nnoremap <leader>é :%s/é/\&eacute;/g<CR>
"nnoremap <leader>É :%s/É/\&Eacute;/g<CR>
"nnoremap <leader>è :%s/è/\&egrave;/g<CR>
"nnoremap <leader>È :%s/È/\&Egrave;/g<CR>
"nnoremap <leader>í :%s/í/\&iacute;/g<CR>
"nnoremap <leader>Í :%s/Í/\&Iacute;/g<CR>
"nnoremap <leader>ó :%s/ó/\&oacute;/g<CR>
"nnoremap <leader>Ó :%s/Ó/\&Oacute;/g<CR>
"nnoremap <leader>ô :%s/ô/\&ocirc;/g<CR>
"nnoremap <leader>Ô :%s/Ô/\&Ocirc;/g<CR>
"nnoremap <leader>ú :%s/ú/\&uacute;/g<CR>
"nnoremap <leader>Ú :%s/Ú/\&Uacute;/g<CR>

" Remove those damn diacritics
nnoremap <leader>ç :%s/ç/c/g<CR>
nnoremap <leader>ã :%s/ã/a/g<CR>
nnoremap <leader>Ã :%s/Ã/A/g<CR>
nnoremap <leader>â :%s/â/a/g<CR>
nnoremap <leader>Â :%s/Â/A/g<CR>
nnoremap <leader>á :%s/á/a/g<CR>
nnoremap <leader>Á :%s/Á/A/g<CR>
nnoremap <leader>à :%s/à/a/g<CR>
nnoremap <leader>À :%s/À/A/g<CR>
nnoremap <leader>é :%s/é/e/g<CR>
nnoremap <leader>É :%s/É/E/g<CR>
nnoremap <leader>è :%s/è/e/g<CR>
nnoremap <leader>È :%s/È/E/g<CR>
nnoremap <leader>í :%s/í/i/g<CR>
nnoremap <leader>Í :%s/Í/I/g<CR>
nnoremap <leader>ó :%s/ó/o/g<CR>
nnoremap <leader>Ó :%s/Ó/O/g<CR>
nnoremap <leader>ô :%s/ô/o/g<CR>
nnoremap <leader>Ô :%s/Ô/O/g<CR>
nnoremap <leader>ú :%s/ú/u/g<CR>
nnoremap <leader>Ú :%s/Ú/U/g<CR>

" Let us keep a nice indentation
nnoremap <leader>( :%s/\(\S\)(/\1\ (/g<CR>
"nnoremap <leader>[ :%s/\(\S\)\[/\1\ (/g<CR>

" Flag to disable Typescript indenting (plugin)
let g:typescript_indent_disable = 1

" Adjust TCGPlayer list to tappedout format
nnoremap <leader>. :%s/\[.\+//g<CR>:%s/(.\+//g<CR>
nnoremap <leader>; :%s/\d\+/&x/g<CR>

" Just to parse data fetched from influxdb with curl
nnoremap <leader>ź :%s/],/]\r/g<CR>:%s/-/\//g<CR>:%s/T/_/g<CR>:%s/.\d\+Z",/ /g<CR>:%s/"\S\+",\S\+,"\S\+",//<CR>:%s/]//<CR>:%s/]\S\+//<CR>:%s/\["//<CR>

" Turn f() into f ()
nnoremap <leader>( :%s/\(\S\)\((\)/\1\ \2/g<CR>
" Turn f () into f()
nnoremap <leader>) :%s/\(\s\)\((\)/(/g<CR>

" Turn f[] into f []
nnoremap <leader>[ :%s/\(\S\)\(\[\)/\1\ \2/g<CR>
" Turn f [] into f[]
nnoremap <leader>] :%s/\(\s\)\(\[\)/[/g<CR>

" Turn x=y into x = y
nnoremap <leader>= :%s/\(\S\)=\(\S\)/\1 = \2/g<CR>
" Turn x =y into x = y
nnoremap <leader>_ :%s/\(\S\)=\(\s\)/\1 =\2/g<CR>
" Turn x= y into x = y
nnoremap <leader>- :%s/\(\s\)=\(\S\)/\1= \2/g<CR>
" Turn X,Y into X, Y
nnoremap <leader>, :%s/\(\S\)\(,\)\(\S\)/\1\2\ \3/g<CR>


" Highlights the word under the cursor by pressing ^m
nnoremap <C-M> :call HighlightNearCursor()<CR>
function! HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction
