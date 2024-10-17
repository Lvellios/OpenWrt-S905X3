#!/bin/bash
#
# Modify Default
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate

# Remove Packages
# rm -rf feeds/luci/applications/luci-app-dockerman

# Themes
git clone --depth 1 -b master https://github.com/jerrykuku/luci-theme-argon package/ExtraPack/luci-theme-argon
git clone --depth 1 -b master https://github.com/jerrykuku/luci-app-argon-config package/ExtraPack/luci-app-argon-config

# Pack
git clone --depth 1 https://github.com/chenmozhijin/luci-app-socat package/ExtraPack/luci-app-socat

# Xray
# git clone --depth 1 https://github.com/yichya/luci-app-xray package/ExtraPack/luci-app-xray
git clone --depth 1 https://github.com/honwen/luci-app-xray package/ExtraPack/luci-app-xray

# Netdata
git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/ExtraPack/luci-app-netdata

# Bandwidth Monitor
git clone --depth 1 https://github.com/brvphoenix/wrtbwmon package/ExtraPack/wrtbwmon
git clone --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon package/ExtraPack/luci-app-wrtbwmon

# Turbo ACC
git clone -n --depth 1 --filter=tree:0 https://github.com/chenmozhijin/turboacc package/ExtraPack/turboacc
git -C package/ExtraPack/turboacc/ sparse-checkout set --no-cone luci-app-turboacc
git -C package/ExtraPack/turboacc/ checkout
mv package/ExtraPack/turboacc/luci-app-turboacc package/ExtraPack/
rm -rf package/ExtraPack/turboacc/

# Shortcut-fe
git clone -n --depth 1 --filter=tree:0 https://github.com/fall513/fast-classifier package/kernel/shortcut
git -C package/kernel/shortcut/ sparse-checkout set --no-cone shortcut-fe
git -C package/kernel/shortcut/ checkout
mv package/kernel/shortcut/package/kernel/shortcut-fe package/kernel/
rm -rf package/kernel/shortcut

## UnTested
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status package/ExtraPack/luci-app-cpu-status
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini package/ExtraPack/luci-app-cpu-status-mini
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf package/ExtraPack/luci-app-cpu-perf
# git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics package/ExtraPack/luci-app-interfaces-statistics
# git clone --depth 1 https://github.com/DevOpenWRT-Router/luci-app-cpulimit package/ExtraPack/luci-app-cpulimit

# Setting Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\hub\.com/g' {}

# Update & Install Feeds
./scripts/feeds update -a
./scripts/feeds install -a