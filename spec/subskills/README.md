# 子 Skill 母模版（武器 / AI / 状态机）

## 使用方式

在启用总 SKILL 的前提下，将对应子 Skill 作为附加约束加入 prompt：

- 涉及武器迭代：启用 `子Skill_WeaponSystem.md`
- 涉及 NPC/角色 AI：启用 `子Skill_AISystem.md`
- 涉及状态逻辑：启用 `子Skill_StateMachine.md`

推荐组合：
- 弓：Weapon + StateMachine
- NPC：AI + Weapon
- 冲刺/死亡：StateMachine（必要时再加 Weapon）

## 文件列表
- 子Skill_WeaponSystem.md
- 子Skill_AISystem.md
- 子Skill_StateMachine.md
