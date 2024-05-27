# Some extra options for the ls command.
export LS_OPTIONS='-F --color=auto'
alias ls='ls $LS_OPTIONS'

# This will make bash check the window size after each command and, if
# necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
