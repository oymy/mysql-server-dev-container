# MySQL(5.7) Dev Container 项目
本项目旨在通过 VS Code 的 Dev Container 插件快速配置并启动一个用于调试 MySQL 的开发环境。项目包含必要的配置文件和一个简单的脚本用于下载 MySQL 源码。以下是项目的详细介绍和使用说明。

## 文件说明
文件说明
- download_mysql_source_code.sh：用于下载 MySQL 源码的脚本，执行后将从官方仓库克隆最新的 MySQL 源码到名为 mysql-server 的目录中。
- .devcontainer/Dockerfile：定义用于创建 Dev Container 的 Docker 镜像，其中包含了安装必要的开发工具和依赖。
- .devcontainer/devcontainer.json：定义了 Dev Container 的配置，如使用的 Docker 镜像、工作目录等。
- .vscode/launch.json：定义了 VS Code 的调试配置，用于启动和调试 MySQL 服务器。
- .vscode/tasks.json：定义了 VS Code 的任务配置，包括编译 MySQL 等操作。
- scripts/tpost_create_container_init_mysql.sh：此脚本用于编译、安装 MySQL 服务器，并进行初始化配置与环境变量设置(无需手动执行)。


## 使用步骤

### 需要确保 [Docker](https://docker.com) 已经安装并运行在您的计算机上。
### 对于尚未安装 VS Code 和 Dev Container 插件的用户,请先安装。
1. 安装 [Visual Studio Code](https://code.visualstudio.com/)。
2. 在 VS Code 中，打开 "Extensions" 选项卡（快捷键 Ctrl+Shift+X），搜索 ["Dev Containers"](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) 并安装插件。

### 对于已安装 VS Code 和 Dev Container 插件和Docker的用户
1. 克隆或下载本项目到本地。
2. 打开终端，切换到项目根目录，运行 ./download_redis_source_code.sh 下载 Redis 源码。
3. 打开 VS Code，点击左下角的绿色按钮，选择 "Reopen in Container"。稍等片刻，VS Code 将自动构建 Dev Container 并打开项目。
4. 在 VS Code 中，按 F5 或点击左侧 "Run and Debug" 选项卡中的绿色 "Run" 按钮，开始调试 MySQL Server。

祝您使用愉快！如有疑问，请查看 Dev Container 文档
