# Superpowers 技能包安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/obra/superpowers#installation
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

git clone --depth=1 https://github.com/obra/superpowers.git
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills" | Out-Null
Copy-Item -Recurse -Force "superpowers\skills\*" "$env:USERPROFILE\.claude\skills\"
Get-ChildItem "$env:USERPROFILE\.claude\skills" -Name | Select-Object -First 15
Write-Host '安装完成：新开一个会话，说一句话验证 brainstorming 是否触发'

Write-Host ''

Write-Host '安装完成：新开一个会话，随便说一句「帮我做个 React 待办」，它会先触发 brainstorming 再开始写代码'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/obra/superpowers#installation'
