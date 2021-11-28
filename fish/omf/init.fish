## USER PATH ##
set VULKAN_SDK /media/frontier/development/vulkan-sdk/vulkansdk-linux-x86_64-1.2.189.0/1.2.189.0/x86_64
set VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d

set fish_user_paths $fish_user_paths  ~/.local/bin

set -gx PATH /media/frontier/applications/linux/protobuf-git/bin $VULKAN_SDK/bin $PATH
set -Ux LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH


### PROMPT DECORATION ###
set -g theme_display_user yes
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type


# from bobthefish theme
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes


### ABBRIVIATIONS ###
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
abbr ggl 'git log'

### ALIASES ###

alias rm='echo "This is not the command you are looking for."; false'

# @see https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/fish/config.fish
# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "


# Then override everything you want!
# Note that these must be defined with `set -x`
set -g color_initial_segment_exit     black red --bold
set -g color_initial_segment_su       black yellow --bold
set -g color_initial_segment_jobs     black cyan 

set -x color_path                     black white
set -x color_path_basename            black white --bold
set -x color_path_nowrite             magenta black
set -x color_path_nowrite_basename    magenta black --bold

set -x color_repo                     green black
set -x color_repo_work_tree           black black --bold
set -x color_repo_dirty               brred black
set -x color_repo_staged              yellow black

set -x color_vi_mode_default          brblue black --bold
set -x color_vi_mode_insert           brgreen black --bold
set -x color_vi_mode_visual           bryellow black --bold

set -x color_vagrant                  brcyan black
set -x color_k8s                      magenta white --bold
set -x color_username                 444444 BCBCBC --bold
set -x color_hostname                 white black
set -x color_rvm                      brmagenta black --bold
set -x color_virtualfish              brblue black --bold
set -x color_virtualgo                brblue black --bold
set -x color_desk                     brblue black --bold

