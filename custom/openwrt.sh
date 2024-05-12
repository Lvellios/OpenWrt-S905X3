#!/bin/bash
#
# Modify Default
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate

# Themes
git clone --depth 1 -b master https://github.com/jerrykuku/luci-theme-argon package/AddPack/luci-theme-argon
git clone --depth 1 -b master https://github.com/jerrykuku/luci-app-argon-config package/AddPack/luci-app-argon-config

# Themes
git clone --depth 1 https://github.com/kenzok8/luci-theme-ifit package/AddPack/luci-theme-ifit

# Pack
git clone --depth 1 https://github.com/chenmozhijin/luci-app-socat package/AddPack/luci-app-socat
git clone --depth 1 https://github.com/ximiTech/luci-app-msd_lite package/AddPack/luci-app-msd_lite

# HelloWorld
git clone --depth 1 https://github.com/MilesPoupart/luci-app-vssr package/AddPack/luci-app-vssr

# PassWall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/AddPack/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/AddPack/luci-app-passwall2
git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages package/AddPack/openwrt-passwall-packages

# Xray
git clone --depth 1 https://github.com/yichya/luci-app-xray package/AddPack/luci-app-xray

# SmartDNS
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns package/AddPack/smartdns
git clone --depth 1 -b master https://github.com/pymumu/luci-app-smartdns package/AddPack/luci-app-smartdns

# Netdata
git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/AddPack/luci-app-netdata

# AdGuardHome
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/AddPack/luci-app-adguardhome
# git clone --depth 1 https://github.com/xiaoxiao29/luci-app-adguardhome package/AddPack/luci-app-adguardhome

# Maxmind DB
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/AddPack/lua-maxminddb

# Bandwidth Monitor
git clone --depth 1 https://github.com/brvphoenix/wrtbwmon package/AddPack/wrtbwmon
git clone --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon package/AddPack/luci-app-wrtbwmon

# Alist
git clone --depth 1 https://github.com/alist-org/alist package/AddPack/alist
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/AddPack/luci-app-alist

# MosDNS
git clone --depth 1 https://github.com/QiuSimons/openwrt-mos package/AddPack/mosdns
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns package/AddPack/luci-app-mosdns

# MosDNS
git clone --depth 1 https://github.com/QiuSimons/openwrt-mos package/AddPack/mosdns
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns package/AddPack/luci-app-mosdns

# EQoS Plus
git clone --depth 1 https://github.com/sirpdboy/luci-app-eqosplus package/AddPack/luci-app-eqosplus
# git clone --depth 1 https://github.com/JSZMonkey/luci-app-eqosplus package/AddPack/luci-app-eqosplus

# DDNS Go
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/AddPack/luci-app-ddns-go

# Partition
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp package/AddPack/luci-app-partexp

# Auto Cron
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset package/AddPack/luci-app-autotimeset

# CloudFlare Test
git clone --depth 1 https://github.com/immortalwrt-collections/openwrt-cdnspeedtest package/AddPack/openwrt-cdnspeedtest
git clone --depth 1 https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest package/AddPack/luci-app-cloudflarespeedtest
sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' package/AddPack/openwrt-cdnspeedtest/cdnspeedtest/Makefile

## UnTested
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status package/AddPack/luci-app-cpu-status
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini package/AddPack/luci-app-cpu-status-mini
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf package/AddPack/luci-app-cpu-perf
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics package/AddPack/luci-app-interfaces-statistics
# git clone --depth 1 https://github.com/DevOpenWRT-Router/luci-app-cpulimit package/AddPack/luci-app-cpulimit

# Customizing the LUCI Menus
## PassWall Menu
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/type/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/type/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm

## PassWall 2 Menu
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/type/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/type/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/passwall2/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/server/*.htm
sed -i 's/services/vpn/g' package/AddPack/luci-app-passwall2/luci-app-passwall2/luasrc/view/passwall2/socks_auto_switch/*.htm

## Hello World Menu
sed -i 's/services/vpn/g' package/AddPack/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/AddPack/luci-app-vssr/luasrc/view/vssr/*.htm

# Setting Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\hub\.com/g' {}

# Update & Install Feeds
./scripts/feeds update -a
./scripts/feeds install -a