https://github.com/oh-my-fish/oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

install nerd font
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack

omf install bobthefish

omf theme bobthefish	default

fix icons on __bobthefish_glyphs:

  set -x nonzero_exit_glyph      '✘ '
  set -x superuser_glyph         '⚡ '
  set -x bg_job_glyph            '⚙ '


fix colors at __bobthefish_colors 

  set -x color_initial_segment_exit     black red --bold
  set -x color_initial_segment_su       black yellow --bold
  set -x color_initial_segment_jobs     black cyan 
  
  https://github.com/jorgebucaran/fisher
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher


# Refefences
# My Fish shell workflow for coding - by  devaslife https://www.youtube.com/watch?v=KKxhf50FIPI
