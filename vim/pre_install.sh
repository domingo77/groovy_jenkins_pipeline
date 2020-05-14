#!/usr/bin/env bash
set -o pipefail
set -ex

#sudo -A need askpass 
[[ -d  $HOME/bin ]] || mkdir -p $HOME/bin
echo '#!/usr/bin/env bash' > $HOME/bin/ssh-askpass
echo 'set -x' >> $HOME/bin/ssh-askpass
echo 'echo "1"' >> $HOME/bin/ssh-askpass
chmod 0777 $HOME/bin/ssh-askpass
cat $HOME/bin/ssh-askpass
export SUDO_ASKPASS=$HOME/bin/ssh-askpass

#create .vim/autoload .vim/bundle
[[ -d  $HOME/.vim/autoload ]] || mkdir -p $HOME/.vim/autoload
[[ -d  $HOME/.vim/bundle ]] || mkdir -p $HOME/.vim/bundle

#if no curl, install 
[[ `dpkg --status curl | grep "Status: install ok installedgljl"` ]] || sudo -A apt -y install curl

#install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# echo "call pathogen#infect()" >> $HOME/.vimrc

#install NERDTree
git clone git://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree


#install powerline
git clone git://github.com/Lokaltog/vim-powerline.git $HOME/.vim/bundle/powerline
#echo  '"powerline{' >> $HOME/.vimrc 
#echo  'set guifont=PowerlineSymbols\ for\ Powerline' >> $HOME/.vimrc
#echo  'set nocompatible' >> $HOME/.vimrc
#echo 'set t_Co=256' >> $HOME/.vimrc
#echo "let g:Powerline_symbols = 'fancy'" >> $HOME/.vimrc
#echo ' "}'  >> $HOME/.vimrc

#if no curl, install 
[[ `dpkg --status ctags | grep "Status: install ok installed"` ]] || sudo -A apt -y install ctags
