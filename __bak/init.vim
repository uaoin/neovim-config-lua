
"几个重要的位置 linux和windows 有区别
"
"prettier + ESLint 验证代码
"代码块(最好和coc可配合使用）
"图片显示
"浏览器打开
""""""""""""""""""""""
"      somenotes      "
"                    "
""""""""""""""""""""""
"ubuntu
"~/.config/nvim/init.vim (vimrc)
"~/local/share/nvim/site/autoload/plug.vim (vim-plug)
"~/.config/nvim/plugged (插件安装地址)
"$MYVIMRC 本文件的位置

"v模式可以:normal [命令]

""""""""""""""""""""""
""""""""""""""""""""""

""""""""""""""""""""""
"      settings      "
"                    "
""""""""""""""""""""""
" 自动切换当前工作路径
set autochdir
" 设置重新进入文件时，光标留在上次退出的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"不会超出行显示 默认on
set wrap
"显示输入的命令 默认on
set showcmd
"tab 补全 默认on
set wildmenu

set nu
"开启相对行号
set relativenumber
"设置编码
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"启用中文文档
set langmenu=zh_CN.UTF-8
set helplang=cn 
"括号匹配
set showmatch
"高亮搜索 nvim默认已经开启
set hlsearch
"每次进入关闭高亮
exec "nohls"
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 搜索时大小写不敏感
set ignorecase    " Search ignoring case
"那么对于只有一个大写字母的搜索词，将大小写敏感
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
set incsearch     " Incremental search

" 自适应不同语言的智能缩进
filetype plugin indent on
"智能缩进
"set smartindent
"set autoindent
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
" set smarttab

"关闭vi兼容
set nocompatible
""""""""""""""""""""""
""""""""""""""""""""""

""""""""""""""""""""""
"      Mappings      "
"                    "
""""""""""""""""""""""
"<Leader>键
let mapleader="\<space>"

"浏览器打开(ubuntu) html
autocmd FileType html nnoremap <M-l><M-o> :!google-chrome % &<Cr><Cr>
"按f2进入粘贴模式
set pastetoggle=<F2>
""jj
inoremap jj <Esc>
"使用了标记jj之后光标会跳到字符之后
"inoremap jj <Esc>`^

"回车+空格关闭高亮
nnoremap <leader><Cr> :nohls<Cr>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p

"退出
nnoremap <leader>q :q<CR>

"保存
nnoremap <leader>w :w<CR>

"避免丢失可视化模式下的选择本文（在使用缩进后）
vnoremap < <gv
vnoremap > >gv

"不用手动zz
noremap n nzz
noremap N Nzz

"切换buffer
nnoremap <silent> [p :bprevious<CR>
nnoremap <silent> [n :bnext<CR>
"关闭当前 Buffer
nnoremap <silent> [d :bdelete<CR>
"打开一个新 Buffer
nnoremap <silent> [e :enew<CR>

"分屏操作
":vs :sp <Cw>v <Cw>s  进行分屏

"<Cw>= 所有窗口平均大小
"10<Cw>+ 增加10行高度 -减少
"10<Cw>< 缩小10宽度 >增大
"<Cw>H,J,K,L 移动分屏
"快速切换窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"左右跳 （映射按键不要带空格 刚才发生了一件很奇妙的事）
nnoremap H ^
nnoremap L $

"命令行模式 光标快速移动
"cnoremap <C-j> <t_kd>
"cnoremap <C-k> <t_ku>
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
""""""""""""""""""""""
""""""""""""""""""""""




""""""""""""""""""""""
"      Plugins       "
"                    "
""""""""""""""""""""""
"ubuntu
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
"开屏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree'
"模糊搜索
"Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
"cs ds ys(iw) Vmode使用S
Plug 'tpope/vim-surround'
"git
Plug 'tpope/vim-fugitive'
":GV 查看提交记录 配合fugitive使用
Plug 'junegunn/gv.vim'
"显示git修改
Plug 'airblade/vim-gitgutter'
"fzf.vim 模糊搜索 far批量替换
" fzf.vim CTRL-T/ CTRL-X/CTRL-V打开方式
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Neoformat vim-autoformat 代码格式化工具
"neomake ale 静态检查Lint插件
"
""gc注释
Plug 'Shougo/context_filetype.vim'
Plug 'tyru/caw.vim'
"Plug 'tpope/vim-commentary'
"Plug 'preservim/nerdcommenter'
"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"括号补全
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
"类似liveserver
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server', 'on': 'Bracey' }
"下划线
"Plug 'itchyny/vim-cursorword'
"Plug 'mattn/emmet-vim'
"rangervim 
"Plug 'iberianpig/ranger-explorer.vim'
"Plug 'rbgrouleff/bclose.vim'
"vim-javascript 解决了script标签的缩进问题 草泥马的
Plug 'pangloss/vim-javascript'
"好像没啥用
"Plug 'posva/vim-vue'
Plug 'honza/vim-snippets'
"markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
""""""""""""""""""""""
""""""""""""""""""""""
"markdown操作
":help vim-markdwon
" [[ "跳转上一个标题
" ]] "跳转下一个标题
" ]c "跳转到当前标题
" ]u "跳转到副标题
" zr "打开下一级折叠
" zR "打开所有折叠
" zm "折叠当前段落
" zM "折叠所有段落
" :Toc "显示目录
" za 打开光标所在折叠 zA 递归
" zc 关闭光标所在折叠 zC 递归
"
"莫名奇妙折叠
let g:vim_markdown_folding_disabled = 1
"
">>>>>>>>>>>>>>>
"Startify
"b (在同一个窗口打开), s (水平切分窗口), v (垂直切分窗口), t (在tab中打开)
":SLoad    load a session
":SSave    save a session
":SDelete  delete a session
":SClose   close a session
" 设置书签
let g:startify_bookmarks            = [
  \ "~/.config/nvim/init.vim"
  \ ]

" 起始页显示的列表长度
let g:startify_files_number = 4

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1

" 过滤列表，支持正则表达式
let g:startify_skiplist = []
"<<<<<<<<<<<<<<<
">>>>>>>>>>>>>>>
"colorscheme
"
"enable 24-bit color terminal support
set termguicolors

syntax on
"onedark主题
"let g:onedark_terminal_italics=1
"colorscheme onedark
"let g:airline_theme='onedark'
"snazzy主题
let g:SnazzyTransparent = 1
colorscheme snazzy
let g:airline_theme='violet'

"<<<<<<<<<<<<<<<

">>>>>>>>>>>>>>>
"括号补全 按键跳出括号
"imap <C-j> <Plug>delimitMateJumpMany

"<<<<<<<<<<<<<<<
">>>>>>>>>>>>>>>
"airline
"字体用的是DejaVu Sans Mono for Powerline
"https://github.com/powerline/fonts/tree/master/DejaVuSansMono
"gvim要使用set guifont=* 来选择字体
"
"显示buffer列表
let g:airline#extensions#tabline#enabled=1
" 显示 buffer 编号，方便切换 :b num
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts = 1
"<<<<<<<<<<<<<<<
"coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
"fzf
nnoremap <C-p> :Files<Cr>
"使用fzf切换buffer
nnoremap <M-b> :Buffers<Cr>
">>>>>>>>>>>>>>>
"NERDtree key map
"切换
nnoremap <leader>n :NERDTreeToggle<CR>
"查找所在文件位置 <Cw>p 可以跳转回之前的窗口
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$','\.swp']
"<<<<<<<<<<<<<<<



">>>>>>>>>>>>>>>
"easymotion
"ss 可跨屏查找(2字符)
nmap ss <Plug>(easymotion-overwin-f2)
"<<<<<<<<<<<<<<<


">>>>>>>>>>>>>>>
"vim-gitgutter延迟时间ms
set updatetime=100

"<<<<<<<<<<<<<<<

">>>>>>>>>>>>>>>
"ranger
"nnoremap <Leader>c :RangerOpenCurrentDir<CR>
"nnoremap <Leader>o :RangerOpenProjectRootDir<CR>
"<<<<<<<<<<<<<<<



">>>>>>>>>>>>>>>
"Coc

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
" 未保存文件可以跳转（保存到缓存区）
set hidden

" Some servers have issues with backup files, see #649.
" 关闭备份 但此issue已经被关闭
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
" 已经有浮动窗口了 只会让你的编辑器少一行
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
"inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
"<c-space>调起补全 
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use 
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" 查看报错信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" 跳转定义引用等
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gl <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" 查看文档
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
" 光标停留相同单词高亮 !失效
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" 重命名变量
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" 调整格式
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" vscode 右键
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
nnoremap <silent><nowait> ,a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> ,e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> ,o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> ,s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> ,j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> ,k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> ,p  :<C-u>CocListResume<CR>

""""""""""""""""""""""
"      cocPlug       "
"                    "
""""""""""""""""""""""
"coc的插件列表
let g:coc_global_extensions=['coc-json','coc-tsserver','coc-vetur','coc-html','coc-css','coc-snippets','coc-emmet','coc-highlight','coc-prettier']
"coc-marketplace 查看插件列表 :CocList marketplace
":Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"coc-snippets
"为当前文件创建代码片段 
"CocCommand snippets.editSnippets
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"
"autocmd BufRead,BufNewFile *.html set ft=html.javascript
"autocmd BufRead,BufNewFile *.vue set ft=vue.javascript
""""""""""""""""""""""
