#!/bin/bash

# Mac App Scanner - 扫描Mac上安装的软件
# Author: xiebaiyuan
# Date: 2025年8月12日

# 设置输出文件
OUTPUT_FILE="$(dirname "$0")/apps_data.json"
TEMP_FILE="/tmp/mac_apps_temp.txt"

echo "🔍 开始扫描Mac上安装的软件..."

# 获取系统信息
SCAN_DATE=$(date "+%Y-%m-%d %H:%M:%S")
HOSTNAME=$(hostname)
USERNAME=$(whoami)

echo "📱 扫描Applications文件夹..."

# 初始化应用计数
APP_COUNT=0

# 临时存储应用信息
echo "[" > "$TEMP_FILE"

# 扫描/Applications目录
for app in /Applications/*.app; do
    if [ -d "$app" ]; then
        APP_NAME=$(basename "$app" .app)
        
        # 获取应用信息
        INFO_PLIST="$app/Contents/Info.plist"
        
        if [ -f "$INFO_PLIST" ]; then
            # 获取版本信息
            VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$INFO_PLIST" 2>/dev/null || echo "Unknown")
            BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$INFO_PLIST" 2>/dev/null || echo "Unknown")
            
            # 获取文件大小
            SIZE=$(du -sh "$app" 2>/dev/null | cut -f1 || echo "Unknown")
            
            # 获取创建时间
            INSTALL_DATE=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$app" 2>/dev/null || echo "Unknown")
            
            # 生成应用分类（基于Bundle ID的简单分类）
            CATEGORY="Other"
            case "$BUNDLE_ID" in
                com.apple.*) CATEGORY="System" ;;
                com.microsoft.*) CATEGORY="Microsoft" ;;
                com.adobe.*) CATEGORY="Adobe" ;;
                com.google.*) CATEGORY="Google" ;;
                *developer*|*xcode*|*git*) CATEGORY="Development" ;;
                *game*|*Games*) CATEGORY="Games" ;;
                *music*|*audio*|*video*|*media*) CATEGORY="Media" ;;
                *productivity*|*office*) CATEGORY="Productivity" ;;
                *utility*|*Utility*) CATEGORY="Utilities" ;;
            esac
            
            # 添加逗号（除了第一个应用）
            if [ $APP_COUNT -gt 0 ]; then
                echo "," >> "$TEMP_FILE"
            fi
            
            # 转义JSON字符串中的特殊字符
            APP_NAME_CLEAN=$(echo "$APP_NAME" | sed 's/\\/\\\\/g; s/"/\\"/g')
            VERSION_CLEAN=$(echo "$VERSION" | sed 's/\\/\\\\/g; s/"/\\"/g')
            BUNDLE_ID_CLEAN=$(echo "$BUNDLE_ID" | sed 's/\\/\\\\/g; s/"/\\"/g')
            SIZE_CLEAN=$(echo "$SIZE" | sed 's/\\/\\\\/g; s/"/\\"/g')
            INSTALL_DATE_CLEAN=$(echo "$INSTALL_DATE" | sed 's/\\/\\\\/g; s/"/\\"/g')
            PATH_CLEAN=$(echo "$app" | sed 's/\\/\\\\/g; s/"/\\"/g')
            
            # 写入JSON格式的应用信息
            echo "    {" >> "$TEMP_FILE"
            echo "      \"name\": \"$APP_NAME_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"version\": \"$VERSION_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"bundle_id\": \"$BUNDLE_ID_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"size\": \"$SIZE_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"install_date\": \"$INSTALL_DATE_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"category\": \"$CATEGORY\"," >> "$TEMP_FILE"
            echo "      \"path\": \"$PATH_CLEAN\"" >> "$TEMP_FILE"
            echo -n "    }" >> "$TEMP_FILE"
            
            APP_COUNT=$((APP_COUNT + 1))
            echo "  ✅ 发现: $APP_NAME ($VERSION)"
        fi
    fi
done

# 扫描/System/Applications目录（系统应用）
echo "🖥️  扫描系统应用..."
for app in /System/Applications/*.app; do
    if [ -d "$app" ]; then
        APP_NAME=$(basename "$app" .app)
        
        INFO_PLIST="$app/Contents/Info.plist"
        
        if [ -f "$INFO_PLIST" ]; then
            VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$INFO_PLIST" 2>/dev/null || echo "System")
            BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$INFO_PLIST" 2>/dev/null || echo "Unknown")
            SIZE=$(du -sh "$app" 2>/dev/null | cut -f1 || echo "Unknown")
            INSTALL_DATE=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$app" 2>/dev/null || echo "Unknown")
            
            if [ $APP_COUNT -gt 0 ]; then
                echo "," >> "$TEMP_FILE"
            fi
            
            # 转义JSON字符串中的特殊字符
            APP_NAME_CLEAN=$(echo "$APP_NAME" | sed 's/\\/\\\\/g; s/"/\\"/g')
            VERSION_CLEAN=$(echo "$VERSION" | sed 's/\\/\\\\/g; s/"/\\"/g')
            BUNDLE_ID_CLEAN=$(echo "$BUNDLE_ID" | sed 's/\\/\\\\/g; s/"/\\"/g')
            SIZE_CLEAN=$(echo "$SIZE" | sed 's/\\/\\\\/g; s/"/\\"/g')
            INSTALL_DATE_CLEAN=$(echo "$INSTALL_DATE" | sed 's/\\/\\\\/g; s/"/\\"/g')
            PATH_CLEAN=$(echo "$app" | sed 's/\\/\\\\/g; s/"/\\"/g')
            
            # 写入JSON格式的应用信息
            echo "    {" >> "$TEMP_FILE"
            echo "      \"name\": \"$APP_NAME_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"version\": \"$VERSION_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"bundle_id\": \"$BUNDLE_ID_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"size\": \"$SIZE_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"install_date\": \"$INSTALL_DATE_CLEAN\"," >> "$TEMP_FILE"
            echo "      \"category\": \"System\"," >> "$TEMP_FILE"
            echo "      \"path\": \"$PATH_CLEAN\"" >> "$TEMP_FILE"
            echo -n "    }" >> "$TEMP_FILE"
            
            APP_COUNT=$((APP_COUNT + 1))
            echo "  ✅ 发现系统应用: $APP_NAME"
        fi
    fi
done

# 完成临时文件
echo "" >> "$TEMP_FILE"
echo "]" >> "$TEMP_FILE"

# 创建最终的JSON文件
cat > "$OUTPUT_FILE" << EOF
{
  "scan_info": {
    "scan_date": "$SCAN_DATE",
    "hostname": "$HOSTNAME",
    "username": "$USERNAME",
    "total_apps": $APP_COUNT
  },
  "applications": 
EOF

# 追加应用数据
cat "$TEMP_FILE" >> "$OUTPUT_FILE"

# 完成JSON文件
echo "}" >> "$OUTPUT_FILE"

# 清理临时文件
rm -f "$TEMP_FILE"

echo ""
echo "🎉 扫描完成！"
echo "📊 总共发现 $APP_COUNT 个应用"
echo "📄 结果保存到: $OUTPUT_FILE"
echo ""
echo "🌐 现在可以打开 index.html 并拖入 apps_data.json 文件查看结果"

# 检查是否需要打开网页
read -p "是否要在浏览器中打开结果页面？(y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$(dirname "$0")/index.html" ]; then
        open "$(dirname "$0")/index.html"
    else
        echo "❌ 未找到 index.html 文件"
    fi
fi
