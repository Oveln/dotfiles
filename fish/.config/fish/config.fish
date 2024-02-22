if status is-interactive
    # Commands to run in interactive sessions can go here
end

# proxy
set -x http_proxy http://172.17.16.1:7890
set -x https_proxy $http_proxy

# bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH

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
