#!/bin/bash

PS1="\[\e[0;34m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;34m\]\$ \[\e[m\]\[\e[0;34m\]"

export BUILD_MAC_SDK_EXPERIMENTAL=1

export android=/Volumes/android
export aosp=$android/aosp
export doc=$android/doc
export tool=$android/tool

alias lunch.android-4.2.1_r1='cd $aosp/android-4.2.1_r1 && . build/envsetup.sh && lunch full-eng && source.devsetup'

export adt_bundle_mac=/Applications/adt-bundle-mac
export sdk=$adt_bundle_mac/sdk
export skindir=$sdk/platforms/android-16/skins
sdcard=~/.android/sdcard.img
keyset=~/.android/default.keyset
emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -memory 1024 -gpu on -camera-front webcam0"
#emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -keyset $keyset -memory 1024 -gpu on -camera-front webcam0"
alias ls.skins='l $skindir'
alias emulator.build='$emulator_cmd_common'
alias emulator.build.skin='$emulator_cmd_common -skindir $skindir -skin '

alias make.ctags='ctags -B -F -R --exclude="^out"'
alias make.cscope='$envsetup/makecscope.sh'
alias make.filelist='rm filelist'
alias make.allDBs='make.ctags; make.cscope; make.filelist'

function alias.function() {
  local T=~/.envsetup
  local A=""
  for i in `cat $T/macosx/devsetup.sh | sed -n "/^function /s/function \([a-z_.]*\).*/\1/p" | sort`; do
    A="$A $i"
  done
  echo "all function : $A"
}

function DEBUG_echo()
{
  #echo $@
  echo $@ 1>/dev/null
}

function ls.so.needed()
{
  local Target=`echo $@ | sed -e "s/^.*\///"`
  local T=$OUT/system
  local FullPath=`find $T -name $Target`
  DEBUG_echo "FullPath: $FullPath"
  for i in `find $T -name $Target`; do
  DEBUG_echo "i: $i"
    $ANDROID_TOOLCHAIN/arm-linux-androideabi-readelf -Wa $i 2>/dev/null | grep NEEDED | sed -e "s/^.*library: / /" | sort
  done
}

function ls.component.owners()
{
  local Target=`echo $@ | sed -e "s/^.*\///"`
  local T=$OUT/system
  local Tbin=$T/bin
  local Tlib=$T/lib
  local AllBinaries=`find $Tbin -type f`
  local AllLibraries=`find $Tlib -name "*.so"`
  DEBUG_echo "check AllBinaries"
  for i in $AllBinaries; do
    DEBUG_echo "i: $i"
    result=`ls.so.needed $i | grep $Target`
    if [ $? == 0 ]; then
      echo $i | sed -e "s/^.*system/ system/"
    fi
  done
  DEBUG_echo "check AllLibraries"
  for i in $AllLibraries; do
    DEBUG_echo "i: $i"
    result=`ls.so.needed $i | grep $Target`
    if [ $? == 0 ]; then
      echo $i | sed -e "s/^.*system/ system/"
    fi
  done
}

function ls.component.relation()
{
  echo ""
  echo "*** Owners of the component $@"
  ls.component.owners $@
  echo ""
  echo "*** Component $@ needs shared libraries below..."
  ls.so.needed $@
  echo ""
}

echo ~/.envsetup/$os/devsetup.sh sourced!!!
