#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Use the reviewed KM08 device-support branch, then bake the traffic-control
# kernel features into a complete board-specific sysupgrade image.
git remote add km08 https://github.com/momothefox/openwrt.git 2>/dev/null || true
git fetch --depth=1 km08 10b1f53972ec4d8e45aac2d01d4ce4ad954e1546
git checkout --force FETCH_HEAD

# The currently installed custom image reports this legacy board ID. Add it
# to image metadata so sysupgrade -T can validate without --force.
sed -i '/define Device\/mercury_km08-708h/a\  SUPPORTED_DEVICES += KM08-708H' \
  target/linux/ramips/image/mt7621.mk

: > feeds.conf.default
