# Project OS — Tri-Track Program System

A reusable operating system for running complex projects with AI as a **collaborator, teacher, and researcher**.

This framework is designed to work across domains (e.g., rare disease, agentic frameworks, vertical farming) while supporting multiple parallel tracks per domain (e.g., CMT1B under rare disease).

---

## What this is

This repo centers on a reusable skill:

- `skills/progressive-learning-os/`

The skill runs a **tri-track loop** in parallel:

1. **Learning** — compound your understanding while you execute
2. **Researching** — produce evidence-backed decisions and execution plans
3. **Publishing** — turn real daily work into high-value public artifacts

It also includes:

- daily skill-improvement loops
- daily research-improvement KPIs
- content templates (LinkedIn/X/TikTok/arXiv pathway)
- Obsidian-first artifact organization

---

## Recommended GitHub structure (for packaging)

When turning this into a public starter repo, use this structure:

```text
project-os/
  core/
    skills/progressive-learning-os/
    templates/
    rubrics/
  domains/
    rare-disease/
      domain-config.yaml
      templates/
      tracks/
        cmt1b/
          track-config.yaml
          obsidian/
    agentic-frameworks/
      domain-config.yaml
      templates/
      tracks/
    vertical-farming/
      domain-config.yaml
      templates/
      tracks/
  scripts/
  docs/
```

### Config precedence

1. `core` defaults
2. `domains/<domain>/domain-config.yaml`
3. `domains/<domain>/tracks/<track>/track-config.yaml`

Track config wins on conflict.

---

## Current location of the skill in this workspace

- Main skill: `skills/progressive-learning-os/SKILL.md`
- References: `skills/progressive-learning-os/references/`
- Template assets: `skills/progressive-learning-os/assets/templates/`
- Obsidian starter index: `obsidian/Progressive-Learning-OS/00-Index/current-cycle.md`

---

## What the skill does each cycle

0. Organize GitHub structure first (`core/domains/tracks`)
1. Lock objective + decision gate (Go/Hold/Kill)
2. Break into highest-risk buckets
3. Build learn cards from unknowns
4. Gather and map evidence to claims
5. Promote decision packet versions (v0.1 → v0.3)
6. Convert to day 0–7 execution board
7. Run weekly learning synthesis
8. Run hardcore drill-ins without blocking delivery
9. Publish from the real workstream
10. Run daily content engine (Objective/Status/Focus/Learning)
11. Evolve skills daily from discoveries
12. Improve research quality daily via KPIs
13. Organize outputs in Obsidian

---

## Daily operating rhythm (practical)

- **Start of day**
  - Reiterate objective
  - Record current status
  - Pick one daily focus move
- **During day**
  - Execute objective-critical work
  - Run 1–2 deep drill-ins
  - Capture learnings into learn cards
- **End of day**
  - Generate publishing bundle
  - Ship 3 skill upgrades + score them
  - Log research KPI snapshot + method improvements

---

## Output standards

### Minimum outputs per cycle

- Objective + gates note
- Risk breakdown note
- Learn cards
- Decision packet (versioned)
- Day 0–7 execution board
- Daily publishing bundle
- Skill evolution log
- Daily research improvement log
- Current-cycle index note

### Publishing standards

Daily content should include:

- Objective reiterated
- Real project status
- Daily focus
- Learning of the day in two layers:
  - plain-language
  - expert nuance/reframe
- One concrete audience takeaway

---

## Skill improvement rules

- Discoveries (new source/tool/pattern) must feed back into skill updates
- Ship exactly **3 skill upgrades daily** (or log blockers + catch-up)
- Score each upgrade on:
  - time saved
  - quality gain
  - risk reduction
  - reusability

---

## Research improvement rules

Track daily KPIs:

- time-to-decision
- evidence strength ratio
- rework count
- false-lead rate
- decision reversal count

If 2+ KPIs degrade for 2 consecutive days, run a process-correction day.

---

## Obsidian organization

Outputs are intended to be mirrored into:

- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/`

Use dated filenames (`YYYY-MM-DD-...`) and keep `00-Index/current-cycle.md` updated with canonical links.

### Recommended Obsidian folders

- `00-Index/` — current-cycle dashboard and canonical links
- `01-Objective/` — objective + gates snapshots
- `02-Risks/` — ranked risk maps
- `03-Learn-Cards/` — learning cards
- `04-Research/` — decision packets, evidence maps, drill-ins
- `05-Execution/` — day 0–7 board + checkpoints
- `06-Publishing/` — LinkedIn/X/TikTok/arXiv-pathway artifacts
- `07-Skill-Evolution/` — daily skill-upgrade logs + scores
- `08-Research-Improvement/` — KPI logs + post-mortems

### How to work from Obsidian each day

1. Open `00-Index/current-cycle.md` first.
2. Fill: Objective, Status, Focus, Learning (plain/expert).
3. Update links to latest notes from folders `01`–`08`.
4. Add today’s execution board movement in `05-Execution/`.
5. Add publishing bundle in `06-Publishing/`.
6. Close day with skill/research logs in `07` and `08`.

---

## How task tracking works

The skill tracks tasks through a **Day 0–7 execution board** plus risk-linked tasks:

- Primary task file: `05-Execution/YYYY-MM-DD-day0-7-execution.md`
- Each task must include:
  - owner
  - success threshold
  - stop/rollback trigger
  - dependency

### Task flow

1. Generate tasks from highest-risk buckets (not from random ideas).
2. Label each as `Now`, `Next`, or `Later`.
3. At each checkpoint (Day 1/3/7), update status:
   - done / in progress / blocked
4. If blocked, link blocker to a specific risk or evidence gap.
5. Promote decision packet only when required tasks/thresholds are met.

### Daily task closeout

- Mark completed tasks.
- Carry forward only explicitly scoped `Next` tasks.
- Add one-line “what changed and why” summary.

---

## Migrating an existing pile of work into this framework

Use this when you already have lots of notes/research/docs and want to continue without restarting.

### Goal

Convert existing material into a structured track under this system, then resume execution from the true current state.

### Step-by-step migration

1. **Create target track**
   - `domains/<domain>/tracks/<track>/`
   - Add `track-config.yaml` with scope, decision horizon, and evidence standard.

2. **Collect and sort source material**
   - Gather existing docs, notes, decks, spreadsheets, and links.
   - Sort into buckets: objective, risks, evidence, execution, publishing.

3. **Backfill core artifacts (first pass, fast)**
   - Create objective + gates note from existing strategy.
   - Create risk breakdown from known blockers/failure modes.
   - Create current decision packet version (`v0.x`) that reflects real status today.
   - Create day 0–7 execution board with only actionable next steps.

4. **Build an evidence map from what already exists**
   - For each key claim, add source pointer (PMID/DOI/URL/doc link).
   - Mark gaps explicitly as `missing` instead of hand-waving.

5. **Normalize into Obsidian layout**
   - Place files in `obsidian/Progressive-Learning-OS/01..08` folders.
   - Update `00-Index/current-cycle.md` with canonical links.

6. **Set “resume point” explicitly**
   - Add a short note: “Where we left off” containing:
     - last completed milestone
     - current blockers
     - exact next decision
     - first 3 tasks to run next

7. **Start live cadence (no rework spiral)**
   - Begin daily tri-track loop from this resume point.
   - Improve structure incrementally while executing; do not pause for perfect cleanup.

### Migration quality checks

Before saying migration is complete, verify:

- Objective + Go/Hold/Kill is clear
- Latest decision packet reflects actual current state
- Execution board has owners/thresholds/stop triggers
- Evidence links exist for core claims
- Current-cycle index links resolve correctly
- Resume point note exists and is concrete

### Practical tip

Prefer a **70% structured migration in one pass** over a week of reorganizing. The framework is meant to improve while running.

---

## What to commit to GitHub

Commit:

- reusable skill framework (`skills/progressive-learning-os/**`)
- templates/rubrics/scripts/docs
- domain configs and sanitized example tracks

Do not commit:

- secrets/API keys
- sensitive unpublished data
- private notes you don’t want public

---

## Next packaging step

If you want, convert this workspace layout into the public `project-os/` structure above and add:

- `docs/quickstart.md`
- `scripts/init_track.py`
- one clean `domains/rare-disease/tracks/example/` starter
