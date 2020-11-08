let g:webdevicons_enable_nerdtree = 1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusShowIgnored = 1
function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction

" Using "<leader>n" to toggle NERDTree
nmap <leader>n :call ToggleNERDTree()<CR>

