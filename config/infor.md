## Install Vim Plugin Package to obtain :PluginInstall
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Vim Configuration:
~/.vimrc

## Coc Installation
1. Make sure you have nodeJS ≥ 8.0, or else download it via the command below.
curl -sL install-node.now.sh | sh
2. Install yarn.
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
3. Create directory for COC’s installation.
mkdir ~/.vim/pack/coc/start
4. Clone COC’s repo.
cd ~/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git --depth=1
add coc extension (language server):
5. Open Vim
6. :CocInstall coc-[extension]

Coc configuration:
:CocConfig

install yarn:
brew install yarn

colorscheme:
:colorscheme Crl + D

## Coc-ccls (should not install this)
ccls: cannot find extentions.js - at Pipe.<anonymous>
1. make symbolic links:
cd /Users/minhanh/.config/coc/extensions/node_modules/coc-ccls
ln -s /Users/minhanh/.config/coc/extensions/node_modules/coc-ccls/lib lib

watchman: permission denied
cd ~/Library
sudo rm -r LaunchAgents
mkdir LaunchAgents


## colorscheme:
ttps://medium.com/@gillicarmon/create-color-scheme-for-vim-335e842e29ea

## vimrc:
https://learnvimscriptthehardway.stevelosh.com/chapters/07.html#editing-your-vimrc
