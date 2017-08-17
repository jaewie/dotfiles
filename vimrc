execute pathogen#infect()
filetype plugin indent on

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

set ruler
syntax enable
let g:airline_powerline_fonts = 1
let g:jellybeans_use_lowcolor_black = 0
syntax on

"set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE


"NERDTree
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd VimEnter * wincmd l
"let NERDTreeQuitOnOpen = 1

"Python
nnoremap <buffer> <C-F1> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <C-F2> :%s/\s\+$//e<CR>

"C
map <F8> : !gcc % && clear && ./a.out <CR>

"commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"get rid of the tildes
":highlight NonText ctermfg=bg


"get rid of the | seperators
:set fillchars+=vert:\ 
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
map <C-tab> :bnext<cr>
map <C-S-tab> :bprevious<cr>

"Zen mode. Press z to toggle on/off
nnoremap <Leader>z :LiteDFMToggle<CR>
"autocmd VimEnter * LiteDFM

"Set search highlight on
autocmd VimEnter * set hlsearch

"click
:set mouse=a

"for copy/pastes
set clipboard+=unnamed

"copy paste
nmap <silent> cp "_cw<C-R>"<Esc>

inoremap jk <esc>

"Vim airline
"let g:airline_powerline_fonts = 1
set laststatus=2

let mapleader = "\<Space>"
nnoremap <Leader>o :vsplit<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>1 :q!<CR>

"Show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
