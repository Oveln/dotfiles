if status is-interactive
    # Commands to run in interactive sessions can go here
end

set LANG en_US
set EDITOR nvim
# proxy
switch $hostname
    case Oveln-PC
        set -x proxy_url http://172.27.192.1:7890
    case Oveln-Laptop
	set -x proxy_url http://localhost:7890
end
set -x http_proxy $proxy_url
set -x https_proxy $http_proxy

# rust
set -x PATH /home/oveln/.cargo/bin/ $PATH

# brew
set -x HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
set -x HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
set -x HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
# what is it?
#set -x PATH "/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
set -x PATH "/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin" $PATH
#set -x MANPATH "/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
set -x MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
#set -x INFOPATH "/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
set -x INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

# mason
set -x PATH /home/oveln/.local/share/nvim/mason/bin $PATH

function ll
    ls -lh $argv
end

function cls
    clear $argv
end

alias vi="nvim"
alias lgit="lazygit"
alias jo="joshuto"
