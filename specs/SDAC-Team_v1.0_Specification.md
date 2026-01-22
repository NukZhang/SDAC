# SDAC-Team v1.0 Specification

> **Team-Scale Governance for Multi-Human + Multi-AI Collaboration**

---

## 1. Purpose

SDAC-Team enables multiple humans and multiple AI workers to collaborate without losing control, by enforcing boundaries, ownership, and serial integration.

---

## 2. Scope

Applies to:
- 2+ humans
- Multiple AI workers in parallel lanes
- Long-term maintainable codebases

---

## 3. Non-Goals

Not aiming for:
- Fully autonomous agent swarms
- Decentralized integration without a gate
- AI negotiating requirements/interfaces
- Removal of human decision authority

---

## 4. Core Principles

- Single source of authority: Spec Owner controls Me2AI; Release Owner controls main
- Parallel execution, serial integration
- Lane isolation via allowed paths

---

## 5. Team Invariants

1. Me2AI only modified by Spec Owner
2. main only merged by Release Owner
3. AI workers only change allowed paths
4. Integration is serial
5. AI2AI stores state facts only

---

## 6. One-Sentence Definition

> **SDAC-Team v1.0 is a governance-driven collaboration model that enables multiple humans and AI workers to build software without losing control.**
