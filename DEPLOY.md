# 🚀 GitHub Pages 部署指南

## 📋 部署步骤

### 1. 推送代码到GitHub

```bash
# 使用我们的提交脚本
./git-commit.sh

# 或手动提交
git add .
git commit -m "添加GitHub Pages支持"
git push origin main
```

### 2. 启用GitHub Pages

1. 访问您的GitHub仓库
2. 点击 **Settings** 标签页
3. 在左侧菜单找到 **Pages**
4. 在 **Source** 部分选择 **GitHub Actions**

### 3. 等待部署完成

- 在 **Actions** 标签页查看部署进度
- 绿色✅表示部署成功
- 红色❌表示部署失败

### 4. 访问网站

部署成功后，访问：

**https://xiebaiyuan.github.io/Share-Your-Mac-APP/**

## 📁 相关文件说明

- `_config.yml` - Jekyll配置，设置网站基本信息
- `.github/workflows/pages.yml` - GitHub Actions部署工作流
- `github-pages.html` - GitHub Pages专用主页
- `welcome.html` - 简单的欢迎页面
- `docs/GITHUB_PAGES.md` - 详细的设置说明

## 🔧 自定义配置

### 修改网站标题和描述

编辑 `_config.yml` 文件：

```yaml
title: "您的项目名称"
description: "您的项目描述"
```

### 自定义域名

如果有自己的域名：

1. 在仓库根目录创建 `CNAME` 文件
2. 写入您的域名，如 `your-domain.com`
3. 在域名服务商配置CNAME记录

## 📊 部署状态检查

### 成功部署

- Actions页面显示绿色✅
- 可以正常访问网站
- 功能完全正常

### 部署失败

常见原因和解决方案：

1. **语法错误**
   - 检查YAML文件语法
   - 查看Actions错误日志

2. **权限问题**
   - 确认GitHub Pages已启用
   - 检查仓库是否为public

3. **文件路径问题**
   - 检查相对路径设置
   - 确认baseurl配置正确

## 🎯 功能特点

GitHub Pages版本包含：

- 🏠 **精美主页** - 项目介绍和特性展示
- 🔗 **直接访问** - 一键进入应用界面
- 📱 **响应式设计** - 适配所有设备
- ⚡ **CDN加速** - 全球快速访问
- 🔄 **自动更新** - 推送即部署

## 🐛 故障排除

### 网站无法访问

1. 等待5-10分钟让DNS传播
2. 清除浏览器缓存
3. 检查GitHub Pages设置

### 样式加载失败

1. 检查CSS文件路径
2. 确认baseurl设置正确
3. 查看浏览器开发者工具

### 功能异常

1. 检查JavaScript控制台错误
2. 确认CDN资源加载正常
3. 测试不同浏览器

## 📞 获得帮助

- 📖 [GitHub Pages官方文档](https://docs.github.com/en/pages)
- 🐛 [提交Issue](https://github.com/xiebaiyuan/Share-Your-Mac-APP/issues)
- 💬 查看GitHub社区讨论
