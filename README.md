# Mac App Scanner

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-10.14+-blue.svg)](https://www.apple.com/macos/)
[![Shell](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-success.svg)](https://xiebaiyuan.github.io/Share-Your-Mac-APP/)

A lightweight tool to scan installed applications on macOS and generate a beautiful web interface for visualization and management.

## 🌐 在线演示

立即体验 Share Your Mac APP，无需下载：

**👉 [在线演示](https://xiebaiyuan.github.io/Share-Your-Mac-APP/)**

直接在浏览器中使用所有功能，包括演示数据！

## 📸 Screenshots

![Main Interface](https://via.placeholder.com/800x400/007bff/ffffff?text=Mac+App+Scanner+Interface)

## ✨ Features

- 🔍 **Comprehensive Scanning**: Scans both `/Applications` and `/System/Applications` directories
- 📊 **Detailed Information**: Extracts app name, version, size, installation date, and Bundle ID
- 🎨 **Clean Web Interface**: Professional, responsive design with drag-and-drop support
- 🏷️ **Smart Categorization**: Automatically categorizes apps (System, Development, Adobe, Microsoft, etc.)
- 🔍 **Advanced Filtering**: Filter by category and search by name
- ☁️ **Word Cloud View**: Visual representation of your applications
- 📈 **Statistics Dashboard**: View app counts, categories, and system information
- 📱 **Mobile Responsive**: Works perfectly on desktop and mobile devices

## 🚀 Quick Start

### Prerequisites

- macOS 10.14 or later
- Terminal access
- Modern web browser (Chrome, Safari, Firefox)

### Installation

1. Clone this repository or download the files:

```bash
git clone https://github.com/xiebaiyuan/WUKONG_TOOLS.git
cd WUKONG_TOOLS/mac_app_scanner
```

1. Make scripts executable:

```bash
chmod +x scan_apps.sh start.sh
```

1. Run the scanner:

```bash
./start.sh
```

## 📖 Usage

### Method 1: Interactive Menu

```bash
./start.sh
```

Choose from the menu options:

1. Scan applications and generate data file
2. Open results webpage
3. Scan and automatically open webpage
4. View help

### Method 2: Manual Process

```bash
# Step 1: Scan applications
./scan_apps.sh

# Step 2: Open the web interface
open index.html

# Step 3: Drag and drop the generated apps_data.json file into the webpage
```

### Web Interface Features

- **📋 List View**: Card-based display with detailed app information
- **☁️ Word Cloud View**: Visual word cloud of application names
- **🏷️ Category Filter**: Filter apps by type (System, Development, Adobe, etc.)
- **🔍 Search**: Find apps by name
- **📊 Statistics**: View total apps, categories, and scan information

## 📁 File Structure

```text
mac_app_scanner/
├── scan_apps.sh      # Main scanning script
├── index.html        # Web interface
├── start.sh          # Interactive startup script
├── apps_data.json    # Generated scan results (after running)
└── README.md         # This file
```

## 🏷️ App Categories

The scanner automatically categorizes applications:

| Category | Description | Example Apps |
|----------|-------------|--------------|
| **System** | macOS system applications | Safari, Mail, Calendar |
| **Development** | Developer tools and IDEs | Xcode, VS Code, GitHub Desktop |
| **Adobe** | Adobe Creative Suite | Photoshop, Illustrator, Premiere Pro |
| **Microsoft** | Microsoft Office and tools | Word, Excel, PowerPoint |
| **Google** | Google applications | Chrome, Google Drive |
| **Games** | Gaming applications | Minecraft, Steam games |
| **Media** | Audio/Video applications | Final Cut Pro, Logic Pro, Spotify |
| **Productivity** | Productivity tools | Notion, Slack, Zoom |
| **Utilities** | System utilities | CleanMyMac, Bartender |
| **Other** | Uncategorized applications | Various third-party apps |

## 🔧 Technical Details

### Data Format

The scanner generates a JSON file with the following structure:

```json
{
  "scan_info": {
    "scan_date": "2025-08-12 19:45:00",
    "hostname": "MacBook-Pro",
    "username": "user",
    "total_apps": 150
  },
  "applications": [
    {
      "name": "Application Name",
      "version": "1.0.0",
      "bundle_id": "com.example.app",
      "size": "100MB",
      "install_date": "2024-01-15 10:30:00",
      "category": "Development",
      "path": "/Applications/App.app"
    }
  ]
}
```

### Browser Compatibility

- ✅ Chrome 80+
- ✅ Safari 13+
- ✅ Firefox 75+
- ✅ Edge 80+

## 🎯 Use Cases

- **📱 System Administration**: Audit installed applications
- **🔍 Security Review**: Identify unknown or unwanted software
- **📊 Usage Analysis**: Understand application distribution and usage
- **🎨 Data Visualization**: Present system information in an appealing format
- **📋 Documentation**: Record system state for backup or migration

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🐛 Issues and Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/xiebaiyuan/WUKONG_TOOLS/issues) page
2. Create a new issue with:
   - macOS version
   - Browser version
   - Error messages or screenshots
   - Steps to reproduce

## 🔮 Roadmap

- [ ] Application usage frequency tracking
- [ ] App update notifications
- [ ] Export to CSV/PDF formats
- [ ] Application icon display
- [ ] Batch application management
- [ ] System performance metrics
- [ ] Dark mode support

## 👨‍💻 Author

Created by **xiebaiyuan**

- GitHub: [@xiebaiyuan](https://github.com/xiebaiyuan)

## 🙏 Acknowledgments

- Thanks to the macOS developer community for documentation
- Inspired by various system monitoring tools
- Built with love for the macOS ecosystem

---

Made with ❤️ for the macOS community
