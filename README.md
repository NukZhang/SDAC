# Spec-Driven AICoding（SDAC）

> **Make AI Executable, Not Creative.**  
> A governance-first methodology for AI-assisted software engineering.

本仓库是 SDAC（Spec-Driven AICoding）对外发布的“工程化模板”，包含：
- 白皮书（方法论 + 实战示例，含 Mermaid 架构图）
- Spec 分权模板（Me2AI / AI2AI）
- SDAC 治理工具链（Checklist / 自我裁决 / Minimal Fix Diff / 状态压缩 / 一键总控）
- 子 Skill 模板（Weapon / AI / State Machine）

## 快速使用
1. 阅读 `docs/zh/whitepaper.md`
2. 在真实项目中复制 `spec/` 目录
3. 人类只维护 `spec/Me2AI/*`
4. AI 只维护 `spec/AI2AI/AI2AI.md`，并严格遵循 `spec/SKILL.md`
