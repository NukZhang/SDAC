# SDAC × Claude-Flow 编排包（可选）

claude-flow 的定位：多代理编排 + 共享记忆 + workflow 串联。  
SDAC 的定位：治理与可审计的工程化模板。

把两者结合：**SDAC 负责“规矩”，claude-flow 负责“调度/串联/记忆”。**

> 参考：claude-flow workflow orchestration 的 depends + stream-json chaining。  
> 以及 MCP Tools 的 swarm_init/agent_spawn/task_orchestrate 等工具。  
> （详见 claude-flow Wiki：MCP Tools / Workflow Orchestration）

## 1) 角色映射（SDAC → claude-flow agent type）

- RO（Release Owner）→ coordinator / monitor
- MO（Module Owner）→ specialist(module=...) / architect
- AI-W（Worker）→ coder
- QV（Verifier）→ tester / reviewer
- SO（Spec Owner）→ 人类为主，documenter 辅助沉淀（不改 Me2AI）

## 2) Memory 命名规范（建议）

- spec.me2ai.digest
- spec.ai2ai
- adr
- modules.<module>.lane
- tasks.<issueId>
- qa.testplan / qa.findings
- release.notes

## 3) 直接可用的 workflow 模板

- Feature：`.claude/workflows/sdac-feature.json`
- Bugfix：`.claude/workflows/sdac-bugfix.json`
- Refactor：`.claude/workflows/sdac-refactor.json`

这些模板都要求每个步骤输出结构化 JSON，便于 stream-json chaining。

## 4) 推荐 topology

- hierarchical：最贴近 SDAC 的“并行执行、串行集成”
