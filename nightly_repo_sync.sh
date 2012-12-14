#!/bin/bash
#
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: jaeseo@google.com (Jae Seo)

REPO=/home/kihwanl/.envsetup/bin/repo

source_dir="/usr/local/google/home/kihwanl/work2/source"
aosp_dir="$source_dir/aosp"
android_dir="$source_dir/android"
googletv_dir="$source_dir/googletv"

# A list of git project directories to sync
sync_targets="
$aosp_dir/android-4.2.1_r1
$aosp_dir/jb-mr1-dev
$aosp_dir/master
$android_dir/jb-mr1-aah-dev
$android_dir/jb-mr1.1-dev
$android_dir/master
$googletv_dir/gtv-4.0-jb-mr1
"
#$googletv_dir/gtv-4.0-jb-mr0
#$googletv_dir/gitcorp_2

# A list of targets to build (format = {lunch combo}@{location})
build_targets="
"
#cosmo-eng@$googletv_dir/gtv-4.0-jb-mr0


function Log() {
  echo -n "$@ ("
  date '+%I:%M %p)'
}

function Run() {
  echo "$ $@"
  $@ > /dev/null 2>&1 || echo "        --> **FAIL**"
}

nr_cpu=`grep -c ^processor /proc/cpuinfo`

# Get the latest source
for d in ${sync_targets}; do
  Log "d : ${d}"
  Log "Pulling the latest source for $(basename ${d})"
  cd ${d} || exit 1
#  Run ${REPO} sync -n -j${nr_cpu}
  Run ${REPO} sync -j${nr_cpu}
  # Sync again just to make sure
#  Run ${REPO} sync -n -j${nr_cpu}
#  Run ${REPO} forall -c git gc
#  Run ${REPO} prune
  Run ${REPO} status
  echo
done

# Build
for i in ${build_targets}; do
  combo=`echo ${i} | cut -d@ -f 1`
  dir=`echo ${i} | cut -d@ -f 2`
  Log "Building `basename ${dir}`"
  cd ${dir} || exit 1
  Run . build/envsetup.sh
  Run lunch ${combo}
  Run rm -rf out*
  Run make -j${nr_cpu} -k
  Run make otapackage -j2
  echo
done

Log "My work is done."
exit 0
