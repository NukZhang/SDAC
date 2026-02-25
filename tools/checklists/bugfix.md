# Bugfix Checklist（Repro / Fix / Verify）

## Repro Gate
- [ ] 最小复现步骤清晰
- [ ] 环境信息齐全（版本/配置）
- [ ] expected vs actual 明确
- [ ] 需要的日志/指标已列出

## Fix Gate
- [ ] 根因定位完成（影响面评估）
- [ ] 最小修复方案（不做额外重构）
- [ ] 回滚步骤明确

## Verify Gate
- [ ] 回归计划（commands + scope）
- [ ] 结果证据（日志摘要）
- [ ] 结论（pass/fail）可判定
