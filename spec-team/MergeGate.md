# Merge Gate（合并闸门）

合并到 main 前必须满足：
- [ ] PR 只修改 Allowed Paths（越界直接退回）
- [ ] 通过 SDAC Checklist
- [ ] 如发生违规：先提供 Minimal Fix Diff
- [ ] AI2AI 已更新（只写事实）
- [ ] 有验收证据（运行步骤/截图/日志）

合并策略：**串行合并**，一次只合一个 Lane。
