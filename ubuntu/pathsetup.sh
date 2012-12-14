#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

if [[ "$TOOL_MOUNTED" != "" ]]; then
    PATH=$TOOL_MOUNTED/jdk1.6.0_33/bin:$PATH
    PATH=$PATH:$TOOL_MOUNTED/android-sdk-linux/platform-tools
    PATH=$PATH:$TOOL_MOUNTED/android-sdk-linux/tools
    PATH=$PATH:$TOOL_MOUNTED/android-ndk-r8c
    PATH=$PATH:$TOOL_MOUNTED/eclipse
    PATH=$PATH:$TOOL_MOUNTED/argouml-0.34
fi

if [[ "$ENVSETUP" != "" ]]; then
    PATH=$PATH:$ENVSETUP:$ENVSETUP/bin
fi

if [[ "$GITCORPDIR" != "" ]]; then
    PATH=$PATH:$GITCORPDIR/prebuilt/linux-x86_64/toolchain/arm-unknown-linux-gnueabi-4.5.3-glibc/bin
fi

PS1="\[\e[0;34m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;34m\]\$ \[\e[m\]\[\e[0;34m\]"

echo ~/.envsetup/$os/pathsetup.sh sourced!!!
