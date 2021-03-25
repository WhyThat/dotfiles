" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" QuickFix List
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>

" Shortcut to open init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession!<CR>

" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>
nnoremap <leader>Q :Bwipeout!<CR>

" turn off search highlights
" noremap <leader><space> :set hlsearch! hlsearch?<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :tabclose<CR>

nnoremap n nzz
nnoremap N Nzz

" subtitute the word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap cp :let @+ = expand("%")<cr>
" Deal with split

",v splits vertically
nnoremap <leader>v :vsp<cr>

",h splits horizontally
nnoremap <leader>x :split<cr>

" / perform a very magic search
nnoremap / /\v
vnoremap / /\v

if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

nmap <leader>go :!git oops<CR>

nmap <leader>ds :!update-ds<CR>
