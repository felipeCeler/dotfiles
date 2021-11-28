# Path to your oh-my-fish configuration.
set -g OMF_CONFIG $HOME/dotfiles/fish/omf

set --export EDITOR "vim"

# user Paths
set VULKAN_SDK /media/frontier/development/vulkan-sdk/vulkansdk-linux-x86_64-1.2.189.0/1.2.189.0/x86_64
set VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d

set fish_user_paths $fish_user_paths  ~/.local/bin
set -gx PATH /media/frontier/applications/linux/protobuf-git/bin $VULKAN_SDK/bin $PATH
set -Ux LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH


# prompt decoration
set -g theme_display_user yes
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0

# from bobthefish theme
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes


# set of abbriviations
# portage
abbr ew 'emerge -auDN @world --exclude="debian-sources"'
abbr ed 'emerge --depclean'
abbr ec 'emerge -C'
abbr es 'ego sync'
# git
abbr ggm 'git push origin master'
abbr ggp 'git pull origin master'
abbr ggs 'git status'
abbr ggc 'git commit'
abbr gga 'git add'
#Alias
alias rm='echo "This is not the command you are looking for."; false'
