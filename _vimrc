set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

syntax on enable                       " 構文に色を付ける

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
"colorscheme molokai                   " カラースキームにmolokaiを設定する
colorscheme wombat                     " カラースキームにwombatを設定する

set t_Co=256                           " iTerm2など既に256色環境なら無くても良い
" syntax enable                        " 構文に色を付ける

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8                 " 保存時の文字コード
                                       " 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 
set fileformats=unix,dos,mac           " 改行コードの自動判別. 左側が優先される
set ambiwidth=double                   " □や○文字が崩れる問題を解決


"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2                       " ステータスラインを常に表示
set showmode                           " 現在のモードを表示
set showcmd                            " 打ったコマンドをステータスラインの下に表示
set ruler                              " ステータスラインの右側にカーソルの位置を表示する

set statusline=%F                      " ファイル名表示
set statusline+=%h                     " ヘルプページなら[HELP]と表示
set statusline+=%w                     " プレビューウインドウなら[Prevew]と表示
set statusline+=%m                     " 変更チェック表示
set statusline+=%r                     " 読み込み専用かどうか表示

set statusline+=%=                     " これ以降は右寄せ表示
                                       " file encoding
set statusline+=[ENC=%{&fileencoding}] 
set statusline+=[LOW=%l/%L]            " 現在行数/全行数

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set wildmenu                           " コマンドモードの補完
set wildmode=longest:full,full         " コマンドラインの補完
set history=5000                       " 保存するコマンド履歴の数
set history=10000
set visualbell t_vb=
set noerrorbells                       "エラーメッセージの表示時にビープを鳴らさない

inoremap <ESC> <ESC>:set iminsert=1<CR>  " ESCでIMEを確実にOFF

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab                          " タブ入力を複数の空白入力に置き換える
set tabstop=4                          " 画面上でタブ文字が占める幅
set softtabstop=4                      " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent                         " 改行時に前の行のインデントを継続する
set smartindent                        " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4                       " smartindentで増減する幅

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch                          " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase                         " 検索パターンに大文字小文字を区別しない
set smartcase                          " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch                           " 検索結果をハイライト


nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESCキー2度押しでハイライトの切り替え
                                       " 「/」「?」「*」「#」が押されたらハイライトをON にしてから「/」「?」「*」「#」
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~        " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number                             " 行番号を表示
set cursorline                         " カーソルラインをハイライト
set cursorcolumn                       " 現在の行を強調表示（縦）

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start         " バックスペースキーの有効化

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch                          " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim  " Vimの「%」を拡張する

"----------------------------------------------------------
" マウスでカーソル移動とスクロール
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
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
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

let g:syntastic_enable_signs = 1       " 構文エラー行に「>>」を表示
                                       " 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1  
let g:syntastic_auto_loc_list = 0      " 構文エラーリストを非表示
let g:syntastic_check_on_open = 1      " ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_wq = 1        " 「:wq」で終了する時も構文エラーチェックする

                                       " Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']  
                                       " Javascript以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': [] }   

"----------------------------------------------------------
" netrwの設定
"----------------------------------------------------------
                         
let g:netrw_liststyle = 3              " netrwは常にtree view
                                       " CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1                   " 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_alto = 1                   " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)

"----------------------------------------------------------
" ファイル関連
"----------------------------------------------------------
set confirm                            " 保存されていないファイルがあるときは終了前に保存確認
set hidden                             " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread                           "外部でファイルに変更がされた場合は読みなおす

"----------------------------------------------------------
" VIMの固有ファイル
"----------------------------------------------------------
set directory=$HOME/.vim/swap
set undodir=$HOME/.vim/undo
set viminfo+=n$HOME/.vim/viminfo.txt
set backup                             " ファイルのバックアップを有効にする
set writebackup                        " 取得するバックアップを編集前のファイルとする(無効化する場合は「nowritebackup」)
set backupdir=$HOME/.vim/backup        " このディレクトリはあらかじめ作っておく。chmod 700 するのを忘れずに
au BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")


"autocmd VimEnter * exe 'Exp'


cd C:\WORK

