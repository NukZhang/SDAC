# Quickstart（SDAC）

## 0. 你要做的事

- 人类：写清楚“要什么 + 约束是什么”（Me2AI）
- AI：只做“可执行的最小实现 + 证据链”（AI2AI），不要发挥

## 1. 拷贝模板到真实项目

把本仓库的 `spec/` 整个目录复制到你的项目根目录：

- `spec/Me2AI/`（人类维护）
- `spec/AI2AI/`（AI 维护）
- `spec/SKILL.md`（AI 执行规范）

## 2. 人类先写 Me2AI（只写最小可用）

- `spec/Me2AI/需求描述.md`
- `spec/Me2AI/技术约束.md`

写完后，你可以给 AI 一句指令：

> “请先阅读 spec/Me2AI 下相关内容，严格按 spec/SKILL.md 的流程执行，并把执行状态写入 spec/AI2AI/AI2AI.md。”

## 3. AI 执行（只做最小可完成集）

AI 的工作顺序（强制）：

1) 读 Me2AI
2) 对齐既有 AI2AI（保持一致性）
3) 拆解并只实现当前迭代的最小可完成集
4) 输出可验证结果（命令/截图/日志摘要）
5) 更新 AI2AI（只写事实状态）

## 4. 当 AI 漂移时：一键总控

使用：`spec/OneKey_Control_Prompt.md`

它会串联：违规检测 → 自我裁决/回滚 → 最小修复 diff → AI2AI 压缩。
