case $OSTYPE in
    darwin*) os=macosx;;
    linux*)  os=ubuntu;;
esac

if [ "$os" == "macosx" ]; then
	# MacPorts Installer addition on 2012-11-25_at_21:45:19: adding an appropriate PATH variable for use with MacPorts.
	export PATH=/opt/local/bin:/opt/local/sbin:$PATH
	# Finished adapting your PATH environment variable for use with MacPorts.

	alias hdiutil.create='echo "hdiutil create -fs \"Case-sensitive Journaled HFS+\" -size 10g ~/android_readonly.dmg"'
	alias hdiutil.convert='echo "hdiutil convert ~/android_readonly.dmg -format UDRW -o ~/android_writable.dmg"'

	# mount the android file image
	function mount.android { hdiutil attach ~/android.dmg -mountpoint ~/android; }

	# set the number of open files to be 1024
	#ulimit -S -n 1024
fi

if [ "$os" == "ubuntu" ]; then
fi

envsetup=~/.envsetup/envsetup.sh
if [ -f $envsetup ]; then
    . $envsetup
fi

devsetup=~/.envsetup/$os/devsetup.sh
if [ -f $devsetup ]; then
    . $devsetup
fi

pathsetup=~/.envsetup/$os/pathsetup.sh
if [ -f $pathsetup ]; then
    . $pathsetup
fi
