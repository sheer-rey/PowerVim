"" enable pathogen plugin manager
execute pathogen#infect()

"" turn on filetype detect and enable loading relevant plugin and indent file
filetype on
filetype plugin on
filetype indent on

"" vim built-in settings
set nocompatible                " set vim running in nocompatible mode
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " turn on autoindent
set cindent                     " turn on autoindent on for C/C++
set cinoptions=g-1              " set cindent options: indent for multi-line statements
set nobackup                    " turn off the backup file
set number                      " turn on the line number
set history=50                  " set command line history with 50 lines
set ruler                       " show the line and column number of the cursor position
set showcmd	                    " display incomplete commands at bottom right of the window
set hlsearch                    " turn on searching highlight
set incsearch                   " turn on incremental searching
set nowrap                      " turn off the line wrap while exceed window width
set langmenu=none               " set vim menu language to english(default)
set expandtab                   " use the several spaces while press <Tab> key in insert mode
set tabstop=4                   " set tab size to 4 spaces
set shiftwidth=4                " set indent size to 4 spaces
set showmatch                   " turn on matching brackets jumping
set wildmenu                    " turn on vim enhanced built-in command-line completion
set noswapfile                  " turn off the swap file
set completeopt=menuone,preview " set auto-complete properties in insert mode
set nofoldenable                " not fold any text while file was opened
set ignorecase                  " set case-insensitive in search patterns
set smartcase                   " turn on case-sensitive while upper case exist in search patterns
set mouse=nv                    " enable mouse support in normal and visual mode
set tags=tags;/                 " specify tags searching path upward to root(/)
set shortmess=atToO             " set short message types
set modeline                    " enable vim modeline
set modelines=5                 " set the count of valid vim modelines
set colorcolumn=100             " highlighting 100th coloum for auxiliary

"" vim built-in settings for character encoding
set encoding=utf-8              " set encoding for vim internal use
setglobal fileencoding=utf-8    " set global encoding for new file
set fileencodings=ucs-bom,utf-8,default,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"" define new <Leader> key and key mappings
let mapleader = ";"
" jumping to the window left
nnoremap <leader>h <C-W><C-H>
" jumping to the window right
nnoremap <leader>l <C-W><C-L>
" jumping to the window above
nnoremap <leader>k <C-W><C-K>
" jumping to the window below
nnoremap <leader>j <C-W><C-J>
" split current window and explore current file's directory
nmap <Leader>s :Sexplore<CR>
" vertical split current window and explore current file's directory
nmap <Leader>v :Vexplore<CR>


"" settings for NERDTree plugin and sub-plugins
let NERDTreeWinPos = "left"     " set NERDTree window position to left
let NERDTreeShowHidden = 1      " set NERDTree window show hidden files
" close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" key map for toggle NERDTree window
nnoremap <silent> <leader>n :NERDTreeToggle<CR> 
" set git status indicator for NERDtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?'}

"" settings for rainbow plugin
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"" settings for a.vim plugin
nmap <Leader>a :A<CR>









function OscYank()
    let text = substitute(getreg('"'), '\r\|\r\n', '\n', 'g')
    if empty(text)
        return
    endif
    let osc52_seq = system('echo ' . shellescape(text) . ' | osc_yank')
    if filewritable('/dev/fd/2') == 1
        call writefile([osc52_seq], '/dev/fd/2', 'b')
    endif
endfunction
nnoremap <Leader>oy :call OscYank()<CR>



function GitBranch()
    return system("git_branch | tr -d '()'")
endfunction







"高亮搜索关键词"
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"

let curpwd = getcwd()

" ack搜索时不打开第一个搜索文件
map <Leader>fw :Ack! <Space>
" AckFile不打开第一个搜索文件
map <Leader>ff :AckFile!<Space>


" 去除高亮
"nmap <Leader>h :noh<CR>
" align 表格对齐
nmap <Leader>t :Tab /
" 打tag
"--c++-kinds=+p  : Adds prototypes in the database for C/C++ files.
"--fields=+iaS   : Adds inheritance (i), access (a) and function
"                  signatures (S) information.
"--extra=+q      : Adds context to the tag name. Note: Without this
"                  option, the script cannot get class members.
nmap<leader>tg :!ctags -R --fields=+aS --extra=+q<CR>

" 使用TlistToggle查看文件函数列表。设置快捷键：<F12>
nnoremap  <Leader>m  :TlistToggle <CR> 
" 粘贴到系统剪切板
map <Leader>y "*y
"禁止自动改变当前Vim窗口的大小
let Tlist_Inc_Winwidth=0
"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1 
" let g:winManagerWindowLayout='FileExplorer'
" 定义快捷键 打开/关闭 winmanger
" nmap wm :WMToggle<cr>
" let g:winManagerWidth=20

" 取消补全内容以分割子窗口形式出现，只显示补全列表

"cs add $curpwd/cscope.out $curpwd/
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
set cscopequickfix=s-,c-,d-,i-,t-,e-



let cwd=""
"cs add cscope.out 


"设置winmanager窗口宽度
"let g:winManagerWidth = 30 

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif


"花括号自动格式化，首行一个tab
autocmd FileType cpp,java inoremap { {<CR>}<ESC>kA<CR>

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

autocmd InsertEnter * se cul    " 用浅色高亮当前行"

" vim-commentary style set 注释针对不同语言的注释方法
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s
" 开启语义分析
syntax enable
syntax on
" 编译快捷键
autocmd FileType python nnoremap <F1> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd FileType c nnoremap <F1> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp nnoremap <F1> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
" autocmd FileType dot nnoremap <F1> :w <bar> exec '!dot -Tsvg '.shellescape('%').' > ./svg/'.shellescape('%:r').' && open ./bin/'.shellescape('%:r')<CR>
autocmd FileType dot nnoremap <F1> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>
autocmd FileType java nnoremap <F1> :w <bar> exec '!javac '.shellescape('%'). ' -d ./bin'<CR>
autocmd FileType java nnoremap <F2> :w <bar> exec '!java -cp ./bin '.shellescape('%:r')<CR>

let g:tlist_markdown_settings = 'markdown;h:Headlins'

" shortcut for markdown
" 创建时间快捷键for markdown
nmap tm :call SetTime() <CR>
func SetTime()
        call append(line("."), "\# ".strftime('%a %d %b %Y'))
endfunc

nmap tb :call SetTable() <CR>
func SetTable()
        call append(line("."), "\| | | ")
        call append(line(".")+1, "\|---|---|")
        call append(line(".")+2, "\| | |")
endfunc

nmap pc :call SetPic() <CR>
func SetPic()
        call append(line("."), "\<img src='' width=600 alt=''> </img></div>")
endfunc

nmap pi :call SetPic1() <CR>
func SetPic1()
        call append(line("."), "\![]()")
endfunc

nmap vi :call SetVideo() <CR>
func SetVideo()
        call append(line("."), "\<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</video></div>")
endfunc

nmap cl :call SetCollor() <CR>
func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc

" vim cc
nmap cc :call SetCC() <CR>
func SetCC() 
    call append(line("."), "// vim: et tw=100 ts=4 sw=4 cc=120")  
endfunc

" 使用的背景主题
colorscheme Monokai_Gavin
" 添加自动补全字典
au FileType php setlocal dict+=~/.vim/dictionary/php_keywords_list.txt
au FileType cpp setlocal dict+=~/.vim/dictionary/cpp_keywords_list.txt
au FileType java setlocal dict+=~/.vim/dictionary/java_keywords_list.txt
" au FileType markdown setlocal dict+=~/.vim/dictionary/words.txt

" for vim-syntastic 
" disabled Syntastic by default 
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" open/close Syntastic checker
nnoremap <Leader>p :SyntasticToggleMode<CR> :w<CR>
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd BufEnter * silent! lcd %:p:h
let OmniCpp_MayCompleteDot=1    "  打开  . 操作符
let OmniCpp_MayCompleteArrow=1  " 打开 -> 操作符
let OmniCpp_MayCompleteScope=1  " 打开 :: 操作符
let OmniCpp_NamespaceSearch=1   " 打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1  " 打开显示函数原型
let OmniCpp_SelectFirstItem = 2 " 自动弹出时自动跳至第一个
autocmd BufRead scp://* :set bt=acwrite
" au FileType * setlocal dict+=~/.vim/dictionary/words.txt
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_JavaCompiler="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javac"
" for JavaComplete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <Leader>o o<Esc>

:set syntax=markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown 
" for me
func MarkdownSet() 
    let filePath=expand('%:p')
    exe ':!open ' . filePath '-a "MacDown"'
endfunc

" usage :call GenMarkdownSectionNum    给markdown 文件生成目录编号
function! GenMarkdownSectionNum()
  if &ft != "markdown"
    echohl Error
    echo "filetype is not markdown"
    echohl None
    return
  endif

  let lvl = []
  let sect = []
  let out = ""
  for i in range(1, line('$'), 1)
    let line = getline(i)
    let heading_lvl = strlen(substitute(line, '^\(#*\).*', '\1', ''))
    if heading_lvl < 2
      continue
    endif
    " there should be only 1 H1, topmost, on a conventional web page
    " we should generate section numbers begin with the first heading level 2
    if len(lvl) == 0
      if heading_lvl != 2 " count from level 2
        echohl Error
        echo "subsection must have parent section, ignore illegal heading line at line " . i
        echohl None
        continue
      endif
      call add(sect, 1)
      call add(lvl, heading_lvl)
    else
      if lvl[-1] == heading_lvl
        let sect[-1] = sect[-1] + 1
      elseif lvl[-1] > heading_lvl " pop all lvl less than heading_lvl from tail
        while len(lvl) != 0 && lvl[-1] > heading_lvl
          call remove(lvl, -1)
          call remove(sect, -1)
        endwhile
        let sect[-1] = sect[-1] + 1
      elseif lvl[-1] < heading_lvl
        if heading_lvl - lvl[-1] != 1
          echohl Error
          echo "subsection must have parent section, ignore illegal heading line at line " . i
          echohl None
          continue
        endif
        call add(sect, 1)
        call add(lvl, heading_lvl)
      endif
    endif

    let cur_sect = ""
    for j in sect
      let cur_sect = cur_sect . "." . j
    endfor
    let cur_sect = cur_sect[1:]
    let out = out . " " . cur_sect
    call setline(i, substitute(line, '^\(#\+\) \?\([0-9.]\+ \)\? *\(.*\)', '\1 ' . cur_sect . ' \3', line))
  endfor
  " echo lvl sect out
  echo out
endfunc
