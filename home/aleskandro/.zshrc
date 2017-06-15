# azzoppati {{{
[ -s "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh" ] && source "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh"
# }}}
#
#PATH=/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/home/aleskandrox/Android/Sdk/platform-tools:/home/aleskandrox/Android/Sdk/tools:/home/aleskandro/Android/android-ndk-r10e:/home/aleskandrox/.local/bin:/opt/android-studio/bin
#NDKROOT=/home/aleskandro/Android/android-ndk-r10e
#eval `keychain --eval ~/.ssh/id_rsa`
# vim: ft=zsh sts=2 ts=2 sw=2 et fdm=marker fmr={{{,}}
#
#eval `keychain --eval id_rsa`
#SSH_AUTH_SOCK=/home/aleskandro/.ssh/agent.sock; export SSH_AUTH_SOCK;
#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_SCALE_FACTOR=0
#export QT_SCREEN_SCALE_FACTORS=0
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

#export QT_QPA_PLATFORM=wayland

setopt PROMPT_SUBST;
export PS1_BASE=$PS1

function set_git_ps1() 
{
    PROMPT="$(git_super_status)$PROMPT_BASE"
}

source /usr/local/bin/zsh-git-prompt/zshrc.sh
PROMPT_BASE=$PROMPT
#PROMPT="$(git_super_status)$PROMPT"
add-zsh-hook precmd set_git_ps1 

# NVM
#NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/5.4.0
