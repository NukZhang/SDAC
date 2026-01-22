# Spec-Driven AICoding (SDAC) Whitepaper

> **A Governance-First Methodology for AI-Assisted Software Engineering**

---

## Abstract

Spec-Driven AICoding (SDAC) is a methodology designed to make AI usable in real, long-running software projects.
Instead of optimizing for generation quality, SDAC optimizes for **control, auditability, rollback, and sustainability**.

SDAC introduces an explicit governance layer between AI and code, redefining AI as an *execution unit* rather than an autonomous developer.

---

## 1. Introduction

AI coding tools have demonstrated impressive short-term productivity gains.
However, teams consistently report failures when projects extend beyond a few iterations.

Common failure modes include:
- Uncontrolled scope expansion
- Early architectural commitment
- Context drift over long conversations
- Inability to audit or rollback changes

SDAC addresses these failures structurally, not heuristically.

---

## 2. Design Goals

SDAC is built around four non-negotiable goals:

1. **Controllability** – AI behavior must be predictable
2. **Auditability** – All changes must be reviewable
3. **Rollbackability** – Errors must be reversible
4. **Longevity** – Projects must survive long timelines

Any AI behavior that violates these goals is considered a failure, regardless of output quality.

---

## 3. Core Assumptions

SDAC makes several pragmatic assumptions:

- AI will extrapolate beyond instructions
- Long projects require explicit state management
- Engineering systems require governance, not trust

Therefore, SDAC does not rely on AI alignment or intent.
It relies on **rules, structure, and enforcement**.

---

## 4. Spec-Driven Control Model

### 4.1 Spec Separation

SDAC separates specification into two layers:

- **Me2AI Spec** – Human-authored intent and constraints
- **AI2AI State** – AI-maintained execution snapshot

This separation prevents conversational history from becoming implicit truth.

---

### 4.2 Spec Priority

When conflicts arise, SDAC enforces the following priority:

1. Me2AI Spec
2. Governance Rules (SKILL / Sub Skills)
3. AI2AI State
4. Code

Resolution always moves *upward*.

---

## 5. Governance Layer

The governance layer is the defining feature of SDAC.

It consists of:

- **SDAC SKILL** – Global behavioral constraints
- **Sub Skills** – System-specific boundaries
- **Violation Checklist** – Detection mechanism
- **Self-Adjudication** – Severity classification
- **Minimal Fix Diff** – Auditable repair
- **State Compression** – Long-term stability

This layer constrains AI **before** execution occurs.

---

## 6. Execution Model

AI execution under SDAC is deliberately narrow:

- Implement only the current iteration
- Produce minimal completion sets
- Avoid architectural refactoring
- Avoid future-oriented abstractions

AI is evaluated by **discipline**, not creativity.

---

## 7. Control Loop

SDAC enforces a continuous correction loop:

1. Detect violations
2. Classify severity
3. Apply minimal diffs
4. Compress state

This loop replaces conversational correction with structural correction.

---

## 8. Comparison with Other Approaches

| Approach | Primary Focus | Failure Mode |
|---|---|---|
| Prompt Engineering | Output quality | Drift, inconsistency |
| Agent Swarms | Autonomy | Unbounded behavior |
| SDAC | Governance | Reduced creativity |

SDAC explicitly trades creativity for reliability.

---

## 9. Applicability

SDAC is suitable for:

- Long-running projects
- Engineering teams
- Systems with real maintenance costs

It is unsuitable for:

- One-off scripts
- Exploratory research
- Creative generation tasks

---

## 10. Conclusion

SDAC reframes AI coding as an engineering control problem.

> **The question is not whether AI can write code.  
> The question is whether AI can be governed.**

SDAC answers this question in the affirmative.

---

## Definition

> **Spec-Driven AICoding is a governance-first methodology that makes AI controllable, auditable, and sustainable in real software engineering.**
