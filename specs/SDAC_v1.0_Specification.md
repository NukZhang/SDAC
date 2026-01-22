# SDAC v1.0 Specification

> **Spec-Driven AICoding v1.0**  
> Governance-First AI Software Engineering Methodology

---

## 1. Purpose

SDAC v1.0 aims to make AI behavior **controllable, auditable, rollbackable, and sustainable** in real software projects.

---

## 2. Scope

SDAC v1.0 applies to:
- Long-running software projects
- AI performing line-level / module-level implementation
- Humans owning requirements and decisions
- Multi-iteration delivery with state continuity

Solves:
- Requirement expansion
- Cross-iteration execution
- Early abstraction / architecture drift
- Context drift over time
- Un-auditable changes

---

## 3. Non-Goals

SDAC v1.0 does **not** aim to:
- Increase creativity or “best” code quality
- Let AI decide product direction
- Run fully autonomous agent swarms
- Optimize exploratory prototypes
- Support creative content generation

---

## 4. Sources of Truth (Priority)

1. Me2AI Spec
2. Governance Rules (SKILL / Sub Skills)
3. AI2AI State
4. Code

Conflicts resolve upward.

---

## 5. Invariants

1. AI must not modify Me2AI
2. No cross-iteration work
3. No early abstraction / refactoring
4. AI2AI must be compressible and rewritable
5. Violations must be rollbackable

---

## 6. Execution Model

Spec → Governance → Execution → State → Control Loop

---

## 7. One-Sentence Definition

> **SDAC v1.0 is a governance-first methodology that makes AI executable, auditable, and sustainable in real software engineering.**
