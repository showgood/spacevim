let ag='/usr/local/bin/ag'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tmuxline#enabled = 0


set background=light
colorscheme solarized
let g:solarized_termcolors=256
"colorscheme molokai
"colo seoul256

" Light color scheme
"colo seoul256-light
"let g:seoul256_background = 236
"colo seoul256

" Switch
"set background=dark
"set background=light
"colorscheme hemisu
set gfn=Monaco:h12

syn on

let g:tmuxcomplete#trigger = ''

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/myvim/bundle/vim-snippets/snippets,~/myvim/mysnippets/neosnippets'
let g:neosnippet#snippets_directory='~/myvim/mysnippets/neosnippets'

let g:marching_enable_neocomplete = 1
"let g:marching_include_paths = [
            "\ "/usr/include/c++/4.2.1" ]
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
   if exists(':NeoCompleteLock')==2
       exe 'NeoCompleteLock'
    endif
endfunction

"         " Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
    endif
endfunction

let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1

"{{{ configuration for syntastic
"see all the options at 
"https://github.com/scrooloose/syntastic/wiki/C--%3A---gcc
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11'
"also check header file
let g:syntastic_cpp_check_header=1
"list all the include paths here
"let g:syntastic_cpp_include_dirs = []
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
set synmaxcol=120

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

"{{{ Unite.vim settings  keep it last
function Zip(zipFile, files)
    let destFile=a:zipFile.".zip"
    let cmd="!zip ".destFile." ".a:files
    execute cmd
endfunction
let ZipAction = {
\ 'is_selectable' : 1,
\ }
function! ZipAction.func(candidates)
  "todo: handle the directory case
  let zipFile = input('zip file name:')
  let files=[]
  for candidate in a:candidates
      call add(files, candidate.action__path)
  endfor
  let filesList = join(files)
  call Zip(zipFile, filesList)
endfunction

call unite#custom#action('file', 'zip', ZipAction)
unlet ZipAction

let g:unite_source_yank_history_save_clipboard=1
let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
let g:unite_split_rule = "topleft"
nnoremap    [unite]   <Nop>
nmap    z [unite]

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.svn/', '\.git/','\.obj$', 'bin/', 'obj/',
      \ '\.so$', '\.exe$', '\.a$', '\.dep$',
      \ '\.dla$', '\.dba$', '\.o$', '\.dbo$',
      \ '\.d$', '\.ti$', '\.map$', '\.obmp$',
      \ '\.ico$', '\.RMSfont$', '\.bin$', '\.idb$',
      \ '\.pdb$', '\.res$', '\.dll$', '\.dblite$',
      \ '\.exp$', '\.lib$', 'headers/', '\.ilk$',
      \ '\.pyc$', '\.pyd$', '\.manifest$',
      \ ], '\|'))

call unite#custom#source(
    \ 'buffer,file_rec/async,file_rec', 'matchers',
    \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
    \ 'file_rec/async,file_rec', 'converters',
    \ ['converter_file_directory'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_history_yank_enable = 1

nnoremap <leader>/ :Unite grep:.<cr>
"For searching the word in the cursor in the current directory,
noremap <silent> <Leader>s :Unite grep:.::\\b<C-R><C-w>\\b<CR>
"For searching the word in the cursor in the current buffer,
noremap <silent> <Leader>sf :Unite grep:%::\\b<C-r><C-w>\\b<CR>
"For searching the word in the cursor in all opened buffer
noremap <silent> <Leader>sb :Unite grep:$buffers::\\b<C-r><C-w>\\b<CR>

function! s:unite_my_settings()
    "I want to toggle the preview window when I press the "p" key.
    nnoremap <silent><buffer><expr> p
    \ empty(filter(range(1, winnr('$')),
    \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
    \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"

    nnoremap <silent><buffer><expr> s unite#do_action('split')
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-a>   <Plug>(unite_toggle_mark_all_candidates)
    "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    inoremap <buffer> <C-k> <C-w>k
    nnoremap <buffer> <C-k> <C-w>k
    inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
    inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nnoremap <silent><buffer><expr> v unite#do_action('vsplit')
    nnoremap <silent><buffer><expr> t unite#do_action('tabopen')

    nmap <buffer> q <Plug>(unite_exit)
    imap <buffer> <C-q> <Plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_my_settings()

nnoremap [unite]o :Unite -buffer-name=buffers -start-insert -winheight=10 tab buffer<cr>
nnoremap <F7> :Unite -buffer-name=yank -winheight=10 -start-insert history/yank<cr>
nnoremap [unite]m :Unite bookmark <cr>
nnoremap [unite]g :Unite register <cr>
nnoremap [unite]p :Unite mapping <cr>
nnoremap [unite]r :Unite resume <cr>
nnoremap [unite]f :Unite -start-insert file <cr>
nnoremap [unite]h :<C-u>UniteWithBufferDir -start-insert file<cr>
nnoremap [unite]c :<C-u>UniteWithCurrentDir -start-insert file<cr>
" re-open last Unite buffer
nnoremap <silent>[unite]u :<C-u>UniteResume<CR>
nnoremap <silent>[unite]; :Unite line<CR>
"}}}

"{{{ customize for ctrlp plugin 
:command -nargs=0 Rt :CtrlPRoot
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_open_multiple_files = 'rjt'
"search by filename only, not full path
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\objects|\.svn)$',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.obj$|\.dep$',
  \ }
nnoremap <unique> <F5> :CtrlPClearCache<cr>
let g:ctrlp_max_files = 0

"}}}
