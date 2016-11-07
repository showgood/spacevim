"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spacemacs#toggleExplorerAtRoot()
  if exists(':ProjectRootExe')
    exe "ProjectRootExe NERDTreeToggle"
  else
    exe "NERDTreeToggle"
  endif
endfunction

" errors (syntastic integration)
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    SyntasticToggleMode
    " lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        " Errors
        SyntasticCheck
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alphabetical and avoid <SILENT> for now.
nmap <LEADER><TAB> <C-^>
nmap <leader><leader> :
nmap <Leader>? :Unite output:nmap\ \<Leader\><CR>

nmap <Leader>au :UndotreeToggle<CR>

nmap <LEADER>bb :CtrlPBuffer<CR>
nmap <LEADER>bd :bdelete<CR>
nmap <LEADER>bn :bn<CR>
nmap <LEADER>bp :bp<CR>
nmap <LEADER>bR :e<CR>
nmap <LEADER>bs :Scratch<CR>

" done in nerdcommenter plugin itself..
"nmap <LEADER>cl <Plug>NERDCommenterToggle

nmap <silent> <Leader>el :<C-u>call ToggleErrors()<CR>
nmap <silent> <Leader>en :lnext<CR>
nmap <silent> <Leader>ep :lprev<CR>

nmap <LEADER>fed :e $MYVIMRC<CR>
nmap <LEADER>feR :so $MYVIMRC<CR>
nmap <silent> <LEADER>ff :<C-u>UniteWithBufferDir -start-insert file<cr>
nmap <leader>fy :let @*=expand("%:p")<CR>
nmap <LEADER>fr :CtrlPMRU<CR>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>ft :NERDTreeToggle<CR>

nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>

nmap <leader>jJ <Plug>(easymotion-overwin-s2)
nmap <leader>jj <Plug>(easymotion-overwin-f)
nmap <Leader>jl <Plug>(easymotion-overwin-line)

nmap <LEADER>pf :CtrlPRoot<CR>
nmap <LEADER>pt :call spacemacs#toggleExplorerAtRoot()<CR>
nmap <LEADER>qq :qa<CR>
nmap <Leader>qQ :qa!<CR>
nmap <Leader>qs :xa<CR>

nmap <space>ry :Unite register history/yank<cr>

nmap <Leader>sc :noh<CR>
nmap <leader>ss :Unite line<CR>
nmap <LEADER>sp :Ag<SPACE>

nmap <LEADER>tn :set number!<CR>
nmap <Leader>Td :GitGutterToggle<CR>

nmap <LEADER>w- :sp<CR>
nmap <LEADER>w/ :vsp<CR>
nmap <LEADER>w= <C-W>=
nmap <LEADER>wc :q<CR>
nmap <LEADER>wh <C-W>h
nmap <LEADER>wj <C-W>j
nmap <LEADER>wk <C-W>k
nmap <LEADER>wl <C-W>l
nmap <LEADER>ws <C-W>s
nmap <LEADER>wv <C-W>v
nmap <LEADER>wm :only<CR>
nmap <LEADER>ww <C-W><C-W>
nmap <leader>wW :ChooseWin<cr>

"nmap <leader>vv :<Plug>(expand_region_expand)
