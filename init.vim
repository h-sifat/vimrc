syntax on

set background=dark
set belloff=all
set colorcolumn=80
set expandtab
set incsearch
set nobackup
set noerrorbells
set noswapfile
set nowrap
set noshowmode
set nu
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set undodir=~/.config/nvim/undodir
set undofile
highlight ColorColumn ctermbg=0 guibg=lightgrey
set guifont=Fira\ Code
set termguicolors
"----------From COC -----------------
set cmdheight=2
set hidden
set nowritebackup
set shortmess+=c
set updatetime=300
"set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
"----------------End of From COC ----------------


" Initialize plugin system
call plug#begin('~/.config/nvim/plugged')
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'https://github.com/ayu-theme/ayu-vim.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/dracula/vim.git'
Plug 'https://github.com/mhartington/oceanic-next.git'
Plug 'itchyny/lightline.vim'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

colorscheme gruvbox
"colorscheme ayu
"colorscheme OceanicNext
"colorscheme dracula


"------------------For ayu
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme



"------------------------------Globla Variables--------------------------------
let mapleader = ","
let g:coc_snippet_next = '<tab>'
let g:js_file_import_prompt_if_no_tag = 0
let g:js_file_import_no_mappings = 1

" From oceanic next theme
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"-----------------For ctrlp---------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules)$',
  \ 'file': '\v\.(gitignore)$'
  \ }

"------------------------------For Light Line-----------------------------------
let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

"-------------Terminal Configuration-----------------------------
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminalVartically()
  vsplit term://bash
endfunction

function! OpenTerminalHorizontally()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminalHorizontally()<CR>
nnoremap <c-m> :call OpenTerminalVartically()<CR>

"------------------------------------------------------------------

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact


"===========================Remaps=================================
nnoremap <space>e :CocCommand explorer<CR>
nnoremap <space>u :UndotreeToggle<CR>

map <space>j <C-W>j
map <space>k <C-W>k
map <space>h <C-W>h
map <space>l <C-W>l
nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>

" nnoremap <silent> <space>= :vertical resize +10<CR>
" nnoremap <silent> <space>- :vertical resize -10<CR>
nnoremap <silent> <C-Left> :vertical resize +5<CR>
nnoremap <silent> <C-Right> :vertical resize -5<CR>
nnoremap <silent> <C-Up> :res +5<CR>
nnoremap <silent> <C-Down> :res -5<CR>
" nnoremap <silent> <Left> :horizontal resize +10<CR>
" nnoremap <silent> <Right> :horizontal resize -10<CR>
nnoremap <f2> :Fold<CR>
nnoremap <f3> :Format<CR>
"To run the current javascript file
nnoremap <f4> :te clear && node %<CR>
"To run .cpp file Note: <f5> is taken by CtrlP
nnoremap <f5> :CtrlPClearCache<CR>
nnoremap <f9> :te clear && g++ -std=c++17 % -Wall -g -o %.out && ./%.out<CR>
"To compile the current typescript file
nnoremap <f6> :te: clear && tsc --outFile %.js %<CR>
"To run the current typescript file that is compiled
nnoremap <f7> :te: clear && node %.js<CR>

"For vim-js-file-import ---------------
"nnoremap <leader>if <Plug>(JsFileImport)
"nnoremap <leader>iF <Plug>(JsFileImportList)
"nnoremap <leader>ig <Plug>(JsGotoDefinition)
"nnoremap <leader>iG <Plug>(JsGotoDefinition)
"nnoremap <leader>ip <Plug>(PromptJsFileImport)
"nnoremap <leader>is <Plug>(SortJsFileImport)
"nnoremap <leader>ic <Plug>(JsFixImport)
nmap <f8> <Plug>(JsFileImport)

"------------------For coc explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [indent][filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }



" Use preset argument to open it
"nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
"nnoremap <space>ef :CocCommand explorer --preset floating<CR>
"nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
"nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
"nnoremap <space>el :CocList explPresets

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"To make snippet completion work just like VSCode
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions. -----Disabled for coc-explorere
"nnoremap <silent><nowait> <space>ex  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
