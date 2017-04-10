# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc


# set PATH so it includes user's private bin if it exists
PATH=$PATH:~/Application/bin

function _update_ps1() {
	PS1="$(~/LipStick/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
	ROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
