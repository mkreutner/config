""" General
filetype on          " Détection du type de fichier 
syntax on            " Coloration syntaxique
" Reopen file at last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" Formating
set tabstop=4
set shiftwidth=4
set expandtab

""" Display and Apperance
set nocompatible
set background=light
" set number
" colorscheme mkreutner-scheme
set laststatus=2
" set statusline=%<%F%=\ %m\ %t\ %y\ (%{b:git_branch}) (%{b:git_file_status})  \ [%l,%c]
set statusline=%<%F%=\ %m\ %t\ %y\ (%{b:git_branch})\ [%l,%c]

""" Functions
function Gitbranch()
    return trim(system("git branch --show-current 2>/dev/null"))
endfunction

function GitFileStatus()
    return 'test' 
    " expand('%:p')
endfunction

augroup Gitget
    autocmd!
    autocmd BufEnter * let b:git_branch = Gitbranch()
    " autocmd BufEnter * let b:git_file_status = GitFileStatus()
augroup END

""" Abbreviations
if has("autocmd")
    au FileType python iabbrev pdb@ import pdb; pdb.set_trace()
endif

""" Python settings
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set textwidth=80
autocmd FileType python set smartindent
autocmd FileType python set shiftwidth=4
autocmd FileType python map <buffer> <F2> :w<CR>:exec '! python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '! python' shellescape(@%, 1)<CR>

filetype plugin indent on
