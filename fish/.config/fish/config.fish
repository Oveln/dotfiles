if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR nvim
# proxy
switch $hostname
    case Oveln-PC
        # conda
        source /home/oveln/miniconda3/etc/fish/conf.d/conda.fish
        set -x PATH /home/oveln/miniconda3/bin $PATH

        set -x proxy_url http://172.27.192.1:7890
    case Oveln-Laptop
        set -x proxy_url http://localhost:7890
        if status is-interactive
            set LANG "en_US.UTF-8"
            set LANGUAGE en_US
        end
end
set -x http_proxy $proxy_url
set -x https_proxy $http_proxy

# man
set -x MANPATH /usr/share/man

# rust
set -x PATH /home/oveln/.cargo/bin/ $PATH

# brew
set -x HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set -x HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
set -x HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
# what is it?
#set -x PATH "/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
set -x PATH "/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin" $PATH
#set -x MANPATH "/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
set -x MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
#set -x INFOPATH "/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
set -x INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

# mason
# set -x PATH /home/oveln/.local/share/nvim/mason/bin $PATH

# deno
set -x DENO_INSTALL "/home/oveln/.deno"
set -x PATH "$DENO_INSTALL/bin" $PATH
function ll
    ls -lh $argv
end

function cls
    clear $argv
end

alias vi="nvim"
alias lgit="lazygit"
alias jo="joshuto"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Created by `pipx` on 2024-03-27 06:30:41
set PATH $PATH /home/oveln/.local/bin

set fish_greeting "Hello,this is $hostname.
Welcome to Oveln shell."
