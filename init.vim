"========================================================================
"				PlugIn
"========================================================================
" 插件开始的位置
call plug#begin('~/.vim/plugged')
"Moose Support
Plug 'elementx54/moosefw_vim'

"ipython
"Plug 'sillybun/vim-repl'
Plug 'luk400/vim-jukit' 
" 主题
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/tokyonight.nvim'
"悬浮命令行
Plug 'voldikss/vim-floaterm'
"代码自动完成，安装完插件还需要额外配置才可以使用
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"snippets for coc-snippets
Plug 'honza/vim-snippets'
"格式化代码
Plug 'psf/black', { 'branch': 'stable' }
"Plug 'psf/black', { 'tag': '19.10b0' }
"异步调试
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'
" 可以在导航目录中看到 git 版本信息
" Plug 'Xuyuanp/nerdtree-git-plugin'
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'preservim/tagbar'

Plug 'liuchengxu/vista.vim'
" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

"Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'itchyny/lightline.vim'
""Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'
"回车自动选择代码块
Plug 'gcmt/wildfire.vim'
" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
"自动包裹
Plug 'tpope/vim-surround'
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
" 可以在 vim 中使用 tab 补全
"Plug 'vim-scripts/SuperTab'

"Python Format
Plug 'psf/black', { 'branch': 'stable' }
" 可以在 vim 中自动完成
"Plug 'Shougo/neocomplete.vim'
"Latex 支持
Plug 'lervag/vimtex'
Plug 'ray-x/lsp_signature.nvim'
"Plug 'ahmedkhalf/project.nvim'
" 增加neoformat auto format the code
Plug 'sbdchd/neoformat'
"ipynb support
" see: https://github.com/iamcco
"插件结束的位置，插件全部放在此行上面
call plug#end()
"
""===========================================================================
"				PlugOut
"===========================================================================
set fillchars=eob:\ 
set timeoutlen=800
hi NonText guifg=bg
call plug#end()
set termguicolors
set nu
set cursorline
let g:material_theme_style ='light'
nnoremap <tab> <c-w>w
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
nnoremap . :
noremap . :
"nnoremap df :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
"let g:ycm_goto_buffer_command = 'vertical-split'
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let mapleader = "\<space>"
"imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:floaterm_keymap_toggle = '<F7>'
tnoremap <Esc> exit<Cr>
nnoremap <C-a> gg<Home>vG<End>

nnoremap bn  :bnext<Cr>
nnoremap bp  :bprevious<Cr>

nnoremap   es :call VimSetting()<CR>  
noremap <C-b> :Neoformat<CR>
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'args': ['-q', '-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_python = ['black']


" format c/c++
let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=%:p'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_c = ['clangformat']
map <F5> :call CompileRunGcc()<CR>

let g:AutoPairsShortcutFastWrap = '<C-k>'


map <C-x> :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
map<C-t> :NERDTreeToggle<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't','reuse': 'all'}}
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
let g:UltiSnipsJumpForwardTrigger ='<c-e>' 
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpBackwardTrigger = '<c-r>'

func VimSetting()
	exec "tabedit ~/.config/nvim/init.vim"
endfunc

func! Resource()
	exec 'source ~/.config/nvim/init.vim'
endfunc

func! CompileRunGcc()
    exec "w"
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                         
			  exec "w"
			  "exec ":FloatermNew --title=Result --autoclose=0 python3 -W ignore %"
			  exec "AsyncRun -mode=term -pos=floaterm python3 -W ignore  % "
			  "exec "!python3 -W ignore -i %"
                          "exec "copen"
			  "exec "term"
			  "exec "wincmd p"
                  endif
	    	elseif &filetype == 'go'
        		  exec "!time go run %"
    endif
endfunc
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
let g:jukit_mappings = 0
autocmd Filetype python nnoremap <leader>r :call jukit#send#line()<cr> 
autocmd Filetype python nnoremap <leader>os :call jukit#splits#output()<cr>
autocmd Filetype python vnoremap <leader>s:call jukit#send#section(0)<cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

colorscheme material
"colorscheme github_dark_default
let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ }
" 自动切换输入法
"##### auto fcitx  ###########
function! Switch2EN()
	
     silent exec  "!fcitx-remote -c"      
     

endfunction

"Exit insert mode
autocmd InsertLeave * call Switch2EN()
"##### auto fcitx end ######
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set t_Co=256
"autocmd BufEnter * lcd %:p:h
hi Normal guibg=NONE ctermbg=NONE
let g:airline#extensions#tabline#formatter = 'unique_tail'
"Latex Settingis
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_format_enabled=1
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
augroup vimtex_autoclean
  autocmd!
  autocmd User VimtexEventQuit VimtexClean
augroup END
"=======================================
"                 COC
"=======================================
"let g:coc_node_path = substitute(system('which node'), '\n', '', '')
"let g:coc_node_path = '/home/liu/.nvm/versions/node/v16.20.2/bin/node'
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=no
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-r> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
augroup ygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<TAB>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<S-TAB>'
hi Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
hi Pmenu guibg=#212333
hi PmenuSel guibg=#6A3EB5 guifg=#bfc7d5
hi PmenuSbar guibg=#352B59 guifg=#352B59
hi PmenuThumb guibg=#352B59 guifg=#352B59
hi default CocUnderline cterm=underline gui=undercurl
"========================================================
"		         Gui
"========================================================
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
if exists("g:neovide")

lua vim.o.guifont = "Monaspace Xenon light:h11"
let g:neovide_refresh_rate=120
let g:neovide_cursor_vfx_mode="wireframe"
let g:neovide_transparency = 0.85
let g:transparency = 0.85
endif
let g:jupytext_fmt = 'python'
let g:jukit_inline_plotting = 1
set title
" How each level is indeNTEd and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'coc',
  \ 'py': 'coc',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
let g:md_pdf_viewer="Zathura"

"lua<<EOF
"require("project_nvim").setup{
"  -- Manual mode doesn't automatically change your root directory, so you have
"  -- the option to manually do so using `:ProjectRoot` command.
"  manual_mode = false,
"
"  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
"  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
"  -- order matters: if one is not detected, the other is used as fallback. You
"  -- can also delete or rearangne the detection methods.
"  detection_methods = { "coc", "pattern" },
"
"  -- All the patterns used to detect root dir, when **"pattern"** is in
"  -- detection_methods
"  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
"
"  -- Table of lsp clients to ignore by name
"  -- eg: { "efm", ... }
"  ignore_lsp = {},
"
"  -- Don't calculate root dir on specific directories
"  -- Ex: { "~/.cargo/*", ... }
"  exclude_dirs = {},
"
"  -- Show hidden files in telescope
"  show_hidden = false,
"
"  -- When set to false, you will get a message when project.nvim changes your
"  -- directory.
"  silent_chdir = true,
"
"  -- What scope to change the directory, valid options are
"  -- * global (default)
"  -- * tab
"  -- * win
"  scope_chdir = 'global',
"
"  -- Path where project.nvim will store the project history for use in
"  -- telescope
"  datapath = vim.fn.stdpath("data"),
"} 
"EOF
"
"lua require('telescope').load_extension('projects')
