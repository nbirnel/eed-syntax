#!/bin/sh

cp *.vim $HOME/.vim/syntax/
echo 'autocmd BufNewFile,BufRead *.lfp setf lfp
autocmd BufNewFile,BufRead *.dii setf dii' >>$HOME/.vimrc
