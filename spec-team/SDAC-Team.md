# SDAC-Team 协作规则（v1.0）

目标：在多人 + 多 AI 并行开发时，保持工程可控、责任清晰、状态稳定。

## 核心原则
1. **Me2AI 只允许 Spec Owner 修改**
2. **main 只允许 Release Owner 合并**
3. **并行执行、串行集成**（Parallel Execution, Serial Integration）
4. **Lane 隔离**：每个 AI Worker 只能改 Allowed Paths
5. **AI2AI 只写事实状态**（State, not logs）

## 角色
- Spec Owner（SO）：唯一需求来源
- Release Owner（RO）：main 闸门与回滚决策
- Module Owner（MO）：模块边界与接口守门
- AI Worker（AI-W）：受限执行单元

## 任务合同（每个 Issue 必须包含）
- Iteration
- Lane
- Allowed Paths
- Acceptance（验收证据）
