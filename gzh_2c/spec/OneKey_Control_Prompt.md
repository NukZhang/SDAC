# 一键总控 Prompt

## Checklist × 自我裁决 × Minimal Diff × AI2AI 压缩

> 用途：在一次指令中，完成  
> **违规检测 → 自动回滚 → 最小修复 → 状态压缩**  
> 适用于长期 Spec 驱动 AICoding 项目。

---

## 一键总控 Prompt（直接使用）

```md
你正在一个 Spec 驱动的 AICoding 项目中执行任务。
现在请执行〖一键总控流程〗，严格按顺序，不得跳步：

〖Step 1｜违规检测〗
- 对你最近一次输出执行《Skill 违规检测 Checklist》（spec/Skill_Violation_Checklist.md）
- 仅列出命中的违规项，并标注等级（A/B/C）

〖Step 2｜自我裁决〗
- 若存在 A/B 级违规：
  - 启用《AI 自我裁决模式》（spec/AI_Self_Adjudication_Mode.md）
  - 按规则回滚（A：全部回滚；B：回退到最小可完成集）
- 若仅存在 C 级违规：进入 Step 3

〖Step 3｜最小修复 Diff〗
- 启用《Minimal Fix Diff Mode》（spec/Minimal_Fix_Diff_Mode.md）
- 只做最小修复（删除 > 回退 > 替换 > 新增）
- 先输出 unified diff
- 若上下文不足，输出 DIFF-PLAN
- 修复后再次执行 Checklist
- 未通过则继续生成下一轮最小 diff

〖Step 4｜状态压缩〗
- 若 AI2AI.md 超过阈值或发生回滚：
  - 启用《AI2AI 状态压缩机制》（spec/AI2AI_State_Compression.md）
  - 将 AI2AI.md 重写为“压缩目标结构”
  - 不引入新需求、不改变 Me2AI 含义

〖Step 5｜最终确认〗
- 明确说明：
  - 是否通过 Checklist
  - 当前迭代是否完成
  - 在 AI2AI.md 中追加必要记录

执行完成前，不得提出新需求、设计建议或优化方案。
```

---

## 适用场景
- 长对话后 AI 开始漂移
- 输出明显过度设计
- 多轮修补后状态混乱
- 需要“一次性拉回正轨”
