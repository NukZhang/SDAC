# Minimal Fix Diff Mode（最小修复模式）

> 目的：让修复可审计、可回滚、可复现。  
> 顺序：**删除 > 回退 > 替换 > 新增**（新增永远最后）

## 规则
1. 优先输出 unified diff（最小变更）
2. 若上下文不足，输出 DIFF-PLAN：
   - files_to_change
   - exact edits
   - verification commands
3. 修复后必须再次跑 Checklist
4. 若仍不通过：继续下一轮最小 diff（不要扩大范围）

## 输出模板

### unified diff
```diff
*** a/path/file
--- b/path/file
@@
- old
+ new
```

### DIFF-PLAN（当无法给 diff）
```json
{
  "files_to_change": [],
  "edits": [],
  "verification": {
    "commands": [],
    "expected": []
  }
}
```
