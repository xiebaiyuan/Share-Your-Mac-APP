#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Share Your Mac APP - Git 提交助手${NC}"
echo "================================================"

# 检查是否在正确的目录
if [ ! -f "index.html" ] || [ ! -f "scan_apps.sh" ]; then
    echo -e "${RED}❌ 错误: 请在项目根目录运行此脚本${NC}"
    exit 1
fi

# 显示当前状态
echo -e "\n${YELLOW}📋 当前Git状态:${NC}"
git status --short

# 确认是否继续
echo -e "\n${YELLOW}是否要提交所有更改? (y/N)${NC}"
read -r response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo -e "${YELLOW}⏹️  已取消${NC}"
    exit 0
fi

# 添加所有文件
echo -e "\n${BLUE}📦 添加文件到暂存区...${NC}"
git add .

# 显示将要提交的文件
echo -e "\n${YELLOW}📝 将要提交的文件:${NC}"
git diff --cached --name-status

# 输入提交信息
echo -e "\n${YELLOW}💬 请输入提交信息 (留空使用默认信息):${NC}"
read -r commit_message

if [ -z "$commit_message" ]; then
    commit_message="✨ 完善项目文档和配置

- 📄 添加完整的README.md文档
- 📋 创建MIT许可证文件
- 🤝 添加贡献指南和行为准则
- 🔒 添加安全政策文件
- 📝 创建更新日志
- 🛠️ 配置GitHub Actions CI/CD
- 📋 添加Issue和PR模板
- 📦 创建package.json配置
- 🎨 优化网页界面和功能
- 🎮 添加演示数据功能"
fi

# 提交更改
echo -e "\n${BLUE}💾 提交更改...${NC}"
git commit -m "$commit_message"

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}✅ 提交成功!${NC}"
    
    # 询问是否推送到远程仓库
    echo -e "\n${YELLOW}是否要推送到远程仓库? (y/N)${NC}"
    read -r push_response
    if [[ "$push_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo -e "\n${BLUE}🚀 推送到远程仓库...${NC}"
        git push origin main
        
        if [ $? -eq 0 ]; then
            echo -e "\n${GREEN}🎉 推送成功! 项目已更新到GitHub${NC}"
            echo -e "${GREEN}📋 项目地址: https://github.com/xiebaiyuan/Share-Your-Mac-APP${NC}"
        else
            echo -e "\n${RED}❌ 推送失败，请检查网络连接和权限${NC}"
        fi
    fi
else
    echo -e "\n${RED}❌ 提交失败${NC}"
    exit 1
fi

echo -e "\n${BLUE}📊 项目统计:${NC}"
echo "- 文件总数: $(find . -type f | grep -v .git | wc -l | tr -d ' ')"
echo "- HTML文件: $(find . -name "*.html" | wc -l | tr -d ' ')"
echo "- Markdown文件: $(find . -name "*.md" | wc -l | tr -d ' ')"
echo "- Shell脚本: $(find . -name "*.sh" | wc -l | tr -d ' ')"

echo -e "\n${GREEN}🎯 接下来可以做的:${NC}"
echo "1. 在GitHub上启用 GitHub Pages (Settings -> Pages -> Source: GitHub Actions)"
echo "2. 访问在线演示: https://xiebaiyuan.github.io/Share-Your-Mac-APP/"
echo "3. 添加项目截图到docs/screenshots/"
echo "4. 创建Release版本"
echo "5. 添加更多功能和测试"

echo -e "\n${BLUE}🌐 GitHub Pages 设置:${NC}"
echo "1. 推送代码后，GitHub Actions 会自动部署"
echo "2. 部署完成后即可通过网址访问"
echo "3. 查看部署状态: GitHub -> Actions 标签页"

echo -e "\n${BLUE}📚 项目完成! 感谢使用 Share Your Mac APP${NC}"
