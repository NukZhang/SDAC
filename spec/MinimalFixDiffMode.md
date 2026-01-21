# 🧩 违规 → 自动生成最小修复 diff（Minimal Fix Diff Mode）

## 定位
当执行《Skill 违规检测 Checklist》发现违规后，AI 必须先生成**最小修复 diff**，
而不是直接重写或扩展代码。

目标：**最小改动、可审计、可回滚**。

---

## 触发条件
- AI 自检发现任意违规（A/B/C）
- 或人类指令：启用 Minimal Fix Diff Mode

---

## 强制输出流程

### 1. 违规命中清单
- 违规等级：A / B / C
- 命中条目：引用 Checklist 原文
- 影响文件范围

---

### 2. 最小修复策略
- 修复顺序：删除 > 回退 > 替换 > 新增（仅必要时）
- 禁止引入新需求或跨迭代内容

---

### 3. 统一 diff 输出（必须）

#### 标准 diff
```diff
diff --git a/src/example.js b/src/example.js
@@ -10,7 +10,7 @@
-  this.vx = targetVx;
+  this.vx += this.ax * dt;
```

#### 上下文不足时（DIFF-PLAN）
```diff
DIFF-PLAN: src/EnemyAI.js
- 删除：AI 直接修改速度/位置的逻辑
+ 新增：移动意图输出（ax, ay）
= 保留：目标选择与刷新逻辑
```

---

### 4. 再校验
- 修复后再次执行 Checklist
- 若仍违规，继续生成下一轮最小 diff

---

### 5. AI2AI 记录（强制）
```md
### 自我裁决记录
- 触发原因：
- 违规等级：
- diff 摘要：
```

---

## 最小修复铁律
- 修复 ≠ 优化
- 禁止顺手重构
- 禁止扩展功能
