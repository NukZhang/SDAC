# SDAC-Team：团队 / 多 AI 并行版本（v1）

---

## 1 团队结构与职责 RACI

### 角色定义 最小但够用

Spec Owner SO  
唯一能修改 Me2AI 的人或小组

Integrator / Release Owner RO  
唯一能合并 main 主干的人 也是合并闸门

Module Owner MO  
某模块代码所有者 如 Weapon AI State Render

AI Worker AI-W  
按任务实现行级代码 只能修改指定范围

QA / Verifier QV  
验收迭代的可运行结果 可以是人也可以是 AI

---

### RACI 责任矩阵

产物或动作 | SO | RO | MO | AI-W | QV
--- | --- | --- | --- | --- | ---
改 Me2AI | R/A | C | C | - | C
拆 Iteration Issue | R | C | C | C | C
写代码 | - | C | A | R | C
更新 AI2AI | - | C | A | R | C
合并到 main | - | R/A | C | - | C
运行验收 | - | C | C | C | R/A

关键规则  
Me2AI 只有 Spec Owner 能改  
main 只有 Release Owner 能合

---

## 2 多 AI 并行的基本原则 防失控三条铁律

单迭代 多分支  
同一迭代允许多任务并行 但每个任务必须有明确范围

模块边界锁定  
每个 AI Worker 只能修改被分配模块的文件集合

集成只能一次一个  
main 合并必须串行 由 Release Owner 控制

---

## 3 SDAC-Team 的工程目录结构 建议

在现有 SDAC 工程模板上增加以下目录
```text
/spec
  /Me2AI              # SO 唯一可改
  /AI2AI              # AI 可写，但受规则约束
  /team
    SDAC-Team.md      # 团队协作规则（本文）
    CODEOWNERS.md     # 模块归属
    WorkLanes.md      # 并行泳道/任务分配
    MergeGate.md      # 合并闸门规则
```

并新增 GitHub 配置 强烈建议
```text
/.github  
  /ISSUE_TEMPLATE  
  /PULL_REQUEST_TEMPLATE.md  
  /workflows  
```
---

## 4 并行泳道机制 Work Lanes

把一个迭代拆成多个 Lane  
每条 Lane 对应一个模块范围  
AI 只能在自己的 Lane 中工作

### Lane 定义模板 WorkLanes.md

```
## Iteration X

### Lane A Weapon
Owner @MO-Weapon
Allowed Paths
- src/weapon/**
- src/combat/**
Forbidden
- src/ai/**
- src/state/**

### Lane B AI
Owner @MO-AI
Allowed Paths
- src/ai/**
Forbidden
- src/weapon/**
- src/state/**
```

---

## 5 多 AI 的任务合同 Task Contract

每个并行任务 Issue 必须包含以下四项

Iteration  
当前迭代号

Lane  
所属泳道

Allowed Paths  
允许修改的路径白名单

Acceptance  
验收方式 如可运行 截图 日志

这是将 AI 自由度关进围栏的关键

---

## 6 SDAC-Team 合并闸门 Merge Gate

合并到 main 前必须满足

- PR 仅修改 Allowed Paths  
- 通过 Skill 违规检测 Checklist  
- 若有违规 必须先给 Minimal Fix Diff  
- AI2AI 已更新 仅包含事实摘要  
- QV 验收通过

### PR 模板 最小版

```
## Iteration / Lane
Iteration
Lane
Allowed Paths

## Checklist
Passed SDAC Checklist
Updated AI2AI

## Evidence
Run steps screenshot notes
```

---

## 7 多 AI 冲突解决 集成策略

### 规则一 核心文件集成锁

核心文件只允许 RO 或对应 MO 修改  
其他 PR 只能通过接口扩展

### 规则二 接口先行

当多个 Lane 需要动同一核心点

先创建 Interface PR  
由 MO 或 RO 合入 main  
之后各 Lane 只改自己模块

### 规则三 冲突优先删而不是合

发生冲突时优先  
回退到最小实现  
删除非必要改动  
重新按 Lane 生成最小补丁

---

## 8 多 AI Prompt 规范 角色化

### AI Worker Prompt 最小版
```markdown
你是 SDAC-Team 的 AI Worker  
任务属于 Iteration X Lane Y  
只能修改 Allowed Paths  
不得修改 Me2AI  
不得跨迭代 不得提前抽象 不得做架构重构  

输出前必须  
通过 SDAC Checklist  
如修复违规 先输出 Minimal Fix Diff  
更新 AI2AI 仅写事实  
不得写新需求 不得写设计建议 不得写未来规划 不得写讨论过程  
```
---

### Module Owner Prompt 最小版
```markdown
你是 SDAC-Team 的 Module Owner  
职责是审阅该 Lane 的修改是否越界  
是否破坏接口  
是否引入不必要抽象  
不编写大量新代码  
```
---

### Release Owner Prompt 最小版
```markdown
你是 SDAC-Team 的 Release Owner  
职责是按 Merge Gate 串行合并  
必要时要求回滚或最小修复  
你是 main 的唯一闸门  
职责是按 Merge Gate 顺序合并  
必要时要求回滚或最小修复  
```
---

## 9 AI2AI 在团队中的写法

团队模式下 AI2AI 强制分两层

- AI2AI.md:全局压缩态  (仅保留稳定架构 已完成事实 活跃约束)

- AI2AI_Lanes/IterationX-LaneY.md:各 Lane 自己维护局部事实

由 Release Owner 定期触发状态压缩  ,将 Lane 有效结论合并回全局 AI2AI

---

## 10 SDAC-Team 能带来的能力

- 多 AI 并行不互踩  
- 需求不被顺手扩展  
- main 合并可控 可回滚  
- 状态长期可维护 不爆炸

---

一句话定义
```text
SDAC-Team=用工程制度让多 AI 像团队开发一样稳定协作
```
