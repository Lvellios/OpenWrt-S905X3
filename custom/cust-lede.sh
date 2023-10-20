#!/bin/bash

# Modify Default
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate
sed -i 's/ntp.aliyun.com/pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/0.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/1.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/2.pool.ntp.org/g' package/base-files/files/bin/config_generate

# Modify Source.list
sed -i 's/^[^#].*downloads.openwrt.org*/#&/g' package/lean/default-settings/files/zzz-default-settings

# Remove Packages
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/msd_lite
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-wrtbwmon
# rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-serverchan

# Add Themes
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/new-package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/new-package/luci-app-argon-config

# Add Pack_A
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/new-package/luci-app-adguardhome
git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/new-package/luci-app-smartdns
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns package/new-package/smartdns
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/new-package/luci-app-netdata
# git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/new-package/luci-app-netdata

git clone --depth 1 https://github.com/fw876/helloworld package/new-package/luci-app-ssr-plus
git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr package/new-package/luci-app-vssr
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/new-package/lua-maxminddb
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status package/new-package/luci-app-cpu-status
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini package/new-package/luci-app-cpu-status-mini
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf package/new-package/luci-app-cpu-perf
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics package/new-package/luci-app-interfaces-statistics
# git clone --depth 1 https://github.com/DevOpenWRT-Router/luci-app-cpulimit package/new-package/luci-app-cpulimit
git clone --depth 1 https://github.com/ximiTech/luci-app-msd_lite package/new-package/luci-app-msd_lite
git clone --depth 1 https://github.com/ximiTech/msd_lite package/msd_lite

# Add Pack_B
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new-package/luci-app-passwall
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos package/new-package/luci-app-eqos
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-socat package/new-package/luci-app-socat
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/new-package/luci-app-passwall2
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/new-package/luci-app-amlogic

## Pack Dependency
git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages package/new-package/luci-app-passwall-depends
rm -rf package/new-package/luci-app-passwall-depends/luci-app-passwall
rm -rf package/new-package/luci-app-passwall-depends/luci-app-passwall2

# Bandwidth Monitor
svn co https://github.com/brvphoenix/luci-app-wrtbwmon/trunk/luci-app-wrtbwmon package/new-package/luci-app-wrtbwmon
svn co https://github.com/haiibo/packages/trunk/wrtbwmon package/new-package/wrtbwmon

# Alist
svn co https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/new-package/luci-app-alist
svn co https://github.com/sbwml/luci-app-alist/trunk/alist package/new-package/alist

# Onliner
svn co https://github.com/haiibo/packages/trunk/luci-app-onliner package/new-package/luci-app-onliner
sed -i '/bin\/sh/a\uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '/nlbwmon/a\uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# Customizing the LUCI Menus
## PassWall Menu
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/model/cbi/passwall/client/type/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/model/cbi/passwall/server/type/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/server/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm

## PassWall 2 Menu
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/model/cbi/passwall2/client/type/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/model/cbi/passwall2/server/type/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/passwall2/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/server/*.htm
sed -i 's/services/vpn/g' package/new-package/luci-app-passwall2/luasrc/view/passwall2/socks_auto_switch/*.htm

## Hello World Menu
sed -i 's/services/vpn/g' package/new-package/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-vssr/luasrc/view/vssr/*.htm

## ShadowSocksR Plus+ Menu
sed -i 's/services/vpn/g' package/new-package/luci-app-ssr-plus/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-ssr-plus/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/new-package/luci-app-ssr-plus/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

# Setting Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\hub\.com/g' {}

./scripts/feeds update -a
./scripts/feeds install -a