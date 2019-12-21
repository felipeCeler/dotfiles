# prompt decoration
set -g theme_display_user yes
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0

# set of abbriviations
# portage
abbr ew 'emerge -auDN @world --exclude="debian-sources"'
abbr ed 'emerge --depclean'
# git
abbr gm 'git push origin master'
abbr gp 'git pull origin master'
abbr gs 'git status'
abbr gc 'git commit'
abbr ga 'git add'