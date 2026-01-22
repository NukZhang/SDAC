# Why SDAC

> **Make AI Executable, Not Creative.**

## TL;DR

AI coding fails in real projects not because models are weak, but because **their behavior is not governed**.  
SDAC (Spec-Driven AICoding) introduces an explicit governance layer between AI and code, making AI **predictable, auditable, and sustainable** in long-running software projects.

---

## 1. The Real Problem with AI Coding

If you have used AI in any project lasting more than a few days, you have likely seen this pattern:

- The AI expands requirements without being asked
- Architectural decisions appear before you agreed on them
- Context drifts as conversations grow longer
- Code accumulates while project clarity degrades
- Humans spend more time correcting the AI than moving forward

These are **not model bugs**. They are structural failures.

---

## 2. The Missing Layer: Governance

Traditional software engineering never relied on intelligence alone.  
It relies on:

- Explicit constraints
- Clear ownership
- Review and rollback mechanisms
- Stable sources of truth

Most AI coding workflows look like this:

```
Prompt → AI → Code
```

What is missing is the most important layer:

> **Governance**

AI is treated as a creative developer, not as an execution unit that must be constrained.

---

## 3. SDAC’s Core Assumption

SDAC is built on three pragmatic assumptions:

1. **AI will always extrapolate** (this is a capability, not a flaw)
2. **Long-running projects require explicit state management**
3. **Controllability matters more than output brilliance**

Therefore, SDAC does **not** aim to make AI smarter.

It aims to make AI **safe to operate inside real engineering systems**.

---

## 4. What SDAC Does Differently

SDAC deliberately avoids several common AI-coding practices:

- AI proposing new features
- AI redesigning architecture
- AI predicting future needs
- AI optimizing beyond the current iteration

Instead, SDAC enforces:

- Specs over conversation
- Constraints over creativity
- Rollback over patching
- State snapshots over chat history

This does not limit AI.  
It allows AI to **work reliably over time**.

---

## 5. SDAC vs Prompt Engineering

| Prompt Engineering | SDAC |
|---|---|
| Tunes outputs | Governs behavior |
| Seeks smarter answers | Seeks predictable execution |
| Conversation-driven | Spec-driven |
| Human constantly intervenes | AI self-corrects |
| Short-term effectiveness | Long-term stability |

> **Prompts are instructions. SDAC is a system of rules.**

---

## 6. What SDAC Actually Solves

SDAC focuses on engineering questions that matter:

- Can changes be audited?
- Can behavior be rolled back?
- Can the project survive months of iteration?

Its mechanisms—

- Checklists
- Self-adjudication
- Minimal Fix Diffs
- AI2AI state compression

exist for a single purpose:

> **To ensure AI behavior stays within controllable engineering boundaries.**

---

## 7. Who SDAC Is For

SDAC is well suited for:

- Long-term personal projects
- Small to mid-sized engineering teams
- Frontend, game, and tool-driven systems
- Developers who want to manage AI, not babysit it

SDAC is **not** intended for:

- One-off scripts
- Pure exploration or research
- Creative content generation

---

## 8. Without SDAC

Teams using AI without governance usually end in one of two states:

1. Humans retake most decisions, AI becomes autocomplete
2. The project collapses under accumulated inconsistency

SDAC provides a third path:

> **AI operating continuously under explicit engineering rules.**

---

## 9. One-Sentence Summary

> **SDAC exists to make AI viable in real software engineering, not impressive in isolated demos.**

---

Next:
- Read the Architecture Overview
- Review the SDAC Whitepaper
- See SDAC-Team in real-world practice
