# Obsidian Organization Standard

Store all outputs under `<project>/` in the Obsidian vault (e.g., `cmt1b-research/`).

## Folder map — 4 categories

```
<project>/
├── Dashboard.md              ← single entry point: status, blockers, next step, links
├── Research/                 ← decisions, evidence, execution plans
│   ├── Shared/               ← objective, risks, cross-cutting deep dives
│   └── <Modality>/           ← one subfolder per modality (e.g., Small Molecule/, AAV/)
├── Learning/                 ← learn cards (one per unknown being closed)
│   └── <Modality>/           ← optional: only when >1 modality exists
├── Publishing/               ← LinkedIn, X/Twitter, TikTok, arXiv drafts
└── Process/                  ← skill evolution logs, research improvement KPIs
```

### When to create modality subfolders
- **Single-track project:** no subfolders — files go directly in `Research/` and `Learning/`
- **Multi-track project:** create one subfolder per modality + `Shared/` for cross-cutting artifacts

### What goes where

| Category | Artifacts | Skill steps |
|----------|-----------|-------------|
| **Research** | Objective & gates, risk breakdown, decision packets, deep dives, execution boards | 1-2, 5-6, 8 |
| **Learning** | Learn cards (each tracks one unknown being closed with evidence) | 3-4 |
| **Publishing** | Daily content bundles, LinkedIn/X/TikTok drafts, arXiv notes | 9-10 |
| **Process** | Skill evolution logs, research improvement KPI logs | 11-12 |
| **Dashboard** | Weekly review summary, status update | 7 |

## Naming rules
- Date prefix: `YYYY-MM-DD-<slug>.md`
- Versioned docs: append `-v0.x` (e.g., `2026-02-22-decision-packet-v0.3.md`)
- Dashboard is always `Dashboard.md` (no date prefix — it's the living entry point)

## Daily filing checklist
1. Update `Dashboard.md` with today's status and next step.
2. File learn cards under `Learning/` (or `Learning/<Modality>/`).
3. File decision packets and deep dives under `Research/`.
4. File publish drafts under `Publishing/`.

## Cross-link rule
Every note should include:
- `Objective:` link
- `Current decision packet:` link
- `Today's execution board:` link

## Dashboard template

The Dashboard opens with the objective, status, and blockers. Then each of the 4 sections has:
1. A **`> Next:`** blockquote stating the single next action for that category
2. Links to all artifacts in that category

Every time the Dashboard is updated, each `> Next:` must be refreshed to reflect current state.

### How to derive each "Next"

| Category | Ask yourself | Example |
|----------|-------------|---------|
| **Research** | What's the next decision to make or evidence gap blocking a decision? | "Close SM blocker X to promote decision packet v0.2 → v0.3" |
| **Learning** | Which learn card has the lowest confidence relative to its target? What specific query/experiment closes the gap? | "Run 4 PubMed queries from TE biomarker card, grade against minimum bar" |
| **Publishing** | What's the most recent insight that hasn't been packaged yet? | "Write daily bundle from AAV DIMMER circuit finding" |
| **Process** | What research method is on trial, or what worked last cycle that should be promoted/dropped? | "Evaluate structured counter-evidence search — 2 more wins needed for Standard" |

### Rules
- Each "Next" must be a **concrete action**, not a status description ("investigate X" is bad; "run PubMed query Y and grade against bar Z" is good)
- If a category has no pending action, write `> Next: None — current cycle complete. Will resume next cycle.`
- The Dashboard is updated at minimum once per cycle, and always after completing a next action
