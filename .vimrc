"inicio 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'https://github.com/ycm-core/YouCompleteMe'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'tikhomirov/vim-glsl'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'vim-python/python-syntax'

call vundle#end()            " required
filetype plugin indent on    " required 

"importante
	set backspace=indent,eol,start    		"backspace normal
	set noswapfile


"rice
	let g:airline_theme='dark'
	"sol dark
	syntax on					"syntaxe ligado 
	colorscheme ron					"esquema de cor
	set background=dark				"texto com contraste correto 
	set laststatus=2				"mostrar barra de status mesmo com apenas uma janela aberta
	let g:python_highlight_all = 1			"python

	"linha clara em baixo do curso
	"hi cursorline cterm=none ctermbg=234 term=reverse	 
	"contraste visual
	hi Visual term=reverse cterm=reverse 


"ultilidade
	set nowrap					"texto não dar newline
	set number					"numero mostrando linha atual
	set relativenumber				"numeros relativos ao ponteiro
	set showcmd					"mostrar quais teclas foram pressionadas
	set sidescrolloff=2				"ponteiro nunca fica a N caracteres perto da borda
	set scrolloff=8					"ponteiro nunca ficar a menos de N linhas perto da borda
	set cursorline					"linha debaixo do cursor


"caracteres
	set nospell
	set spelllang=en_us,pt_br			"spellcheck linguas
	set encoding=utf-8				"todos os carecteres
	set shiftwidth=2				"quantos espaços para indentar 
	set nocindent
	set smartindent
	filetype indent on

"syntastic/YCM
"let g:ycm_error_symbol = '誤' 
	"let g:syntastic_always_populate_loc_list = 1
	"let g:syntastic_auto_loc_list = 1
	"let g:syntastic_check_on_open = 1
	"let g:syntastic_check_on_wq = 0 
	let g:ycm_semantic_triggers = {
		\   'python': [ 're!\w{2}' ]
		\ }
	set completeopt-=preview
    "desligar ycm
	let g:ycm_show_diagnostics_ui = 0
    "habilitar ycm
	function Toggle_ycm()
	    if g:ycm_show_diagnostics_ui == 0
		let g:ycm_auto_trigger = 1
		let g:ycm_show_diagnostics_ui = 1
		:YcmRestartServer
		:e
		:echo "YCM on"
	    elseif g:ycm_show_diagnostics_ui == 1
		let g:ycm_auto_trigger = 0
		let g:ycm_show_diagnostics_ui = 0
		:YcmRestartServer
		:e
		:echo "YCM off"
	    endif
	endfunction
	map <F4> :call Toggle_ycm() <CR>

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"mappings
"=================================================================================


	"apagar resto da linha e editar
		map gl cL
	"copiar para linha de baixo/cima
		noremap gp :pu <CR> ==
		noremap gP :pu! <CR> == 
	"deletar/copiar linha excluindo whitespace
		nnoremap <Leader>dd _yg_"_dd
		nnoremap <Leader>yy _yg_
	"pular um bloco
		noremap { }
		noremap } {

	"newline
		noremap <CR> o<Esc>k 

	"registrador do clipboard
		noremap <leader><leader> "+
	"control V modo insert
		inoremap <C-v> <C-r>+
		
	"voltar para a ultima linha editada
		noremap gi gi<Esc> 
	"ir para primeira ou ultima linha
		"noremap gj <S-g>
		"noremap gk gg
	"descer e subir rapidão vruuum
		noremap <C-j> 5j
		noremap <C-k> 5k 
	"shift + esquerda/direito inicio/final da linha
		noremap H ^
		noremap L g_


	"pesquisar palavra em baixo do curso
		noremap gm g* 

"buffer
	"salvar e ir para arquivo em baixo do cursor
		noremap gf :write<CR>gf
	"buffer previo
		noremap <C-g> :bprev<CR> 
	"abrir esse arquivo
		noremap <F1> :edit $HOME/.vimrc <CR>
	"aplicar mudanças (sem a necessidade de reiniciar o vim)
		noremap <F2> :so $HOME/.vimrc <CR>


"janelas
	"nova janela
		noremap ss :split<CR><C-w>
		noremap sv :vsplit<CR><C-w> 
	"mover para janelas
		noremap sh <C-w>h
		noremap sk <C-w>k
		noremap sj <C-w>j
		noremap sl <C-w>l


	"salvar
		"noremap <C-s> :write<CR>
		noremap sd :quit<CR>
		"noremap SF :q!<CR>


"rodar
	"abrir Makefile 
		noremap <F3> :tab new<CR>:e Makefile<CR>
		"todo: buffer especifico
		
	"usar esse make quando erros estiverem atrapalhando
		command Make make! | cope

	"compilar aqruivo em C
		command Cmake !gcc % && ./a.out 
	"favor não por nenhum caractere depois de nenhum CR
	



	"toggle sintaxe
	    noremap <F7> :if exists("g:syntax_on") <Bar>              
		    \   syntax off <Bar>                             
		    \ else <Bar>                                     
		    \   syntax enable <Bar>                                  
		    \ endif <CR>

	"explorador de arquivo
	    nnoremap <leader>n :NERDTreeFocus<CR> 
	"colapsar funcao
	    noremap <F8> va{zf

	    inoremap <C-p> <C-r>"
	    noremap * *N
	    vnoremap * "+y/<C-r>"<CR>N
	    map g8 *maciw
	    vmap g8 *maciw

	    vnoremap G[ c[]<ESC>P
	    vnoremap G( c()<ESC>P
	    vnoremap G{ c{}<ESC>P

	    vnoremap <C-a> c<C-a><esc>

	    noremap tt :!urxvt &<CR><CR>

	"mover cursor pro parentesis final
	    nmap ) va(<ESC><ESC>
	"mover cursor pro parentesis inicial
	    nmap ( va(o<ESC><ESC>

	    "noremap )I )a
	    "noremap )i )i 
	    "noremap (a ()i
	    "noremap (o va(<ESC><ESC>a<C-j>


