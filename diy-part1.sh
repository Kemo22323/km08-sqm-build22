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

# Replace the workflow's default source with the exact revision running on the
# live KM08, then build only base-tree traffic-control components.
git remote add official https://github.com/openwrt/openwrt.git 2>/dev/null || true
git fetch --depth=1 official 69582e71fabfb42aa2842d24eecb1f4392048404
git checkout --force FETCH_HEAD
: > feeds.conf.default
