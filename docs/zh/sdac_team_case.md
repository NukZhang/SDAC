# SDAC-Team 实战白皮书

> **How Multi-Human + Multi-AI Collaboration Actually Works in Practice**  
> 一个真实、可复刻的 SDAC-Team 项目全流程解析

---

## 前言：为什么需要一份「实战白皮书」

在理解 SDAC（Spec-Driven AICoding）之后，一个自然的问题是：

> **“这套东西在真实多人、多 AI 场景下，真的跑得起来吗？”**

本白皮书不再讲方法论，而是用一个 **repo 级真实案例**，完整复盘：

- 多人角色如何分工
- 多 AI 如何并行而不互相踩踏
- 工程如何在多天、多迭代后依然可控

如果你只想看结论：

> **SDAC-Team 可以把多 AI 协作，从高风险试验，变成可预测的工程流程。**

---

## 1. 案例背景

### 1.1 项目类型

- 类型：Canvas Game（简化示例）
- 性质：中等复杂度、多系统协作
- 周期：多天、分阶段迭代

### 1.2 为什么选这个案例

这个案例同时具备：

- 多系统（Player / Weapon / AI / State）
- 可并行拆分的模块
- 明确的迭代边界

非常适合验证 **多 AI 并行 + 串行集成** 是否可行。

---

## 2. 团队与 AI 角色设置

### 2.1 人类角色

- **Spec Owner（SO）**
  - 唯一可修改 Me2AI 的角色
  - 决定需求、约束与迭代顺序

- **Release Owner（RO）**
  - main 分支的唯一闸门
  - 负责串行合并与回滚决策

### 2.2 AI 角色

- **AI Worker A（Lane A / Player）**
- **AI Worker B（Lane B / Weapon）**

每个 AI Worker 都：

- 绑定一个 Lane
- 只允许修改指定路径
- 严格遵守 SDAC SKILL 与子 Skill

> **AI 在这里不是“虚拟开发者”，而是“受限执行单元”。**

---

## 3. 项目初始化（Day 0）

### 3.1 定义 Me2AI

Spec Owner 在项目开始前完成：

- `需求描述.md`
- `技术约束.md`
- `迭代规划.md`

明确声明：

- Iteration 1：Player 移动 + Bow 攻击
- Iteration 2：Enemy AI

此时 **没有任何 AI 参与需求讨论**。

---

### 3.2 划分并行泳道（Work Lanes）

Iteration 1 被拆分为：

- **Lane A：Player**
- **Lane B：Weapon（Bow）**

每条 Lane 都有：

- Allowed Paths
- Forbidden Paths
- 对应 Module Owner

这一步的作用是：

> **在 AI 写任何代码之前，就先锁死它的活动范围。**

---

## 4. 并行执行阶段（Day 1–2）

### 4.1 AI Worker A：Player 移动

- 读取 Me2AI
- 确认 Iteration 1
- 仅在 `src/player/**` 内实现
- 不引入任何 Weapon / AI 逻辑

执行结果：

- Player 基础移动完成
- 更新 AI2AI：记录“Player 移动已完成”这一事实

---

### 4.2 AI Worker B：Bow 攻击

- 读取 Me2AI
- 启用 Weapon 子 Skill
- 仅实现攻击判定

**刻意不做的事**：

- 不写自动瞄准
- 不写敌人逻辑
- 不设计多武器系统

执行结果：

- Bow 攻击框判定完成
- AI2AI 记录：Weapon 仅负责攻击

---

## 5. 串行集成阶段（Day 3）

### 5.1 合并顺序

Release Owner 按顺序：

1. 合并 Lane A（Player）
2. 验证可运行
3. 合并 Lane B（Weapon）

每次合并前都执行：

- Checklist
- AI2AI 更新检查

---

### 5.2 为什么不用“并行合并”

经验结论：

> **并行开发可以，但集成必须串行。**

这极大降低了：

- 冲突复杂度
- 回滚成本
- 责任不清的问题

---

## 6. 状态治理：AI2AI 的实际作用

在 Day 3 结束时，AI2AI 被压缩为：

- 当前稳定架构
- Iteration 1 已完成事实
- Weapon 不含 AI 行为的约束

这使得在 Day 4 开始 Iteration 2 时：

- 新 AI Worker 不需要“补课”
- 不会引用过期设计

---

## 7. 如果发生违规，会怎样

假设：

> AI Worker B 在 Bow 中加入自动寻敌逻辑

处理流程：

1. Checklist 命中 Weapon 越权
2. 触发自我裁决（B 级）
3. 输出 Minimal Fix Diff
4. 删除寻敌逻辑
5. 更新 AI2AI

**没有人类来回解释，也没有争论。**

---

## 8. 这个案例验证了什么

通过这个真实案例，可以确认：

- 多 AI 并行是可行的
- 失控不是 AI 能力问题，而是治理缺失
- 串行集成 + 并行执行是稳定组合
- AI2AI 状态治理是长期项目的关键

---

## 9. 与传统方式的对比

| 维度 | 传统 AI Coding | SDAC-Team |
|---|---|---|
| 并行 | 容易互踩 | 有边界 |
| 回滚 | 困难 | 低成本 |
| 责任 | 模糊 | 明确 |
| 长期演进 | 易崩 | 可持续 |

---

## 10. 一句话总结

> **SDAC-Team 不是让 AI 更聪明，
> 而是让多 AI 像一个真正的软件团队一样工作。**

---

## 后记

如果你已经用 AI 写过真实项目，你会知道：

- 失控不是偶发事件
- 而是必然结果

SDAC-Team 提供的不是技巧，而是一条 **工程化出路**。

