# dotfiles

The .shell_aliases file is barely noteworthy. Just a few aliases

The .shell_functions file has stuff in it, some might consider useful.
Like everything I do, it is somewhat overly reliant on fzf.

For Beginners:

add to your .bashrc or .zshrc (the functions/aliases work in both):

if [ -e $HOME/.shell_functions ]; then

source $HOME/.shell_functions
        
fi

for this to work, the file has to be in your ~/ directory.

for the aliases file, just do the same. replace .shell_functions with .shell_aliases obvoiusly.

