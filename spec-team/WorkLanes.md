# Work Lanes（并行泳道）

> 为每个 Iteration 划分 Lane；每个 Lane 定义 Allowed Paths 与 Forbidden 区域。

## Iteration X

### Lane A — Player
- Owner: @MO-Player
- Allowed Paths:
  - src/player/**
- Forbidden:
  - src/weapon/**
  - src/ai/**
  - src/state/**

### Lane B — Weapon
- Owner: @MO-Weapon
- Allowed Paths:
  - src/weapon/**
- Forbidden:
  - src/player/**
  - src/ai/**
  - src/state/**
