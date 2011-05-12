
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My  config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Platform
function! MySys()
        if has("win32") || has("win64")
                return "windows"
        elseif has("mac")
                return "mac"
        else
                return "linux"
        endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
set encoding=utf-8                  "查找编码的规则（vim7默认都用utf-8，打开包含gbk字符的文件会出现乱码）
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set fencs=utf-8,gbk                "转换文件的编码

set columns=85                    "初始窗口的宽度
set lines=28                       "初始窗口的高度
winpos 402 132                       "初始窗口的位置

set linespace=4                     "行间距，如果默认值太小，代码会非常纠结                                                               
set shiftwidth=4                    "用<>调整缩进时的长度
set tabstop=4                       "制表符的长度，统一为4个空格的宽度

set number                          "显示行号
set numberwidth=4                   "行号栏的宽度
set nowrap                          "禁止自动换行
set wildmenu                        "在输入命令时列出匹配项目，也就是截图底部的效果
set ruler                           "显示光标位置
set equalalways                     "分割窗口时保持相等的宽/高

set matchpairs=(:),{:},[:],<:>      "匹配括号的规则，增加针对html的<>
set backspace=indent,eol,start whichwrap+=<,>,[,]         "使backspace正常处理indent, eol, start等
set whichwrap=b,s,<,>,[,]           "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set nobackup                        "取消自动备份
"set writebackup                    "保存关闭文件之前保留一个备份
set guitablabel=%t                  "让标签栏只显示文件名

set formatoptions+=mM               "正确地处理中文字符的折行和拼接
set autoindent                      "打开自动缩,继承前一行的缩进注释 进
filetype plugin on                  "载入文件类型插件
filetype indent on                  "为特定文件类型载入相关缩进文件
set completeopt=longest,menu        "去掉预览窗口的显示
set history=250                     "history文件中需要记录的行数

set foldmethod=manual               "默认情况下手动折叠(设成indent为自动折叠)
set foldmethod=indent               "fold based on indent
set foldnestmax=3                   "deepest fold is 3 levels
set nofoldenable                    "dont fold by default

syntax on                           "设置开启语法高亮  
set incsearch                       "在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set hlsearch                        "搜索高亮
set novisualbell                    "不要闪烁
" set ignorecase                    "搜索时不区分大小写
"set nocompatible                   "不需要保持和 vi 非常兼容
"source $VIMRUNTIME/vimrc_example.vim    "执行 Vim 缺省提供的 .vimrc 文件的示例，包含了打开语法加亮显示等最常用的功能

set smartindent                     "开启缩进功能
set smarttab

set guioptions-=b      "隐藏底部滚动条
set guioptions-=R      "隐藏右边滚动条
set guioptions-=r
set guioptions-=l       "隐藏左边滚动条
set guioptions-=L        
set guioptions-=m       "隐藏菜单栏
set guioptions-=T       "隐藏工具栏
"设置F2切换菜单栏
function! ToggleMenuBar()
        echo "ToggleMenuBar"
        if &guioptions =~# 'm'
                set guioptions-=m
        else
                set guioptions+=m
        endif
endfunction
imap <silent> <F11> :call ToggleMenuBar()<CR>
map <silent> <F11> :call ToggleMenuBar()<CR>

let g:netrw_winsize = 30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR FONT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running") || has("gui_macvim")
        colorscheme molokai
        let g:colors_name="molokai"        "blackboard,yytextmate,molokai
else
        colorscheme molokai
endif

set guifontwide=微软雅黑\ 11
set guifont=Liberation\ Mono\ 11 "set guifont=DejaVu\ Sans\ Mono\ 11   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeIgnore=['\.o$','\.bak$']  "隐藏.o，.bak文件
let NERDTreeWinPos='left'
imap <silent> <F4> <esc>:NERDTreeToggle<CR>
nmap <silent> <F4> :NERDTreeToggle<CR>

let NERDTreeWinSize = 28  "NERD 宽度
let NERDTreeShowBookmarks=1
let NERDChristmasTree=1
let NERDTreeAutoCenter=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ConqueTermVSpilt bash
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap <silent> <F12> <esc>:ConqueTermVSplit bash<CR>
nmap <silent> <F12> :ConqueTermVSplit bash<CR>


""""""""""""""""""""""""""""""
" Tlist setting
""""""""""""""""""""""""""""""

let Tlist_Ctags_Cmd ='/usr/local/bin/ctags'
let Tlist_Show_One_File=1                       
let Tlist_Exit_OnlyWindow=1                  
"let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'       "加入对应的javascriptlist
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'

nmap <silent> <F7> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Cscope  setting
""""""""""""""""""""""""""""""

:set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
      set csprg=/usr/local/bin/cscope
      set csto=0
      set cst
      set nocsverb
      " add any database in current directory
      if filereadable("cscope.out")
          cs add cscope.out
      " else add database pointed to by environment
      elseif $CSCOPE_DB != ""
          cs add $CSCOPE_DB
      endif
      set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims = 1                      "ALT+/
let NERDCompactSexyComs=1   " 多行注释时样子更好看

map <M-/> <Plug>NERDCommenterToggle
imap <M-/> <C-O><Plug>NERDCommenterToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:SuperTabRetainCompletionType = 2            

""""""""""""""""""""""""""""""
" Rails setting
""""""""""""""""""""""""""""""
"map <C-q> :mksession! ~/.vim/.session <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

""""""""""""""""""""""""""""""
" NeoComplCache setting
""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0                " Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1    " Use smartcase.
let g:neocomplcache_enable_smart_case = 1    " Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1 " Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1   " Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
" Plugin key-mappings.   
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

""""""""""""""""""""""""""""""
" Grep setting
""""""""""""""""""""""""""""""

nnoremap <silent> <F6> :Rgrep<CR>

""""""""""""""""""""""""""""""
" FuzzyFinder setting
""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :FufFile<CR>
let g:fuf_previewHeight=0
set tags=tags    
set autochdir



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
let g:xml_use_xhtml = 1 "for xml.vim

" for AutoComplPop
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails_proactive = 1
" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

autocmd FileType ruby set expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"autocmd! bufwritepost .vimrc source ~/.vimrc    "让.vimrc每次编辑保存后自动生效，避免重启

"autocmd BufNewFile,BufRead,BufEnter,WinEnter,FileType *.html,*.htm colorscheme delek     "不同文件类型显示不同的配色


filetype on
au BufNewFile,BufRead *.as set filetype=actionscript
au BufReadCmd *.jar,*.xpi,*.egg call zip#Browse(expand("<amatch>"))
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set foldmethod=marker
autocmd FileType python filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4

""""""""""""""""""""""""""""""
" javascriptlint setting
""""""""""""""""""""""""""""""
nnoremap <F8> :JSLintUpdate<CR>

""""""""""""""""""""""""""""""
" Gundo setting
""""""""""""""""""""""""""""""
nnoremap <F9> :GundoToggle<CR>

