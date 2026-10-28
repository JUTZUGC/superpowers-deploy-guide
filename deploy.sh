#!/usr/bin/env bash
set -euo pipefail
# Superpowers 技能包安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/obra/superpowers#installation
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }

mkdir -p .download
cd .download

git clone --depth=1 https://github.com/obra/superpowers.git
mkdir -p ~/.claude/skills
cp -R superpowers/skills/* ~/.claude/skills/
ls ~/.claude/skills | head -n 15
echo "安装完成：新开一个会话，说一句话验证 brainstorming 是否触发"

echo ""

echo "安装完成：新开一个会话，随便说一句「帮我做个 React 待办」，它会先触发 brainstorming 再开始写代码"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/obra/superpowers#installation"
