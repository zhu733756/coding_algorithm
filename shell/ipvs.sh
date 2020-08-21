#! /bin/bash
pvs_mods_dir="/usr/lib/modules/$(uname -r)/kernel/net/netfilter/ipvs"
for mod in $(ls $ipvs_mods_dir | grep -o "^[^.]*"); do 
     /sbin/modinfo -F filename $mod &> /dev/null
    if [ $? -eq 0 ]; then
        /sbin/modprobe $mod
    fi
done

