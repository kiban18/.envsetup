#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

if [[ "$envsetup" != "" ]]; then
    export PATH=$envsetup/bin:$envsetup:$PATH
fi

echo ~/.envsetup/pathsetup.sh sourced!!!
