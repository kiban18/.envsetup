#!/bin/bash

PS1="\[\e[0;34m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;34m\]\$ \[\e[m\]\[\e[0;34m\]"

export BUILD_MAC_SDK_EXPERIMENTAL=1

export android=/Volumes/android
export aosp=$android/aosp
export doc=$android/doc
export tool=$android/tool

alias lunch.android-4.2.1_r1='cd $aosp/android-4.2.1_r1 && . build/envsetup.sh && lunch full-eng'

export adt_bundle_mac=/Applications/adt-bundle-mac
export sdk=$adt_bundle_mac/sdk
export skindir=$sdk/platforms/android-16/skins
alias ls.skins='l $skindir'
alias emulator.build='emulator -sysdir $OUT -data $OUT/userdata.img -skindir $skindir'

echo ~/.envsetup/devsetup.sh sourced!!!
