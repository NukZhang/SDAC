# Refactor / Consolidation Checklist（ADR / Batches / Cleanup / Release）

## ADR Gate
- [ ] 目标边界清晰（domain/service ownership）
- [ ] 禁止链路清单（forbidden calls）
- [ ] 迁移原则明确
- [ ] 回滚预案存在

## Batch Gate（每批必过）
- [ ] 每批 scope/steps/rollback/tests 齐全
- [ ] 每批都有可验证指标与证据

## Cleanup Gate
- [ ] 删除清单明确（delete_list）
- [ ] 无引用/无调用（证据）
- [ ] 核心链路回归通过

## Release Gate
- [ ] release.notes 完整
- [ ] 关键指标对比（如适用）
