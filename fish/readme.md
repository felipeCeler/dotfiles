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

set -g theme_color_scheme xinego

    case 'xinego*'
      set -l colorfg white
      [ "$color_scheme" = 'xinego' ]; and set colorfg black
      set -x color_initial_segment_exit     black red --bold
      set -x color_initial_segment_private  black white
      set -x color_initial_segment_su       black yellow --bold
      set -x color_initial_segment_jobs     black green --bold     

      set -x color_path                     black white
      set -x color_path_basename            black white --bold
      set -x color_path_nowrite             magenta $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           white $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_aws_vault                blue $colorfg --bold
      set -x color_aws_vault_expired        blue red --bold
      set -x color_username                 black white --bold
      set -x color_hostname                 black white
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_node                     brgreen $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold
      set -x color_nix                      brblue $colorfg --bold   

fix colors at __bobthefish_colors 
  set -x color_initial_segment_exit     black red --bold
  set -x color_initial_segment_su       black yellow --bold
  set -x color_initial_segment_jobs     black cyan 

