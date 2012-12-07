#!/bin/bash

export ADBHOST=172.30.117.88
export ADBHOSTPORT=$ADBHOST:5555

export HOME_MOUNTED=/usr/local/google/home/kihwanl
export WORK_MOUNTED=$HOME_MOUNTED/work2
export ENVSETUP=~/.envsetup

export TOOL_MOUNTED=$WORK_MOUNTED/tool
export SOURCEDIR=$WORK_MOUNTED/source

export ANDROIDDIR=$SOURCEDIR/android
export GOOGLETVDIR=$SOURCEDIR/googletv
export GITCORPDIR=$GOOGLETVDIR/gitcorp
export GITV2DOT1DIR=$GOOGLETVDIR/gitv2.1
export GITV3DOT0DIR=$GOOGLETVDIR/gitv3.0
export GITV4DOT0DIR=$GOOGLETVDIR/gitv4.0
export LGV3DOT0DIR=$GOOGLETVDIR/lgv3.0
export ANDROIDDIR=$SOURCEDIR/android
export CTSDIR=$SOURCEDIR/android-cts/android-cts-3.2_r5
export GCTSDIR=$SOURCEDIR/android-gcts/android-cts
export CTSTOOLSDIR=$CTSDIR/tools
export GCTSTOOLSDIR=$GCTSDIR/tools
export CTSREPODIR=$CTSDIR/repository
export GCTSREPODIR=$GCTSDIR/repository
export CTSTESTCASESDIR=$CTSREPODIR/testcases
export GCTSTESTCASESDIR=$GCTSREPODIR/testcases
export DEVADMIN_APK_FOR_CTS2dot3R4=$CTSTESTCASESDIR/CtsDeviceAdmin.apk
export GDEVADMIN_APK_FOR_CTS2dot3R4=$GCTSTESTCASESDIR/CtsDeviceAdmin.apk
export DELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2=$CTSTESTCASESDIR/CtsDelegatingAccessibilityService.apk
export GDELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2=$GCTSTESTCASESDIR/CtsDelegatingAccessibilityService.apk

export COLOR_PY=$ENVSETUP/coloredlogcat.py
export ENVSETUP_SH=$ENVSETUP/envsetup.sh
export SETPATH_SH=$ENVSETUP/setpath.sh
export REPEAT_SH=$ENVSETUP/repeat.sh
export ADBCON_SH=$ENVSETUP/adbcon.sh
export GDBATTACH_SH=$ENVSETUP/gdbattach.sh
export JDBATTACH_SH=$ENVSETUP/jdbattach.sh
export FINDLIB_SH=$ENVSETUP/findlib.sh
export FINDPKG_SH=$ENVSETUP/findpkg.sh
export WHICHPKG_SH=$ENVSETUP/whichpkg.sh
export FINDTEST_SH=$ENVSETUP/findtest.sh
export PUSHAPK_SH=$ENVSETUP/pushapk.sh
export PUSHJAR_SH=$ENVSETUP/pushjar.sh
export WHEREAMINOW_SH=$ENVSETUP/whereaminow.sh
export WHATAMIDOINGNOW_SH=$ENVSETUP/whatamidoingnow.sh
export GOTOWITHTHESAMEDEPTH_SH=$ENVSETUP/gotowiththesamedepth.sh
export KILLPROCESS_SH=$ENVSETUP/killprocess.sh
export MAKEWITHLOG_SH=$ENVSETUP/makewithlog.sh
export MAKEOTAWITHLOG_SH=$ENVSETUP/makeotawithlog.sh
export GTV_REINSTALL_SH=$ENVSETUP/gtv_reinstall.sh
export DO_ALL_AT_ONCE_SH=$ENVSETUP/do_all_at_once.sh

export JAVA_HOME=$TOOL_MOUNTED/jdk1.6.0_33
#export WORKSPACE=$TOOL_MOUNTED/eclipse/workspace
export ADT_BUNDLE=$TOOL_MOUNTED/adt-bundle-linux
export WORKSPACE=$ADT_BUNDLE/workspace
export CCACHE_DIR=$WORK_MOUNTED/.ccache
export ANDROID_SWT=$GITCORPDIR/prebuilt/linux-x86_64/swt
export USE_CCACHE=1
#export GDB=$GOOGLETVDIR/gitcorp_2/prebuilt/linux-x86_64/toolchain/arm-unknown-linux-gnueabi-4.5.3-glibc/bin/arm-unknown-linux-gnueabi-gdb
export GDB=$GOOGLETVDIR/gitv4.0/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-gdb

alias agdb='$GDB'

alias vijdbrc='vi $ENVSETUP/.jdbrc'
alias lngdbinit='ln -s $ENVSETUP/.gdbinit .gdbinit'
alias lnjdbrc='ln -s $ENVSETUP/.jdbrc .jdbrc'

alias cdroot='cd ../../../../..; ll'
alias cdres='cd ../../../../../res/; ll'
alias cdlayout='cd ../../../../../res/layout; ll'
alias cdwork='cd $WORK_MOUNTED'
alias cdgoogletv='cd $GOOGLETVDIR'
alias cdworkspace='cd $WORKSPACE'
alias cdcts='cd $CTSTOOLSDIR'
alias cdgcts='cd $GCTSTOOLSDIR'

alias whereaminow='$WHEREAMINOW_SH'
alias whatamidoingnow='$WHATAMIDOINGNOW_SH'
alias gotowiththesamedepth='$GOTOWITHTHESAMEDEPTH_SH'

alias gotogit='. $GOTOWITHTHESAMEDEPTH_SH gitcorp'
alias gotogit0='. $GOTOWITHTHESAMEDEPTH_SH gitcorp_0'
alias gotogit1='. $GOTOWITHTHESAMEDEPTH_SH gitcorp_1'
alias gotogit2='. $GOTOWITHTHESAMEDEPTH_SH gitcorp_2'
alias gotogit3='. $GOTOWITHTHESAMEDEPTH_SH gitcorp_3'
alias gotogitdbg='. $GOTOWITHTHESAMEDEPTH_SH gitcorp_dgb'
alias gotogitv2.1='. $GOTOWITHTHESAMEDEPTH_SH gitv2.1'
alias gotogitv3.0='. $GOTOWITHTHESAMEDEPTH_SH gitv3.0'
alias gotogitv4.0='. $GOTOWITHTHESAMEDEPTH_SH gitv4.0'
alias gotolg='. $GOTOWITHTHESAMEDEPTH_SH partnerlg'
alias gotolg0='. $GOTOWITHTHESAMEDEPTH_SH partnerlg_0'
alias gotolgv3.0='. $GOTOWITHTHESAMEDEPTH_SH lgv3.0'

alias activitiesOnce='$ADBCON_SH && adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias logcatcolor='$ADBCON_SH && adb -s $ADBHOSTPORT logcat | $COLOR_PY'
alias logcattime='$ADBCON_SH && adb -s $ADBHOSTPORT logcat -v time'

alias adbcon='$ADBCON_SH'
alias adbrecon='adb disconnect; $ADBCON_SH'
alias adbremount='$ADBCON_SH && adb -s $ADBHOSTPORT remount'
alias adbsync='$ADBCON_SH && adb -s $ADBHOSTPORT sync'
alias adbpush='$ADBCON_SH && adb -s $ADBHOSTPORT push'
alias adbpull='$ADBCON_SH && adb -s $ADBHOSTPORT pull'
alias adbinstallhelp='echo "adb -s $ADBHOSTPORT install [-r] bin/*.apk"'
alias adbinstall='$ADBCON_SH && adb -s $ADBHOSTPORT install'
alias adbkillemu='$ADBCON_SH && adb -s emulator-5554 device kill'

#alias adb='adb -s $ADBHOSTPORT'

alias howtomediatest='
echo "godir libstagefright/test";
echo "mm";
echo "adbcon";
echo "adbremount";
echo "adbshell android stop";
echo "adbsync";
echo "adbreboot";
echo "adbcon";
echo "adbshell /data/nativetest/MediaExtractor_test/MediaExtractor_test";
echo "adbshell /data/nativetest/MediaMetadata_test/MediaMetadata_test";
echo "adbshell /data/nativetest/MediaPlayback_test/MediaPlayback_test";
echo "adbshell /data/nativetest/MediaPlayer_test/MediaPlayer_test";
echo "or";
echo "runtest mediacoverage";
'
alias prepare.runtest='adbcon && adbremount && adbshell android stop && adbsync && adbreboot'
alias runtest.cts.MediaCoverageTest='$ADBCON_SH && runtest cts-tv -c com.google.android.tv.media.cts.MediaCoverageTest'
alias runtest.mediacoverage='$ADBCON_SH && runtest mediacoverage'

alias prepare.cts='adbinstall -r $DEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $DELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'
alias prepare.gcts='adbinstall -r $GDEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $GDELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'

alias adbshell='$ADBCON_SH && adb -s $ADBHOSTPORT shell'
alias adbreboot='adbshell "reboot"'
alias adbrmdata='adbshell "rm -rf /data; reboot"'
alias adblist='adbshell ps'
alias amstarthelp='echo "Usage:   am start [-a ACTION] [-d DATA] [-t TYPE] [-n COMPONENT]"; echo "Example: am start -a android.intent.action.VIEW -d file:///mnt/sdcard/DCIM/Camera/video-2010-08-20-08-49-48.mp4 -t video/mp4 -n com.sec.android.app.videoplayer/.activity.MoviePlayer"'
alias amstart='adbshell am start'
alias adbsql='adbshell "sqlite3"'
alias adbsqldump='adbsql /data/data/com.android.providers.media/databases/external.db .dump'
alias adbsqlvolumes='adbsql /data/data/com.android.providers.media/databases/external.db "select * from volumes"'
alias adbsqlshortcut='adbsql /data/data/com.google.tv.launcher/databases/launcher.db "select * from shortcuts"'
alias useomx='adbshell setprop media.moo.others true'
alias useavapi='adbshell setprop media.moo.others false'
alias getomx='adbshell getprop media.moo.others'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias killprocess='$KILLPROCESS_SH'

alias createapphelp='echo "Example: android create project -n ProjectName -t 1 -p ./projectname -k com.example.projectname -a ProjectActivity"; android --help create project'
alias createapp='android create project'
alias updateapphelp='echo "Example: android update project -l $TOOL_MOUNTED/android-sdk-linux/platforms/android-11 -p ./projectname"; android --help update project'
alias updateapp='android update project'

alias eclipse='$ADT_BUNDLE/eclipse/eclipse -vm $TOOL_MOUNTED/jdk1.6.0_33/bin &'

alias lunch.android-4.2_r1='cd $ANDROIDDIR/android-4.2_r1; . build/envsetup.sh; lunch full-eng; source.envsetup'
alias lunch.aah='cd $ANDROIDDIR/jb-mr1-aah-dev; . build/envsetup.sh; lunch full-eng; source.envsetup'

alias lunch.gtv-4.0-jb-mr0=' cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; '
alias build.gtv-4.0-jb-mr0=' cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; makewithlog; makeotawithlog; gtv_reinstall'
alias night.gtv-4.0-jb-mr0=' cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; repo sync -j20; makewithlog; makeotawithlog; '

alias lunchgit='cd $GITCORPDIR; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgit0='cd $GOOGLETVDIR/gitcorp_0; . build/envsetup.sh; lunch berlin-eng; source.envsetup'
#alias lunchgit0='cd $GOOGLETVDIR/gitcorp_0; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgit1='cd $GOOGLETVDIR/gitcorp_1; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgit2='cd $GOOGLETVDIR/gitcorp_2; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgitdbg='cd $GOOGLETVDIR/gitcorp_dbg; . build/envsetup.sh; choosecombo'
alias lunchgitv2.1='cd $GOOGLETVDIR/gitv2.1; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgitv3.0='cd $GOOGLETVDIR/gitv3.0; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchgitv4.0='cd $GOOGLETVDIR/gitv4.0; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchlg0='cd $GOOGLETVDIR/partnerlg_0; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchlgv3.0='cd $GOOGLETVDIR/lgv3.0; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
alias lunchpartner-gtv-2.1-berlin='cd $GOOGLETVDIR/partner-gtv-2.1-berlin; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'

alias goandroid='cd $ANDROIDDIR; . build/envsetup.sh;' # lunch full-eng'


alias deletelog='echo "delete logfiles below..."; ll make_*.log 2>/dev/null; rm ./make_*.log; echo "remained logfiles below..."; find . -name "make_*.log"'


alias makewithlog='$MAKEWITHLOG_SH'
alias gtv_reinstall='$GTV_REINSTALL_SH'
alias do_all_at_once='$DO_ALL_AT_ONCE_SH'

export kernel=/usr/local/google/home/kihwanl/work2/tool/adt-bundle-linux/sdk/system-images/android-17/armeabi-v7a/kernel-qemu
alias emulator.avd='emulator -kernel $kernel -system $OUT/system.img -datadir $OUT/userdata.img -ramdisk $OUT/ramdisk.img'
export system_images=/home/kihwanl/tool/adt-bundle-linux/sdk/system-images/android-16/armeabi-v7a
export system_images_org=/home/kihwanl/tool/adt-bundle-linux/sdk/system-images/android-16.org/armeabi-v7a
alias cp.emulator='cp -ar $OUT/*.img $system_images'
alias rb.emulator='cp -ar $system_images_org/*.img $system_images'
alias cp.userdata='cp -ar $system_images_org/userdata.img $OUT'

alias makeepkwithlog='time make epk -j8 2>&1 | tee make_epk_build.log; ll $OUT/cosmo.epk | grep $OUT/cosmo.epk'
alias copyepk='cp $OUT/cosmo.epk /var/lib/tftpboot/cosmo/cosmo.epk; sudo chmod -R 777 /var/lib/tftpboot/*; ls -alRh /var/lib/tftpboot'

alias mmwithlog='time mm -j8 2>&1 | tee make_mm_build.log'
# alias make GtvVideoViewTest -j8
alias pushapk='$PUSHAPK_SH'
alias pushjar='$PUSHJAR_SH'
alias do_apk_at_once='mmwithlog && pushapk'
alias do_jar_at_once='mmwithlog && pushjar'

# for gtv v2.1 M4
alias lunchgitv2.1='cd $GITV2DOT1DIR; . build/envsetup.sh; lunch fishtank-eng; source.envsetup'
alias gtv_reinstallv2.1='$ADBCON_SH && vendor/intel/build/gtv_reinstall.sh $OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip $ADBHOST'

# for gtv v3.0
alias lunchgitv3.0='cd $GITV3DOT0DIR; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
#alias gtv_reinstallv3.0='$ADBCON_SH && vendor/intel/build/gtv_reinstall.sh $OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip $ADBHOST'

# for gtv v4.0
alias lunchgitv4.0='cd $GITV4DOT0DIR; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
#alias gtv_reinstallv4.0='$ADBCON_SH && vendor/intel/build/gtv_reinstall.sh $OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip $ADBHOST'


# for lg v3.0
alias lunchlgv3.0='cd $LGV3DOT0DIR; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'
#alias gtv_reinstallv3.0='$ADBCON_SH && vendor/intel/build/gtv_reinstall.sh $OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip $ADBHOST'


# for debug
alias jdbattach='$JDBATTACH_SH'
alias gdbattach='$GDBATTACH_SH'

alias whatamidoingnowAll='
gotogit0; whatamidoingnow; 
gotogit1; whatamidoingnow; 
gotogit2; whatamidoingnow; 
gotogitv2.1; whatamidoingnow; 
gotogitv3.0; whatamidoingnow; 
gotogitv4.0; whatamidoingnow; 
gotolg0; whatamidoingnow; 
gotolgv3.0; whatamidoingnow; 
'

alias checkremotehelp='echo "repo start checkremote ."; echo "git remote update"; echo "git branch -a"; echo "git diff checkremote remotes/m/master"; echo "repo abandon checkremote"'
alias checkremote='repo start checkremote .; git remote update; git branch -a; git diff checkremote remotes/m/master; repo abandon checkremote'


alias mkct='ctags -B -F -R --exclude="^out"'
alias mkcs='$ENVSETUP/mkcscope.sh'
alias delfl='rm filelist'
alias mkdb='delfl; mkct; mkcs'

alias findlib='$FINDLIB_SH'
alias findpkg='$FINDPKG_SH'
alias whichpkg='$WHICHPKG_SH'
alias findtest='$FINDTEST_SH'
alias listtest='runtest -l'

alias chrome='google-chrome'

echo ~/.envsetup/$os/devsetup.sh sourced!!!
