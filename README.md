#Docker Run Scripts

Helpful shell scripts to run docker containers 

##Instructions
Clone this repo to ~/.docker_run_scripts
```
git clone {address-of-this-repo} ~/.docker_run_scripts
```

Edit the environment variables in environment.sh and you can run the shell scripts directly from the .docker_run_scripts directory, or you can add the handy aliases to your shell.

## Aliases
Add the following coded aliases to start/stop docker containers on .zshrc or .bashrc
```
source ~/.docker_run_scripts/aliases
```
### To show all the aliases on the system
```
alias | grep -Ei "start_|stop_"
```