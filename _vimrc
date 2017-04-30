set encoding=utf-8
scriptencoding utf-8
" ��1�s�ڂ͓ǂݍ��ݎ��̕����R�[�h�̐ݒ�
" ��2�s�ڂ�Vim Script���Ń}���`�o�C�g���g���ꍇ�̐ݒ�
" Vim scritpt��vimrc���܂܂��̂ŁA���{��ŃR�����g�������ꍇ�͐擪�ɂ��̐ݒ肪�K�v�ɂȂ�

syntax on enable                       " �\���ɐF��t����

"----------------------------------------------------------
" �J���[�X�L�[��
"----------------------------------------------------------
"colorscheme molokai                   " �J���[�X�L�[����molokai��ݒ肷��
colorscheme wombat                     " �J���[�X�L�[����wombat��ݒ肷��

set t_Co=256                           " iTerm2�ȂǊ���256�F���Ȃ疳���Ă��ǂ�
" syntax enable                        " �\���ɐF��t����

"----------------------------------------------------------
" ����
"----------------------------------------------------------
set fileencoding=utf-8                 " �ۑ����̕����R�[�h
                                       " �ǂݍ��ݎ��̕����R�[�h�̎�������. �������D�悳���
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 
set fileformats=unix,dos,mac           " ���s�R�[�h�̎�������. �������D�悳���
set ambiwidth=double                   " ���⁛������������������


"----------------------------------------------------------
" �X�e�[�^�X���C��
"----------------------------------------------------------
set laststatus=2                       " �X�e�[�^�X���C������ɕ\��
set showmode                           " ���݂̃��[�h��\��
set showcmd                            " �ł����R�}���h���X�e�[�^�X���C���̉��ɕ\��
set ruler                              " �X�e�[�^�X���C���̉E���ɃJ�[�\���̈ʒu��\������

set statusline=%F                      " �t�@�C�����\��
set statusline+=%h                     " �w���v�y�[�W�Ȃ�[HELP]�ƕ\��
set statusline+=%w                     " �v���r���[�E�C���h�E�Ȃ�[Prevew]�ƕ\��
set statusline+=%m                     " �ύX�`�F�b�N�\��
set statusline+=%r                     " �ǂݍ��ݐ�p���ǂ����\��

set statusline+=%=                     " ����ȍ~�͉E�񂹕\��
                                       " file encoding
set statusline+=[ENC=%{&fileencoding}] 
set statusline+=[LOW=%l/%L]            " ���ݍs��/�S�s��

"----------------------------------------------------------
" �R�}���h���[�h
"----------------------------------------------------------
set wildmenu                           " �R�}���h���[�h�̕⊮
set wildmode=longest:full,full         " �R�}���h���C���̕⊮
set history=5000                       " �ۑ�����R�}���h�����̐�
set history=10000
set visualbell t_vb=
set noerrorbells                       "�G���[���b�Z�[�W�̕\�����Ƀr�[�v��炳�Ȃ�

inoremap <ESC> <ESC>:set iminsert=1<CR>  " ESC��IME���m����OFF

"----------------------------------------------------------
" �^�u�E�C���f���g
"----------------------------------------------------------
set expandtab                          " �^�u���͂𕡐��̋󔒓��͂ɒu��������
set tabstop=4                          " ��ʏ�Ń^�u��������߂镝
set softtabstop=4                      " �A�������󔒂ɑ΂��ă^�u�L�[��o�b�N�X�y�[�X�L�[�ŃJ�[�\����������
set autoindent                         " ���s���ɑO�̍s�̃C���f���g���p������
set smartindent                        " ���s���ɑO�̍s�̍\�����`�F�b�N�����̍s�̃C���f���g�𑝌�����
set shiftwidth=4                       " smartindent�ő������镝

"----------------------------------------------------------
" �����񌟍�
"----------------------------------------------------------
set incsearch                          " �C���N�������^���T�[�`. �P�������͖��Ɍ������s��
set ignorecase                         " �����p�^�[���ɑ啶������������ʂ��Ȃ�
set smartcase                          " �����p�^�[���ɑ啶�����܂�ł�����啶������������ʂ���
set hlsearch                           " �������ʂ��n�C���C�g


nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESC�L�[2�x�����Ńn�C���C�g�̐؂�ւ�
                                       " �u/�v�u?�v�u*�v�u#�v�������ꂽ��n�C���C�g��ON �ɂ��Ă���u/�v�u?�v�u*�v�u#�v
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"----------------------------------------------------------
" �J�[�\��
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~        " �J�[�\���̍��E�ړ��ōs�����玟�̍s�̍s���ւ̈ړ����\�ɂȂ�
set number                             " �s�ԍ���\��
set cursorline                         " �J�[�\�����C�����n�C���C�g
set cursorcolumn                       " ���݂̍s�������\���i�c�j

" �s���܂�Ԃ��\������Ă����ꍇ�A�s�P�ʂł͂Ȃ��\���s�P�ʂŃJ�[�\�����ړ�����
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start         " �o�b�N�X�y�[�X�L�[�̗L����

"----------------------------------------------------------
" �J�b�R�E�^�O�̑Ή�
"----------------------------------------------------------
set showmatch                          " ���ʂ̑Ή��֌W����u�\������
source $VIMRUNTIME/macros/matchit.vim  " Vim�́u%�v���g������

"----------------------------------------------------------
" �}�E�X�ŃJ�[�\���ړ��ƃX�N���[��
"----------------------------------------------------------
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

"----------------------------------------------------------
" �N���b�v�{�[�h����̃y�[�X�g
"----------------------------------------------------------
" �}�����[�h�ŃN���b�v�{�[�h����y�[�X�g���鎞�Ɏ����ŃC���f���g�����Ȃ��悤�ɂ���
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

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------

let g:syntastic_enable_signs = 1       " �\���G���[�s�Ɂu>>�v��\��
                                       " ����Vim�v���O�C���Ƌ�������̂�h��
let g:syntastic_always_populate_loc_list = 1  
let g:syntastic_auto_loc_list = 0      " �\���G���[���X�g���\��
let g:syntastic_check_on_open = 1      " �t�@�C�����J�������ɍ\���G���[�`�F�b�N�����s����
let g:syntastic_check_on_wq = 1        " �u:wq�v�ŏI�����鎞���\���G���[�`�F�b�N����

                                       " Javascript�p. �\���G���[�`�F�b�N��ESLint���g�p
let g:syntastic_javascript_checkers=['eslint']  
                                       " Javascript�ȊO�͍\���G���[�`�F�b�N�����Ȃ�
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': [] }   

"----------------------------------------------------------
" netrw�̐ݒ�
"----------------------------------------------------------
                         
let g:netrw_liststyle = 3              " netrw�͏��tree view
                                       " CVS��.�Ŏn�܂�t�@�C���͕\�����Ȃ�
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1                   " 'v'�Ńt�@�C�����J���Ƃ��͉E���ɊJ���B(�f�t�H���g�������Ȃ̂œ���ւ�)
let g:netrw_alto = 1                   " 'o'�Ńt�@�C�����J���Ƃ��͉����ɊJ���B(�f�t�H���g���㑤�Ȃ̂œ���ւ�)

"----------------------------------------------------------
" �t�@�C���֘A
"----------------------------------------------------------
set confirm                            " �ۑ�����Ă��Ȃ��t�@�C��������Ƃ��͏I���O�ɕۑ��m�F
set hidden                             " �ۑ�����Ă��Ȃ��t�@�C��������Ƃ��ł��ʂ̃t�@�C�����J�����Ƃ��o����
set autoread                           "�O���Ńt�@�C���ɕύX�����ꂽ�ꍇ�͓ǂ݂Ȃ���

"----------------------------------------------------------
" VIM�̌ŗL�t�@�C��
"----------------------------------------------------------
set directory=$HOME/.vim/swap
set undodir=$HOME/.vim/undo
set viminfo+=n$HOME/.vim/viminfo.txt
set backup                             " �t�@�C���̃o�b�N�A�b�v��L���ɂ���
set writebackup                        " �擾����o�b�N�A�b�v��ҏW�O�̃t�@�C���Ƃ���(����������ꍇ�́unowritebackup�v)
set backupdir=$HOME/.vim/backup        " ���̃f�B���N�g���͂��炩���ߍ���Ă����Bchmod 700 ����̂�Y�ꂸ��
au BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")


"autocmd VimEnter * exe 'Exp'


cd C:\WORK

