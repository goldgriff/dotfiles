"set encoding=utf-8 �@�������������ŃR�����g�A�E�g
scriptencoding utf-8
set fileencoding=utf-8 " �ۑ����̕����R�[�h
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " �ǂݍ��ݎ��̕����R�[�h�̎�������. �������D�悳���
set fileformats=unix,dos,mac " ���s�R�[�h�̎�������. �������D�悳���
set ambiwidth=double " ���⁛������������������
set expandtab " �^�u���͂𕡐��̋󔒓��͂ɒu��������
set tabstop=4 " ��ʏ�Ń^�u��������߂镝
set softtabstop=4 " �A�������󔒂ɑ΂��ă^�u�L�[��o�b�N�X�y�[�X�L�[�ŃJ�[�\����������
set autoindent " ���s���ɑO�̍s�̃C���f���g���p������
set smartindent " ���s���ɑO�̍s�̍\�����`�F�b�N�����̍s�̃C���f���g�𑝌�����
set shiftwidth=4 " smartindent�ő������镝
set incsearch " �C���N�������^���T�[�`. �P�������͖��Ɍ������s��
set ignorecase " �����p�^�[���ɑ啶������������ʂ��Ȃ�
set smartcase " �����p�^�[���ɑ啶�����܂�ł�����啶������������ʂ���
set hlsearch " �������ʂ��n�C���C�g

" ESC�L�[2�x�����Ńn�C���C�g�̐؂�ւ�
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set whichwrap=b,s,h,l,<,>,[,],~ " �J�[�\���̍��E�ړ��ōs�����玟�̍s�̍s���ւ̈ړ����\�ɂȂ�
set number " �s�ԍ���\��
" set cursorline " �J�[�\�����C�����n�C���C�g

" �s���܂�Ԃ��\������Ă����ꍇ�A�s�P�ʂł͂Ȃ��\���s�P�ʂŃJ�[�\�����ړ�����
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" �o�b�N�X�y�[�X�L�[�̗L����
set backspace=indent,eol,start

set showmatch " ���ʂ̑Ή��֌W����u�\������
source $VIMRUNTIME/macros/matchit.vim " Vim�́u%�v���g����

set wildmenu " �R�}���h���[�h�̕⊮
set history=5000 " �ۑ�����R�}���h�����̐�

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" snippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" dein�p�X�ݒ�
let s:dein_dir = fnamemodify('~/.vim/dein/', ':p') "<-���D���ȏꏊ
let s:dein_repo_dir = s:dein_dir . 'dein' "<-�Œ�

" dein.vim�{�̂̑��݃`�F�b�N�ƃC���X�g�[��
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim�{�̂������^�C���p�X�ɒǉ�
if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/neosnippet-snippets')



" �K�{
call dein#end()
filetype plugin indent on
syntax enable

" �v���O�C���̃C���X�g�[��
if dein#check_install()
  call dein#install()
endif

