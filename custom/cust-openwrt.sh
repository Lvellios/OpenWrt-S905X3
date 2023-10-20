#!/usr/bin/env bash

# Modify Default
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate

# Remove Packages
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
# rm -rf feeds/luci/applications/luci-app-dockerman

# Add Themes
git clone --depth 1 -b master https://github.com/jerrykuku/luci-theme-argon package/new-package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/new-package/luci-app-argon-config

# Add Pack_A
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/new-package/luci-app-adguardhome
git clone --depth 1 -b master https://github.com/pymumu/luci-app-smartdns package/new-package/luci-app-smartdns
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns package/new-package/smartdns
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/new-package/luci-app-netdata
# git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/new-package/luci-app-netdata
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status package/new-package/luci-app-cpu-status
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini package/new-package/luci-app-cpu-status-mini
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf package/new-package/luci-app-cpu-perf
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics package/new-package/luci-app-interfaces-statistics
# git clone --depth 1 https://github.com/DevOpenWRT-Router/luci-app-cpulimit package/new-package/luci-app-cpulimit

# Add Pack_B
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos package/new-package/luci-app-eqos
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-socat package/new-package/luci-app-socat

# Bandwidth Monitor
svn co https://github.com/brvphoenix/luci-app-wrtbwmon/trunk/luci-app-wrtbwmon package/new-package/luci-app-wrtbwmon
svn co https://github.com/haiibo/packages/trunk/wrtbwmon package/new-package/wrtbwmon

# Onliner
svn co https://github.com/haiibo/packages/trunk/luci-app-onliner package/new-package/luci-app-onliner

# MosDNS
svn co https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/new-package/luci-app-mosdns
svn co https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/new-package/mosdns

# Setting Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\hub\.com/g' {}

./scripts/feeds update -a
./scripts/feeds install -a