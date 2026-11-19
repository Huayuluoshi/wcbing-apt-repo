
PKG="steamcommunity-302"
PAGE="https://www.dogfight360.com/blog/18682/"

# 从页面内联配置里取当前版本号
VERSION=$(curl -sL "$PAGE" \
  | grep -oE 'version:[[:space:]]*"V[0-9.]+"' | head -n1 \
  | grep -oE '[0-9]+\.[0-9.]+')
BASE="https://www.dogfight360.com/Usbeam/V${VERSION%%.*}"

AMD64_URL="$BASE/Steamcommunity_302_${VERSION}_Linux_x64.deb"
ARM64_URL="$BASE/Steamcommunity_302_${VERSION}_Linux_arm64.deb"

./check_downloader.py "$PKG" "$VERSION" "$AMD64_URL" amd64
./check_downloader.py "$PKG" "$VERSION" "$ARM64_URL" arm64
