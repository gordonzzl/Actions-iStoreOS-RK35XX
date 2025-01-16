#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修改版本为编译日期，数字类型。
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# 为iStoreOS固件版本加上编译作者
author="gordonzzl"
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# 拉取我的软件包仓库
sed -i '$a src-git xmpackage https://github.com/xiaomeng9597/openwrt-packages2.git;main' feeds.conf.default
sed -i '$a src-git smallpack https://github.com/kenzok8/small.git;master' feeds.conf.default
sed -i '$a src-git tailscale https://github.com/asvow/luci-app-tailscale.git;master' feeds.conf.default
sed -i '$a src-git ddnsgo https://github.com/sirpdboy/luci-app-ddns-go.git;master' feeds.conf.default

