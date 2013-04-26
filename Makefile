dist ::
	zip -r textpad-eed-syntax.zip textpad/INSTALL.txt textpad/config \
	textpad/screenshots textpad/install.exe textpad/src/*.syn

push ::
	scp textpad-eed-syntax.zip noah@www.birnel.org:~/birnel.org/birnel.org/~noah/software/textpad-eed-syntax
