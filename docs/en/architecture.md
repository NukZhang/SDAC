# SDAC Architecture Overview

> **A Governance-First Architecture for AI-Assisted Software Engineering**

This document explains the SDAC architecture layer by layer, focusing on **control, state, and long-term stability**, rather than model capability.

---

## 1. Architectural Thesis

> **SDAC inserts an explicit governance layer between AI and code.**

Without this layer, AI behavior inevitably drifts as projects grow.  
With it, AI becomes a predictable execution unit inside an engineering system.

---

## 2. The Four-Layer Model

SDAC is structured as four explicit layers:

1. Human Authority Layer
2. Governance Layer
3. AI Execution Layer
4. Control Loop

Each layer has **non-overlapping responsibilities**.

---

## 3. Human Authority Layer

### Purpose

Separate *intent* from *implementation*.

### Components

- **Me2AI Spec**
  - Requirements
  - Constraints
  - Iteration plan
- **Iteration Selector**
  - Declares the current iteration
  - Prevents cross-iteration execution

### Key Rule

> Humans define *what* and *when*, never *how*.

This eliminates conversational drift as a source of truth.

---

## 4. Governance Layer (The Core of SDAC)

### Purpose

Constrain AI behavior **before** execution begins.

### Components

- **SDAC SKILL**
  - Fixed execution order
  - Minimal completion set
  - No early abstraction
  - No cross-iteration work

- **Sub Skills**
  - System-level responsibility boundaries
  - Explicit red lines (what a system must never do)

### Why This Matters

AI failures are rarely about logic.  
They are about *scope expansion*.

Governance removes scope ambiguity.

---

## 5. AI Execution Layer

### Purpose

Allow AI to focus exclusively on execution.

### Components

- **AI Execution**
  - Line-level or module-level implementation
  - No requirement or architectural decisions

- **AI2AI State**
  - Current architecture snapshot
  - Completed iteration facts
  - Active constraints

### Critical Distinction

> **AI2AI is state, not history.**

It must be compressible and rewritable.

---

## 6. Control Loop

### Purpose

Enable long-term operation without human micromanagement.

### Steps

1. **Checklist** – Detect violations
2. **Self-Adjudication** – Classify severity
3. **Minimal Fix Diff** – Produce auditable patches
4. **State Compression** – Remove historical noise

This loop ensures drift is corrected structurally, not conversationally.

---

## 7. Sources of Truth (Priority Order)

1. Me2AI Spec
2. Governance Rules (SKILL / Sub Skills)
3. AI2AI State
4. Code

Conflicts are always resolved by moving upward in this list.

---

## 8. Why This Architecture Scales

- Specs are stable
- Governance rules are reusable
- State is compressible
- Execution is replaceable

AI instances can be swapped without losing project continuity.

---

## 9. One-Sentence Summary

> **SDAC is not an AI architecture—it is an engineering control architecture for AI behavior.**

---

Next:
- SDAC Whitepaper (English)
- SDAC-Team Case Study (English)
