#!/bin/bash

function digitaldatetime() {
    echo `date +"%Y%m%d%H%M%S"`
}
PowerVim=`pwd -P`
cd $HOME

printf "\033[0;35mStart to install vim-conf\033[0m\n"
printf "\033[0;36mLooking for an existing vim config...\033[0m\n"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    printf "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.`digitaldatetime`\033[0m\n"
    mv ~/.vimrc ~/.vimrc.`digitaldatetime`
fi

if [ -f ~/.ctags ] || [ -h ~/.ctags ]; then
    printf "\033[0;33mFound ~/.ctags.\033[0m \033[0;32mBacking up to ~/.ctags.`digitaldatetime`\033[0m\n"
    mv ~/.ctags ~/.ctags.`digitaldatetime`
fi

if [ -d ~/.vim ]; then
    printf "\033[0;33mFound ~/.vim.\033[0m \033[0;32mBacking up to ~/.vim.`digitaldatetime`\033[0m\n"
    mv ~/.vim ~/.vim.`digitaldatetime`
fi

printf "\033[0;36mCopying .vimrc and .vim\033[0m\n"
printf "\033[0;32mcp ${PowerVim}/.vimrc ~/.vimrc\033[0m\n"
cp ${PowerVim}/.vimrc ~/.vimrc
printf "\033[0;32mcp -r ${PowerVim}/.vim ~/.vim\033[0m\n"
cp -r  ${PowerVim}/.vim ~/.vim
printf "\033[0;32mcp ${PowerVim}/.ctags ~/.ctags\033[0m\n"
cp ${PowerVim}/.ctags ~/.ctags
 # _____                    __      ___           
 # |  __ \                   \ \    / (_)          
 # | |__) |____      _____ _ _\ \  / / _ _ __ ___  
 # |  ___/ _ \ \ /\ / / _ \ '__\ \/ / | | '_ ` _ \ 
 # | |  | (_) \ V  V /  __/ |   \  /  | | | | | | |
 # |_|   \___/ \_/\_/ \___|_|    \/   |_|_| |_| |_|)'')
printf "\033[0;35m"'  _____                    __      ___             '"\033[0m\n"
printf "\033[0;35m"'  |  __ \                   \ \    / (_)           '"\033[0m\n"
printf "\033[0;35m"'  | |__) |____      _____ _ _\ \  / / _ _ __ ___   '"\033[0m\n"
printf "\033[0;35m"'  |  ___/ _ \ \ /\ / / _ \ \__\ \/ / | |  _   _ \  '"\033[0m\n"
printf "\033[0;35m"'  | |  | (_) \ V  V /  __/ /   \  /  | | | | | | | '"\033[0m\n"
printf "\033[0;35m"'  |_|   \___/ \_/\_/ \___|_|    \/   |_|_| |_| |_| '"\033[0m\n"
printf "\n\n \033[0;35mEnjoy!.\033[0m\n"
