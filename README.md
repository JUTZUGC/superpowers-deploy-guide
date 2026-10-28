# Superpowers 技能包安装指南

> 第三方部署指南 · 非 Superpowers 官方仓库。官方项目：[obra/superpowers](https://github.com/obra/superpowers)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/obra/superpowers#installation)为准。

[![⚡ 技能包安装](https://img.shields.io/badge/%E2%9A%A1_%E6%8A%80%E8%83%BD%E5%8C%85%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#技能包安装推荐用百度搭子)

## 技能包安装（推荐：用百度搭子）

> [!TIP]
> 受够了 AI 上来就写代码、写完就跑偏？让百度搭子装上 Superpowers，先问清楚再动手。

⚠️ 这是给编程 Agent 用的技能包，不是独立软件，需要客户端支持 agent skills。官方推荐用插件市场安装，才能连钩子一起生效；手动复制只包含技能本体。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/superpowers-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子克隆仓库，把 skills 目录下的 15 个技能装进客户端的技能目录，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Superpowers 是什么？

Superpowers 是开源的306.6k stars，MIT，给 Claude Code / Codex / Cursor 等 Agent 装上完整软件开发方法论与 15 个可组合技能（协议：MIT，<img src="https://img.shields.io/github/stars/obra/superpowers?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一套完整的软件开发方法论，拆成 15 个可组合技能：从需求澄清、设计文档、写计划、子代理实现，到强制 TDD、代码审查、收尾合并，全部由 Agent 自动触发。

- 306.6k stars：2025-10 建仓，一年冲到 30 万
- 15 个技能：brainstorming / writing-plans / TDD / code-review 等
- 强制流程：Agent 动手前必须先问清需求，不是靠你提醒
- 子代理开发：每个任务派一个干净上下文的子代理，做完立刻审查
- 多宿主：Claude Code、Codex、Cursor、Gemini CLI、OpenCode、Kimi 等十余种
- MIT：可改可内部分发

（来源：[官方仓库](https://github.com/obra/superpowers)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 306.6k stars | 2025-10 建仓，一年 30 万 |
| 流程完整 | 从需求到合并全链路覆盖 |
| 强制 TDD | 先写失败测试再写实现 |
| 子代理开发 | 每任务独立上下文，避免污染 |
| 多宿主 | 十余种客户端都有安装方式 |
| MIT | 可改可内部推广 |

| 需要注意 | 说明 |
|---|---|
| 流程偏重 | 改个错别字也会被要求走流程 |
| 依赖客户端能力 | 不支持技能的客户端用不了 |
| 手动装没有钩子 | 不会自动触发，需要主动点名 |
| 子代理费 token | 完整跑一遍成本不低 |
| 会改工作习惯 | 团队要接受这套方法论 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
git clone --depth=1 https://github.com/obra/superpowers.git
mkdir -p ~/.claude/skills
cp -R superpowers/skills/* ~/.claude/skills/
ls ~/.claude/skills | head -n 15
echo "安装完成：新开一个会话，说一句话验证 brainstorming 是否触发"
```

部署步骤来源：[https://github.com/obra/superpowers#installation](https://github.com/obra/superpowers#installation)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据核对：306,609 stars、27,292 forks、MIT、2025-10-09 建仓 | 已核对 2026-10-27 |
| GitHub Trending 日榜 +617、周榜进入前列 | 已核对 2026-10-27 |
| 仓库根目录确认存在 skills/ 目录，共 15 个技能 | 已核对 2026-10-27 |
| package.json 确认 version 7.0.1，最新 release 为 v7.0.1（2026-10-21） | 已核对 2026-10-27 |
| README 确认 Claude Code / Antigravity / Codex / Cursor / Gemini CLI 等十余种宿主安装方式 | 已核对 2026-10-27 |
| 未实测技能在客户端内的触发效果 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Superpowers 不是 MCP server，是一套 Agent 技能与工作流；本仓库只负责安装，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\superpowers-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装方式怎么选

| 方式 | 能拿到什么 | 适合谁 |
|---|---|---|
| 插件市场（推荐） | 技能 + 钩子 | 用 Claude Code / Codex 的人 |
| 手动复制 skills | 只有技能本体 | 客户端没有插件市场时 |

### Claude Code 插件市场

```text
/plugin install superpowers@claude-plugins-official
```

或者先注册作者自己的市场：

```text
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### 其它宿主

| 客户端 | 命令 |
|---|---|
| Antigravity | `agy plugin install https://github.com/obra/superpowers` |
| Cursor | 在插件市场里搜 Superpowers |
| Codex CLI | `/plugins` 后搜 `superpowers` |
| Gemini CLI | 见 README 的 Gemini 章节 |
| GitHub Copilot CLI | `copilot plugin install superpowers@superpowers-marketplace` |
| OpenCode / Kimi / Pi / Qwen Code | 各自插件目录安装 |

### 装完什么效果

新开一个会话说「帮我做一个 React 待办清单」，正常会看到这个顺序：

1. `brainstorming` —— 先反问你到底要什么
2. `writing-plans` —— 把活拆成 2-5 分钟一个的小任务
3. `test-driven-development` —— 先写失败的测试，再写实现
4. `requesting-code-review` —— 每个任务完成后审查

如果它直接开始写代码，说明技能没被加载，检查技能目录路径是否正确。

> ⚠️ 钩子（SessionStart）需要插件方式安装才会生效；手动复制的技能需要你主动提一句「用 superpowers 的方式来做」。

## 常见坑

- 技能不触发：确认装到了客户端真正读取的目录，路径别写错
- 手动复制后没反应：钩子没装，改成插件安装，或在对话里点名用 superpowers
- 觉得太啰嗦：官方建议简单任务自行判断，不必每个改动都走全流程
- 子代理任务失败：先看它读到的计划文件路径是否正确
- 和已有 skills 冲突：同名技能会被覆盖，装前先备份技能目录
- Claude Code 找不到插件：先 `/plugin marketplace add` 再安装

## 免责声明

本仓库为第三方指南，与 Superpowers 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/obra/superpowers#installation)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
