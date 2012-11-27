if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

envsetup=~/.envsetup/envsetup.sh
if [ -f $envsetup ]; then
    . $envsetup
fi

devsetup=~/.envsetup/devsetup.sh
if [ -f $devsetup ]; then
    . $devsetup
fi

pathsetup=~/.envsetup/pathsetup.sh
if [ -f $pathsetup ]; then
    . $pathsetup
fi
