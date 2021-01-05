# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#alias mywatch="while [ 1 ] ; do sudo netstat -tepan|sort|grep -e 6225 -e 612 --color=auto; echo -n \"***** \"; date; sleep 2; done"
alias mywatch="while [ 1 ] ; do sudo netstat -tpan|grep -i -e esta -e listen --color=auto|grep  -e 6225 -e 612|awk '{print \$6,\"\t\"\$7,\"\t\"\$4,\"\t\"\$5}'|sort; echo -n \"***** \"; date; sleep 2; done"

export PS1="\[\033[0;31m\]YOUR_SERVER_ID(`dig +short myip.opendns.com @resolver1.opendns.com`)-\[\033[0;32m\]\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
echo "***"
sensors
echo "***"
vnstat -d
echo "***"
ps -A|grep v2
echo "***"
ls -al
echo "***"
