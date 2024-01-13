# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

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




