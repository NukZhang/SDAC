# SDAC-Team 协作规则（v1.1）

目标：在多人 + 多 AI 并行开发时，保持工程可控、责任清晰、状态稳定。

## 核心原则
1. **Me2AI 只允许 Spec Owner 修改**
2. **main 只允许 Release Owner 合并**
3. **并行执行、串行集成**（Parallel Execution, Serial Integration）
4. **Lane 隔离**：每个 AI Worker 只能改 Allowed Paths
5. **AI2AI 只写事实状态**（State, not logs）
6. **Gate 闸门**：设计闸 / 实现闸 / 合并闸（每闸必须有证据链）

---

## 角色定义
- Spec Owner（SO）：唯一需求来源；维护 `spec/Me2AI/*`
- Release Owner（RO）：集成者；唯一允许合并 main；负责 gate 与回滚
- Module Owner（MO）：模块边界守门；提供 lane 与契约
- AI Worker（AI-W）：执行单元；只做最小可完成集；只改 allowed paths
- QA / Verifier（QV）：验收与审查；提供测试证据与通过结论

---

## RACI（责任矩阵）

| 产物/动作 | SO | RO | MO | AI-W | QV |
|---|---|---|---|---|---|
| 修改 Me2AI | R/A | C | C | - | C |
| 拆 Iteration / Issue | R | A | C | C | C |
| 写代码 | - | C | A | R | C |
| 更新 AI2AI | - | C | A | R | C |
| 合并到 main | - | R/A | C | - | C |
| 运行验收 | - | C | C | C | R/A |

---

## Lane 隔离（强制）
每个任务必须定义：
- Lane（模块/域）
- Allowed Paths（允许修改路径）
- Forbidden Paths（禁止修改路径）

MO 负责提供 `modules.<module>.lane`（建议写入共享记忆或仓库文件）。

---

## Gate 闸门（强制）

### Gate D：Design Gate
必须具备：
- Me2AI 已明确本次迭代目标与验收口径
- AI2AI 中已写明：scope/non-goals/lane/acceptance/evidence plan
- 若涉及接口/数据变化：必须有 ADR（含 rollback）

### Gate I：Implementation Gate
必须具备：
- 只修改 allowed paths
- 有可复现验证命令
- 更新 AI2AI（只写事实）

### Gate M：Merge Gate
必须具备：
- QV 提供 `qa.findings`（命令 + 结果 + 结论）
- reviewer 审查通过（无越界/可回滚）
- release.notes 补齐

---

## 任务合同（每个 Issue 必须包含）

```md
# Task Contract

- Issue / Iteration:
- Owner Role: (AI-W / MO / QV / RO)
- Lane:
- Allowed Paths:
- Forbidden Paths:
- Scope:
- Non-goals:
- Acceptance:
- Evidence Required:
  - Commands:
  - Expected Output:
- Rollback Plan:
```

---

## 可复制 project_rules
见：`spec-team/project_rules.yaml`
