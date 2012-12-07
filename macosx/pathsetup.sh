#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

if [[ "$envsetup" != "" ]]; then
    export PATH=$envsetup/bin:$envsetup:$PATH
fi

adt_bundle_mac=/Applications/adt-bundle-mac
if [[ "$adt_bundle_mac" != "" ]]; then
    export PATH=$PATH:$adt_bundle_mac/sdk/tools
    export PATH=$PATH:$adt_bundle_mac/sdk/platform-tools
    export PATH=$PATH:$adt_bundle_mac/android-ndk-r8c
fi

echo ~/.envsetup/macosx/pathsetup.sh sourced!!!
