# Spec-Driven AICoding（SDAC）

> **Make AI Executable, Not Creative.**  
> A governance-first methodology for AI-assisted software engineering.

本仓库是 SDAC（Spec-Driven AICoding）对外发布的"工程化模板"，包含：

- 白皮书（方法论 + 实战示例，含 Mermaid 架构图）
- Spec 分权模板（Me2AI / AI2AI）
- SDAC 治理工具链（Checklist / 自我裁决 / Minimal Fix Diff / 状态压缩 / 一键总控）
- 子 Skill 模板（Weapon / AI / State Machine）
- Claude-Flow 编排模板（可选：多代理 + 共享记忆 + 工作流串联）

## 快速使用（3 分钟）

1) 阅读白皮书：`docs/zh/whitepaper.md`  
2) 阅读快速上手：`docs/zh/quickstart.md`  
3) 在真实项目中复制 `spec/` 目录（建议整个目录原样拷贝）  
4) 人类只维护 `spec/Me2AI/*`  
5) AI 只维护 `spec/AI2AI/AI2AI.md`，并严格遵循 `spec/SKILL.md`

## 目录导航

- 白皮书：`docs/zh/whitepaper.md`
- 快速上手：`docs/zh/quickstart.md`
- Claude-Flow 编排包：`docs/zh/claude-flow-pack.md`
- 执行规范（AI 必读）：`spec/SKILL.md`
- 一键总控 Prompt：`spec/OneKey_Control_Prompt.md`
- SDAC-Team 协作规则：`spec-team/SDAC-Team.md`
- 工具索引：`tools/README.md`

## 许可

MIT License，见 `LICENSE`。
