# user Paths
set fish_user_paths $fish_user_paths  ~/.local/bin

# prompt decoration
set -g theme_display_user yes
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0
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
