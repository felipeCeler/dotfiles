# Path to your oh-my-fish configuration.
set -gx OMF_CONFIG "$HOME/dotfiles/fish/omf"
set -gx OMF_PATH "$HOME/dotfiles/fish/omf"

set --export EDITOR "vim"

switch (uname)
  case Linux
    source $OMF_PATH/init-linux.fish
  case Darwin
    echo "mac ?"
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end




