#!/bin/bash

# get root directory of PowerVim project
PowerVim=$(dirname $(realpath ${BASH_SOURCE[0]}))

# get current time for backup suffix
current_time=$(date +"%Y%m%d%H%M%S")

# load predefined colors
source ${PowerVim}/predefined_colors

echo -e "${font_magenta}Start to install vim-conf${font_reset}"
echo -e "${font_cyan}Looking for an existing vim config...${font_reset}"

# check and backup previous .vimrc configuration
if [ -f $HOME/.vimrc ]; then
    echo -e "${font_yellow}Found $HOME/.vimrc file, ${font_green}backing up to $HOME/.vimrc.${current_time}${font_reset}"
    mv $HOME/.vimrc $HOME/.vimrc.${current_time}
fi

# check and backup previous .ctags configuration
if [ -f $HOME/.ctags ]; then
    echo -e "${font_yellow}Found $HOME/.ctags file, ${font_green}backing up to $HOME/.ctags.${current_time}${font_reset}"
    mv $HOME/.ctags $HOME/.ctags.${current_time}
fi

# check and backup previous .vim/ configuration
if [ -d $HOME/.vim ]; then
    echo -e "${font_yellow}Found $HOME/.vim directory, ${font_green}backing up to $HOME/.vim.${current_time}${font_reset}"
    mv $HOME/.vim $HOME/.vim.${current_time}
fi

# copy vim configuration file to HOME directory
echo -e "${font_cyan}Copying vim configuration files...${font_reset}"
cp -r ${PowerVim}/.vim $HOME/.vim
cp ${PowerVim}/.vimrc $HOME/.vimrc
cp ${PowerVim}/.ctags $HOME/.ctags

# print message
echo -e "${font_magenta}  _____                    __      ___             ${font_reset}"
echo -e "${font_magenta}  |  __ \                   \ \    / (_)           ${font_reset}"
echo -e "${font_magenta}  | |__) |____      _____ _ _\ \  / / _ _ __ ___   ${font_reset}"
echo -e "${font_magenta}  |  ___/ _ \ \ /\ / / _ \ \__\ \/ / | |  _   _ \  ${font_reset}"
echo -e "${font_magenta}  | |  | (_) \ V  V /  __/ /   \  /  | | | | | | | ${font_reset}"
echo -e "${font_magenta}  |_|   \___/ \_/\_/ \___|_|    \/   |_|_| |_| |_| ${font_reset}"

echo -e "\n${font_magenta}Enjoy!${font_reset}"

