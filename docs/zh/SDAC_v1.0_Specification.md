# SDAC v1.0 Specification

> **Spec‑Driven AICoding v1.0**  
> Governance‑First AI Software Engineering Methodology

---

## 1. Purpose

SDAC（Spec‑Driven AICoding）v1.0 的目标是：

> **在真实、长期的软件工程中，使 AI 的行为可控、可审计、可回滚、可持续。**

SDAC 不追求让 AI 更聪明，而是追求：
- 行为可预测
- 结果可验证
- 状态可维护

---

## 2. Scope（解决什么问题）

SDAC v1.0 适用于：

- 中长期软件项目
- AI 负责行级 / 模块级编码
- 人类负责需求与决策
- 需要多轮迭代与状态延续的工程

SDAC 明确解决的问题包括：

- AI 擅自扩展需求
- AI 跨迭代实现
- AI 提前抽象 / 架构设计
- 长期对话导致的上下文漂移
- 修改不可审计、不可回滚

---

## 3. Non‑Goals（明确不做什么）

SDAC v1.0 **不解决** 以下问题：

- 提升 AI 的创造力或生成质量
- 让 AI 自动决定需求或产品方向
- 完全自治的 Agent Swarm 协作
- 强探索性、一次性原型开发
- 创意写作或内容生成场景

> **如果你的目标是“让 AI 自由发挥”，那么 SDAC 不适合你。**

---

## 4. Core Concepts（核心概念）

### 4.1 Spec Priority

SDAC 强制规定以下优先级（高 → 低）：

1. Me2AI Spec（人类意图与约束）
2. SDAC SKILL / Sub Skills（行为法律）
3. AI2AI State（执行状态）
4. Code Implementation（代码本身）

任何冲突必须按此顺序回滚。

---

### 4.2 Spec Separation

- **Me2AI**：人类维护，AI 只读
- **AI2AI**：AI 维护，仅记录“当前可执行事实”

AI 不得在 AI2AI 中新增需求、设计或未来规划。

---

### 4.3 Governance Layer

SDAC 在 AI 与代码之间引入 **治理层**，由以下组成：

- SDAC SKILL（总行为规则）
- Sub Skills（系统边界规则）
- Checklist / 裁决 / Diff / 压缩（纠偏闭环）

> **治理层的存在优先级高于 AI 的智能。**

---

## 5. Invariants（不可破坏的工程不变量）

以下规则在 SDAC v1.0 中不可被破坏：

1. AI 不得修改 Me2AI
2. AI 不得跨迭代实现
3. AI 不得提前抽象或重构架构
4. AI2AI 必须可压缩、可重写
5. 所有违规必须可回滚

任何破坏以上不变量的用法，均视为 **不符合 SDAC**。

---

## 6. Execution Model（执行模型）

SDAC 的执行模型是：

```text
Spec → Governance → Execution → State → Control Loop
```

而不是：

```text
Prompt → AI → Code
```

---

## 7. Compatibility

### 适用：
- 前端 / 游戏 / 工具型项目
- 小团队或个人长期项目
- AI 辅助工程而非替代决策

### 不适用：
- 强探索性研究
- 完全自治 Agent 系统
- 无需维护的一次性脚本

---

## 8. Versioning Policy

- v1.x：规则冻结，仅做澄清与工具补充
- v2.0：可能引入更复杂的协作模型或自动化治理

---

## 9. One‑Sentence Definition

> **SDAC v1.0 is a governance‑first methodology that makes AI executable, auditable, and sustainable in real software engineering.**

