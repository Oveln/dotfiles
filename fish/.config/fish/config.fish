if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR helix
# proxy
switch $hostname
    case Oveln-PC
        # conda
        # source /home/oveln/miniconda3/etc/fish/conf.d/conda.fish
        # set -x PATH /home/oveln/miniconda3/bin $PATH

        # riscv-gdb
        set -x PATH /home/oveln/software/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin:$PATH

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

# qemu-7.0.0
# set -x PATH /home/oveln/software/qemu-7.0.0/build:$PATH

# qemu-9.0.0
set -x PATH /home/oveln/software/qemu-9.0.0/build:$PATH

# Created by `pipx` on 2024-03-27 06:30:41
# set PATH $PATH /home/oveln/.local/bin

set fish_greeting "Hello,this is $hostname.
Welcome to Oveln shell."

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/oveln/miniconda3/bin/conda
    eval /home/oveln/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/oveln/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/oveln/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/oveln/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
