# GitHub Pages 设置说明

本文档说明如何将 Share Your Mac APP 发布到 GitHub Pages。

## 🌐 在线演示

项目已部署到 GitHub Pages，您可以直接访问：

**https://xiebaiyuan.github.io/Share-Your-Mac-APP/**

## 📋 设置步骤

### 1. 启用 GitHub Pages

1. 进入您的 GitHub 仓库
2. 点击 **Settings** 标签页
3. 在左侧菜单中找到 **Pages**
4. 在 **Source** 部分选择 **GitHub Actions**

### 2. 配置自动部署

我们已经创建了自动部署工作流 `.github/workflows/pages.yml`，它会：

- 🔄 在每次推送到 `main` 分支时自动部署
- 📦 使用 Jekyll 构建静态网站
- 🚀 自动发布到 GitHub Pages

### 3. 访问网站

部署完成后，您可以通过以下地址访问：

- **主页**: `https://xiebaiyuan.github.io/Share-Your-Mac-APP/`
- **应用界面**: `https://xiebaiyuan.github.io/Share-Your-Mac-APP/index.html`

## 📁 相关文件

- `_config.yml` - Jekyll 配置文件
- `github-pages.html` - GitHub Pages 专用主页
- `.github/workflows/pages.yml` - 自动部署工作流

## 🎯 功能特点

GitHub Pages 版本包含：

- 🏠 **精美主页** - 项目介绍和特性展示
- 🔗 **直接链接** - 一键进入应用界面
- 📱 **响应式设计** - 适配所有设备
- ⚡ **快速加载** - CDN 加速访问

## 🔧 自定义域名 (可选)

如果您有自定义域名，可以：

1. 在仓库根目录创建 `CNAME` 文件
2. 在文件中写入您的域名，如 `your-domain.com`
3. 在域名服务商处配置 CNAME 记录指向 `xiebaiyuan.github.io`

## 📊 部署状态

您可以在仓库的 **Actions** 标签页查看部署状态：

- ✅ 绿色表示部署成功
- ❌ 红色表示部署失败
- 🟡 黄色表示正在部署

## 🐛 故障排除

### 部署失败

1. 检查 Actions 页面的错误日志
2. 确保所有文件语法正确
3. 检查 `_config.yml` 配置

### 页面无法访问

1. 确认 GitHub Pages 已启用
2. 等待几分钟让更改生效
3. 检查浏览器缓存

### 样式不正确

1. 检查 CSS 文件路径
2. 确认 `baseurl` 配置正确
3. 清除浏览器缓存

## 📞 获得帮助

如果遇到问题：

1. 查看 [GitHub Pages 文档](https://docs.github.com/en/pages)
2. 在仓库中创建 Issue
3. 查看社区讨论
