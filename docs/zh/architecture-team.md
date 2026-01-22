# SDAC-Team 实战白皮书

本文通过一个真实 repo 级案例，展示：
- 多人 + 多 AI 如何并行开发
- 为什么执行可以并行，但集成必须串行
- 违规如何被自动检测与回滚

结论：
**多 AI 失控不是必然，而是治理缺失的结果。**

## 1. SDAC-Team 架构图讲解
```mermaid
flowchart TB
  %% =========================
  %% SDAC-Team Architecture
  %% =========================

  %% ---------- Human Authority ----------
  subgraph "Human Authority Layer"
    SO[Spec Owner - SO<br>- Owns Me2AI<br>- Defines Iteration]
    RO[Release Owner - RO<br>- Owns main<br>- Serial Integration]
    MO[Module Owners - MO<br>- Own module boundaries<br>- Interface gatekeepers]
  end

  Me2AI[Me2AI Spec<br>- Requirements<br>- Constraints<br>- Iteration Plan]
  IterSel[Iteration Selector<br>- Current Iteration<br>- No Cross-Iteration]

  SO --> Me2AI
  SO --> IterSel
  RO --> IterSel
  MO --> IterSel

  %% ---------- Team Governance ----------
  subgraph "SDAC-Team Governance Layer"
    Skill[SDAC SKILL<br>- Execution Order<br>- Minimal Completion Set<br>- No Early Abstraction<br>- No Cross-Iteration]
    SubSkill[Sub Skills<br>- Weapon / AI / State Machine<br>- Responsibility Boundaries]
    Lanes[Work Lanes<br>- Lane Isolation<br>- Allowed Paths]
    Gate[Merge Gate<br>- Checklist Required<br>- AI2AI Update Required<br>- Serial Merge Only]
    Owners[CODEOWNERS<br>- Module Ownership<br>- Review Responsibility]
    Skill --> SubSkill
    Lanes --> Gate
    Owners --> Gate
  end

  Me2AI --> Skill
  IterSel --> Skill
  Skill --> Lanes

  %% ---------- Parallel Execution ----------
  subgraph "Parallel Execution - Multiple AI Workers"
    AWA[AI Worker A<br>Lane A<br>Allowed Paths Only]
    AWB[AI Worker B<br>Lane B<br>Allowed Paths Only]
    AWC[AI Worker C<br>Lane C<br>Allowed Paths Only]
  end

  Lanes --> AWA
  Lanes --> AWB
  Lanes --> AWC

  %% ---------- Code & State ----------
  subgraph "Repo / Execution Layer"
    Repo[Codebase<br>feature branches]
    LaneState[Lane State Notes<br>AI2AI_Lanes slash star<br>facts per lane]
    GlobalState[Global AI2AI State<br>AI2AI.md<br>state not logs]
  end

  AWA --> Repo
  AWB --> Repo
  AWC --> Repo

  AWA --> LaneState
  AWB --> LaneState
  AWC --> LaneState

  %% ---------- Serial Integration ----------
  Repo --> Gate
  Gate --> RO

  RO --> Main[main branch<br>stable baseline]

  %% ---------- Control Loop ----------
  subgraph "SDAC Control Loop - Enforced at Gate"
    Check[Checklist<br>- Spec Skill Lane violation]
    Judge[Self Adjudication<br>- A B C severity]
    Diff[Minimal Fix Diff<br>- auditable patch]
    Compress[AI2AI Compression<br>- merge lane facts<br>- keep executable truth]
    Check --> Judge --> Diff --> Compress --> Check
  end

  Gate --> Check
  LaneState --> Compress
  Compress --> GlobalState
  GlobalState --> Check

  %% ---------- Feedback & Ownership ----------
  Main --> MO
  MO --> Lanes
  RO --> Gate
```

## 2. 并行开发冲突处理：并行 Lanes -> 先处理接口 PR
```mermaid
flowchart TB
  %% ==========================================
  %% Conflict Handling: Parallel Lanes -> Interface PR First
  %% ==========================================

  Start[Parallel Lanes Running<br>Multiple AI Workers] --> Detect{Do two Lanes<br>need to modify<br>the same core file or interface?}

  Detect -- No --> Normal[Continue in Lanes<br>Lane Isolation holds] --> Done[Proceed to Merge Gate<br>Serial Integration]

  Detect -- Yes --> Freeze[Freeze conflicting edits<br>in both Lanes]
  Freeze --> Escalate[Escalate to Module Owners<br>and Release Owner]

  Escalate --> DefineIF[Define minimal interface change<br>function signature or event or API]
  DefineIF --> IFPR[Create Interface PR<br>Owned by MO or RO<br>Smallest possible change]

  IFPR --> CheckIF[Run Checklist and Minimal Diff<br>for Interface PR]
  CheckIF --> MergeIF{Interface PR approved?}

  MergeIF -- No --> ReviseIF[Revise Interface PR<br>until stable] --> CheckIF
  MergeIF -- Yes --> MainIF[Merge Interface PR to main<br>serial]

  MainIF --> Unblock[Unblock Lanes<br>Rebase onto main]
  Unblock --> LaneWork[Each Lane implements locally<br>using new interface<br>within Allowed Paths]
  LaneWork --> Done
```

## 3. 并行开发冲突处理：接口 PR -> 再处理代码 PR
```mermaid
flowchart TB
  %% ==========================================
  %% PR Lifecycle: Contract -> AI Worker -> Gate -> Main -> AI2AI
  %% ==========================================

  Issue[Issue Created<br>Task Contract Required]
    --> Contract{Contract complete?<br>Iteration - Lane - Allowed Paths - Acceptance}

  Contract -- No --> FixIssue[Fill missing fields<br>No work starts]
  FixIssue --> Contract

  Contract -- Yes --> Assign[Assign AI Worker<br>Lane bound]

  Assign --> ReadSpec[AI reads Me2AI and Iteration Selector<br>and relevant SKILL or SubSkill]

  ReadSpec --> Implement[Implement minimal completion set<br>Only within Allowed Paths]

  Implement --> UpdateLane[Update Lane State Notes<br>AI2AI_Lanes slash star<br>facts only]

  UpdateLane --> PR[Open PR<br>include evidence and checklist]

  PR --> Gate[Merge Gate<br>RO controls]
  Gate --> PathCheck{Allowed Paths only?}

  PathCheck -- No --> Reject1[Reject PR<br>Violation boundary]
  Reject1 --> FixPR[Minimal Fix Diff<br>or revert]
  FixPR --> PR

  PathCheck -- Yes --> Checklist[Run SDAC Checklist]
  Checklist --> Viol{Any violation?}

  Viol -- Yes --> Adjudge[Self Adjudication A B C]
  Adjudge --> Diff[Produce Minimal Fix Diff]
  Diff --> Apply[Apply patch or rollback]
  Apply --> Checklist

  Viol -- No --> StateOk{AI2AI updated?<br>facts only}

  StateOk -- No --> RequestState[Request AI2AI update<br>no merge]
  RequestState --> UpdateLane

  StateOk -- Yes --> Merge[RO merges to main<br>Serial integration]

  Merge --> Compress[AI2AI Compression<br>Merge lane facts to global AI2AI.md]

  Compress --> Release[Stable main baseline<br>Iteration continues]
```

## 4. 并行开发冲突处理：接口 PR -> 再处理代码 PR 示例
```mermaid
gitGraph
  %% Goal: avoid Lane conflicts on same core file by merging minimal interface first

  commit id: "init baseline"

  %% Lane A parallel work
  branch laneA
  checkout laneA
  commit id: "laneA work step 1"
  commit id: "laneA work step 2"

  %% Lane B parallel work
  checkout main
  branch laneB
  checkout laneB
  commit id: "laneB work step 1"
  commit id: "laneB work step 2"

  %% Conflict detected: create interface branch from main
  checkout main
  branch interface
  checkout interface
  commit id: "interface change minimal"
  commit id: "interface stabilize"

  %% Serial merge interface to main
  checkout main
  merge interface id: "merge interface to main"

  %% Rebase lanes onto updated main (represented as a new commit on each lane)
  checkout laneA
  commit id: "rebase laneA to new interface"
  commit id: "laneA implement using interface"

  checkout laneB
  commit id: "rebase laneB to new interface"
  commit id: "laneB implement using interface"

  %% Serial merge lanes to main
  checkout main
  merge laneA id: "merge laneA to main"
  merge laneB id: "merge laneB to main"
```

## 5. PR 生命周期 GitFlow 示意图
```mermaid
gitGraph
  %% Task contract: Iteration, Lane, AllowedPaths, Acceptance
  %% Each PR passes Merge Gate and merges serially
  %% Violations require minimal fix before merge
  %% After merge, compress state into global AI2AI

  commit id: "init baseline"

  %% Lane A work
  branch laneA
  checkout laneA
  commit id: "laneA implement minimal"
  commit id: "laneA update lane state"

  %% Merge laneA to main (serial)
  checkout main
  merge laneA id: "merge laneA to main"

  %% Post-merge compression to global AI2AI
  commit id: "compress AI2AI global"

  %% Lane B work
  branch laneB
  checkout laneB
  commit id: "laneB implement minimal"
  commit id: "laneB update lane state"

  %% Violation: create fix branch from laneB, then merge back
  branch fixB
  checkout fixB
  commit id: "minimal fix diff"

  checkout laneB
  merge fixB id: "apply minimal fix"

  %% Merge laneB to main (serial)
  checkout main
  merge laneB id: "merge laneB to main"

  %% Post-merge compression again
  commit id: "compress AI2AI global"
```
