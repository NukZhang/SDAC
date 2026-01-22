# SDAC-Team in Practice

> **How Multi-Human + Multi-AI Collaboration Actually Works**  
> A real, reproducible case study under SDAC-Team

---

## Abstract

SDAC-Team is the team-scale extension of Spec-Driven AICoding (SDAC).
It is designed to answer a critical question:

> **Can multiple humans and multiple AI workers collaborate on the same codebase without losing control?**

This document presents a real, repo-level case study demonstrating that the answer is **yes—if governance comes first**.

---

## 1. Case Overview

### Project Type

- Simplified Canvas-based game
- Multiple interacting systems
- Iterative, multi-day development

### Why This Case Matters

This project includes exactly the conditions where AI coding usually fails:

- Parallel work streams
- Overlapping concepts (player, weapon, AI, state)
- Incremental requirements

SDAC-Team was applied from Day 0.

---

## 2. Roles and Responsibilities

### Human Roles

- **Spec Owner (SO)**  
  Owns Me2AI specifications. The only source of requirements.

- **Release Owner (RO)**  
  Controls the main branch. All integrations are serialized.

- **Module Owners (MO)**  
  Guard system boundaries and interfaces.

### AI Roles

- **AI Worker A (Lane: Player)**
- **AI Worker B (Lane: Weapon)**

Each AI worker:
- Is bound to one iteration
- Is restricted to one work lane
- Can only modify explicitly allowed paths

AI is treated as a **constrained executor**, not a peer decision-maker.

---

## 3. Day 0: Specification and Setup

Before any AI writes code, the following are completed:

- Me2AI requirements
- Technical constraints
- Iteration plan
- Work lane definitions

Iteration 1 is explicitly defined as:

- Player movement
- Bow weapon (attack only)

No AI participates in requirement discussion.

---

## 4. Parallel Execution (Day 1–2)

### Lane A: Player Movement

AI Worker A:
- Reads Me2AI
- Confirms Iteration 1 scope
- Implements movement logic only
- Updates AI2AI with factual completion state

No weapon or AI logic is introduced.

---

### Lane B: Bow Weapon

AI Worker B:
- Activates Weapon sub-skill
- Implements hitbox-based attack
- Explicitly avoids enemy logic

What is deliberately *not* done:
- No targeting logic
- No weapon system abstraction

This restraint is enforced structurally, not by instruction reminders.

---

## 5. Serial Integration (Day 3)

All integration is handled by the Release Owner.

Integration order:
1. Merge Player lane
2. Verify runtime behavior
3. Merge Weapon lane

Each merge requires:
- Passing the violation checklist
- Updated AI2AI state

Parallel execution, serial integration proves to be the stability anchor.

---

## 6. State Governance in Practice

After Iteration 1, AI2AI is compressed into:

- Stable architecture snapshot
- Completed iteration facts
- Active constraints (e.g., weapon contains no AI)

This enables Iteration 2 to start without re-explaining history.

---

## 7. Handling Violations

Consider a hypothetical failure:

> AI Worker B adds auto-targeting logic to the Bow.

Resolution under SDAC-Team:

1. Checklist flags system boundary violation
2. Self-adjudication classifies severity
3. Minimal Fix Diff removes targeting logic
4. AI2AI state is updated

No debate. No reinterpretation. Just rollback.

---

## 8. What This Case Proves

This case demonstrates that:

- Multi-AI parallelism is viable
- Governance scales better than supervision
- Serial integration reduces complexity
- State snapshots outperform conversational memory

Most importantly:

> **Loss of control is not inevitable. It is optional.**

---

## 9. Comparison with Ungoverned AI Coding

| Dimension | Ungoverned | SDAC-Team |
|---|---|---|
| Parallel work | Chaotic | Bounded |
| Integration | Risky | Controlled |
| Rollback | Expensive | Cheap |
| Responsibility | Blurred | Explicit |
| Longevity | Fragile | Sustainable |

---

## 10. Conclusion

SDAC-Team reframes AI collaboration as an organizational problem, not a model problem.

> **Multiple AI workers can be productive—  
> but only inside a system that enforces boundaries, ownership, and rollback.**

This case confirms that SDAC-Team is not theoretical.
It works in practice.
