# dotfiles installation

PWD=$(shell pwd)

install: install-vim install-i3 install-git install-zsh \
		 install-bash install-misc install-csh \
		 install-vimperator install-pentadactyl \
		 install-tmux

install-vim:
	rm -rf ~/.vim
	ln -sf "$(PWD)/vim/vimrc" ~/.vimrc
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/chriskempson/base16-vim.git ~/.vim/bundle/base16-vim
	vim +PluginInstall +qall

install-i3:
	rm -rf ~/.i3
	ln -sf "$(PWD)/i3" ~/.i3

install-git:
	ln -sf "$(PWD)/git/gitconfig" ~/.gitconfig

install-zsh:
	rm -rf ~/.zgen
	ln -sf "$(PWD)/zsh/zshrc" ~/.zshrc
	git clone https://github.com/tarjoilija/zgen ~/.zgen
	zsh -i -c exit

install-bash:
	ln -sf "$(PWD)/bash/bashrc" ~/.bashrc
	ln -sf "$(PWD)/bash/bash_git" ~/.bash_git

install-misc:
	ln -sf "$(PWD)/Xdefaults" ~/.Xdefaults
	ln -sf "$(PWD)/Xmodmap" ~/.Xmodmap
	ln -sf "$(PWD)/inputrc" ~/.inputrc

install-csh:
	ln -sf "$(PWD)/csh/cshrc" ~/.cshrc

install-vimperator:
	test -d ~/.vimperator || mkdir ~/.vimperator
	ln -sf "$(PWD)/vimperator/vimperatorrc" ~/.vimperatorrc

install-pentadactyl:
	test -d ~/.pentadactyl || mkdir ~/.pentadactyl
	ln -sf "$(PWD)/pentadactyl/pentadactylrc" ~/.pentadactylrc

install-tmux:
	ln -sf "$(PWD)/tmux/tmux.conf" ~/.tmux.conf
