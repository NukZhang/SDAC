# Feature Checklist（Gate D / I / M）

## Gate D（设计闸）
- [ ] Me2AI 中找到本迭代目标与验收口径
- [ ] AI2AI 已写：scope / non-goals / lane / acceptance / evidence plan
- [ ] 有 ADR（若涉及接口/数据变化，且包含 rollback）

## Gate I（实现闸）
- [ ] 只修改 Allowed Paths（无越界）
- [ ] 提供可复现命令（build/test/run）
- [ ] 证据：日志/截图/输出摘要
- [ ] AI2AI 已更新（只写事实）

## Gate M（合并闸）
- [ ] qa.findings：命令 + 结果 + 结论（pass/fail）
- [ ] reviewer.approved=true（无越界、可回滚）
- [ ] release.notes：变更摘要 + 影响面 + 回滚步骤
