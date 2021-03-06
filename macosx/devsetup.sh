#!/bin/bash

PS1="\[\e[0;34m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;34m\]\$ \[\e[m\]\[\e[0;34m\]"

export BUILD_MAC_SDK_EXPERIMENTAL=1

export android=/Volumes/android
export kernel=$android/kernel
export aosp=$android/aosp
export doc=$android/doc
export tool=$android/tool

alias lunch.android-master='cd $aosp/android-master && . build/envsetup.sh && lunch full-eng && source.devsetup'
alias lunch.android-4.2.2_r1='cd $aosp/android-4.2.2_r1 && . build/envsetup.sh && lunch full-eng && source.devsetup'
alias lunch.android-2.2_r1='cd $aosp/android-2.2_r1 && . build/envsetup.sh && lunch full-eng && source.devsetup'

export adt_bundle_mac=/Applications/android/android-adt/adt21.1/adt-bundle-mac-x86_64
export sdk=$adt_bundle_mac/sdk
export skindir=$sdk/platforms/android-17/skins
sdcard=~/.android/sdcard.img
keyset=~/.android/default.keyset
emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -memory 2048 -gpu on -camera-front webcam0"
#emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -memory 1024 -gpu on -camera-front webcam0"
#emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -memory 24 -gpu on -camera-front webcam0"
#emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -keyset $keyset -memory 1024 -gpu on -camera-front webcam0"
alias ls.skins='echo $skindir; l $skindir'
alias emulator.build='$emulator_cmd_common'
alias emulator.build.skin='$emulator_cmd_common -skindir $skindir -skin '
alias emulator.build.skin.7in='$emulator_cmd_common -skindir $skindir -skin WXGA800-7in'

key_system_server_wait=kapg.debug.system_server.wait
alias emulator.build.debug.system_server='$emulator_cmd_common -prop ${key_system_server_wait}=true'
alias getprop.system_server.wait='adb shell getprop ${key_system_server_wait}'
alias setprop.system_server.wait='adb shell setprop ${key_system_server_wait} '
alias setprop.system_server.wait.false='adb shell setprop ${key_system_server_wait} false'

key_pkgname=kapg.debug.ams.pkgname
alias getprop.pkgname='adb shell getprop ${key_pkgname}'
alias setprop.pkgname.to='adb shell setprop ${key_pkgname} '

gdb_name=ln.gdb
alias ln.gdb='rm -f $gdb_name; ln -s $ANDROID_TOOLCHAIN/*gdb $gdb_name'

alias make.ctags='ctags -B -F -R --languages=C,C++,Sh,Make --exclude="^out"'
alias make.cscope='$envsetup/makecscope.sh'
alias make.filelist='rm filelist'
alias make.allDBs='make.ctags; make.cscope; make.filelist'

alias cp.userdata-4.2.2_r1='cp $aosp/android-4.2.2_r1/out/target/product/generic/userdata.img .'

alias mwithlog='time m -j8 2>&1 | tee make_m_build.log'
alias mmwithlog='time mm -j8 2>&1 | tee make_mm_build.log'
alias pushapk='$PUSHAPK_SH'
alias pushjar='$PUSHJAR_SH'
alias do_apk_at_once='mmwithlog && pushapk'
alias do_jar_at_once='mmwithlog && pushjar'

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

function ls.component.needs()
{
  local Target=`echo $@ | sed -e "s/^.*\///"`
  local T=$OUT/symbols/system
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
  local T=$OUT/symbols/system
  local Tbin=$T/bin
  local Tlib=$T/lib
  local AllBinaries=`find $Tbin -type f`
  local AllLibraries=`find $Tlib -name "*.so"`
  DEBUG_echo "check AllBinaries"
  for i in $AllBinaries; do
    DEBUG_echo "i: $i"
    result=`ls.component.needs $i | grep "\<$Target\>"`
    if [ $? == 0 ]; then
      echo $i | sed -e "s/^.*system/ system/"
    fi
  done
  DEBUG_echo "check AllLibraries"
  for i in $AllLibraries; do
    DEBUG_echo "i: $i"
    result=`ls.component.needs $i | grep "\<$Target\>"`
    if [ $? == 0 ]; then
      DEBUG_echo $i
      echo $i | sed -e "s/^.*\/system/ system/"
    fi
  done
}

function ls.component.relation()
{
  if [ $# = 1 ]; then
    echo ""
    echo "*** Owners of the component $@"
    ls.component.owners $@
    echo ""
    echo "*** Component $@ needs shared libraries below..."
    ls.component.needs $@
    echo ""
  else
    echo "function ls.component.relation"
    echo "Usage: ls.component.relation shared_library (or executable)"
    echo "    example) ls.component.relation mediaserver"
    echo "    example) ls.component.relation libaudioflinger.so"
  fi
}

echo ~/.envsetup/$os/devsetup.sh sourced!!!
