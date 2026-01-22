# SDAC‑Team v1.0 Specification

> **Team‑Scale Governance for Multi‑Human + Multi‑AI Collaboration**

---

## 1. Purpose

SDAC‑Team v1.0 是 SDAC 的团队扩展版本，目标是：

> **在多人 + 多 AI 并行开发场景中，保持工程可控、责任清晰、状态稳定。**

它回答的问题不是“能不能并行”，而是：

> **并行之后，项目还能不能持续推进。**

---

## 2. Scope

SDAC‑Team v1.0 适用于：

- 2 人及以上协作项目
- 多个 AI Worker 并行执行任务
- 需要模块分工与责任边界
- 需要长期维护的工程

---

## 3. Non‑Goals

SDAC‑Team v1.0 **明确不追求**：

- 完全自治的 AI Agent Swarm
- 无中心的并行合并策略
- AI 自行协商需求与接口
- 去人类决策的工程流程

> **SDAC‑Team 假设：治理优先于自治。**

---

## 4. Core Principles

### 4.1 Single Source of Authority

- Me2AI 由 Spec Owner 唯一维护
- main 分支由 Release Owner 唯一控制

避免“多头真相”。

---

### 4.2 Parallel Execution, Serial Integration

- **执行可以并行**（多 Lane / 多 AI）
- **集成必须串行**（单一合并闸门）

这是 SDAC‑Team 最重要的稳定性原则。

---

### 4.3 Lane Isolation

每个 AI Worker 必须绑定：

- 一个 Iteration
- 一个 Lane
- 一组 Allowed Paths

任何越界修改都视为违规。

---

## 5. Roles & Responsibilities

### 人类角色

- **Spec Owner（SO）**：需求与约束的唯一来源
- **Module Owner（MO）**：模块边界与接口守门人
- **Release Owner（RO）**：主干合并与回滚决策者

### AI 角色

- **AI Worker（AI‑W）**：受限执行单元，仅实现任务合同

---

## 6. Governance Mechanisms

SDAC‑Team 继承并强化 SDAC 的治理机制：

- Checklist（违规检测）
- Self‑Adjudication（分级裁决）
- Minimal Fix Diff（最小补丁）
- AI2AI State Compression（状态压缩）

并额外引入：

- Work Lanes
- Merge Gate
- CODEOWNERS

---

## 7. Invariants（团队级不变量）

以下规则在 SDAC‑Team v1.0 中不可破坏：

1. Me2AI 只允许 Spec Owner 修改
2. main 只允许 Release Owner 合并
3. AI Worker 只能修改 Allowed Paths
4. 合并必须串行
5. AI2AI 只能记录事实状态

---

## 8. Failure Handling

当发生违规或冲突时：

1. 优先回滚到最近稳定状态
2. 使用 Minimal Fix Diff 修复
3. 更新 AI2AI 状态
4. 必要时收紧 Lane 或 Allowed Paths

**不进行临场争论，不靠记忆兜底。**

---

## 9. Compatibility

### 适用：
- 中小型工程团队
- 游戏 / 前端 / 工具型项目
- 希望减少 AI 管理成本的团队

### 不适用：
- 强探索性研究团队
- 无中心自治组织
- 完全去治理的 Agent 实验

---

## 10. One‑Sentence Definition

> **SDAC‑Team v1.0 is a governance‑driven collaboration model that enables multiple humans and multiple AI workers to build software without losing control.**

