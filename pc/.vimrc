set nowrap
set number
syntax enable
set t_Co=256
set background=dark
let g:gruvbox_transp_bg = 1
colorscheme gruvbox9
au VimLeave * !echo -ne "\033[0m"
