#!/bin/bash

# Mac应用扫描器 - 快速启动脚本
# Author: xiebaiyuan
# Date: 2025年8月12日

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🍎 Mac应用扫描器"
echo "=================="
echo ""
echo "请选择操作："
echo "1. 扫描应用并生成数据文件"
echo "2. 打开结果网页"
echo "3. 扫描并自动打开网页"
echo "4. 查看帮助"
echo ""

read -p "请输入选项 (1-4): " choice

case $choice in
    1)
        echo "🔍 开始扫描应用..."
        "$SCRIPT_DIR/scan_apps.sh"
        ;;
    2)
        echo "🌐 打开结果网页..."
        open "$SCRIPT_DIR/index.html"
        ;;
    3)
        echo "🔍 扫描应用..."
        "$SCRIPT_DIR/scan_apps.sh"
        echo ""
        echo "🌐 打开结果网页..."
        open "$SCRIPT_DIR/index.html"
        ;;
    4)
        echo "📖 使用帮助："
        echo ""
        echo "文件说明："
        echo "- scan_apps.sh: 扫描脚本，生成apps_data.json"
        echo "- index.html: 展示网页，拖入JSON文件查看结果"
        echo "- sample_apps_data.json: 示例数据文件"
        echo "- README.md: 详细使用说明"
        echo ""
        echo "使用步骤："
        echo "1. 运行 ./scan_apps.sh 扫描应用"
        echo "2. 打开 index.html 网页"
        echo "3. 将生成的 apps_data.json 拖入网页"
        echo "4. 享受美丽的应用展示界面"
        echo ""
        echo "功能特性："
        echo "- 📱 全面扫描Mac应用"
        echo "- 🎨 美丽的网页界面"
        echo "- 🏷️ 智能应用分类"
        echo "- 🔍 筛选和搜索功能"
        echo "- ☁️ 炫酷词云展示"
        echo "- 📊 详细统计信息"
        ;;
    *)
        echo "❌ 无效选项，请重新运行脚本"
        exit 1
        ;;
esac

echo ""
echo "✅ 操作完成！"
