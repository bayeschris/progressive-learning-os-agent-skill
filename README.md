# Progressive Learning OS

A reusable operating system for running complex projects with AI as a **collaborator, teacher, and researcher**.

Give it an objective. It figures out the rest.

---

## How to invoke

Just state your objective:

```
Use progressive-learning-os-agent-skill.
Build a launch marketing strategy for my dating app.
```

That's it. The system will:
1. **Derive a project slug** from your objective (e.g., `dating-app-launch-marketing`)
2. **Infer the decision horizon** from the objective's natural timeframe
3. **Detect today mode** — `setup` for new projects, `execute` for existing ones, `migrate` if you mention existing notes
4. **Create the folder** at `<vault>/<slug>/01-Objective/`, `02-Risks/`, etc.

If you don't like the derived slug, just say so and it'll rename.

### Override any default

You can override anything explicitly:

```
Use progressive-learning-os-agent-skill.
Evaluate gene therapy viability for CMT1B.
Decision horizon: 6 months.
Today mode: setup.
```

But you don't have to. Defaults are:

| Parameter | How it's inferred |
|-----------|------------------|
| **Project slug** | Derived from objective keywords, kebab-case (e.g., `cmt1b-gene-therapy-viability`) |
| **Decision horizon** | Estimated from the objective's natural timeframe. Default: 2 weeks if ambiguous. |
| **Today mode** | `setup` if no matching project exists. `execute` if one does. `migrate` if you mention existing notes/docs. `publish` if execution board is mostly complete. |

---

## Example invocations

These all work as-is — no configuration needed:

1. **"Build a launch marketing strategy for my dating app."**
   → slug: `dating-app-launch-marketing`, horizon: 2-4 weeks, mode: setup

2. **"Evaluate gene therapy viability for CMT1B."**
   → slug: `cmt1b-gene-therapy-viability`, horizon: 6-12 months, mode: setup

3. **"Plan content calendar for my vertical farming YouTube channel."**
   → slug: `vertical-farming-youtube-content`, horizon: 1 month, mode: setup

4. **"Figure out if we should build or buy an LLM memory layer."**
   → slug: `llm-memory-layer-build-vs-buy`, horizon: 2-4 weeks, mode: setup

5. **"Design a customer onboarding flow for our B2B SaaS."**
   → slug: `b2b-saas-customer-onboarding`, horizon: 2-3 weeks, mode: setup

6. **"Research whether to incorporate in Delaware or Wyoming."**
   → slug: `incorporation-delaware-vs-wyoming`, horizon: 1 week, mode: setup

7. **"Migrate my existing CMT1B research notes into this framework."**
   → slug: `cmt1b-research` (or matches existing), horizon: inherited, mode: migrate

8. **"Prepare a conference talk proposal on agentic AI patterns."**
   → slug: `agentic-ai-conference-talk`, horizon: 2-4 weeks, mode: setup

9. **"Validate product-market fit for my AI tutoring app."**
   → slug: `ai-tutoring-app-pmf-validation`, horizon: 4-6 weeks, mode: setup

10. **"Create a go-to-market plan for our API developer tools."**
    → slug: `api-devtools-go-to-market`, horizon: 1-2 months, mode: setup

11. **"Investigate observational endpoints for a rare disease natural history study."**
    → slug: `rare-disease-natural-history-endpoints`, horizon: 3-6 months, mode: setup

12. **"Ship a weekend side project: CLI tool for Obsidian vault analysis."**
    → slug: `obsidian-vault-cli`, horizon: 3 days, mode: setup

13. **"Build a competitive analysis of the top 5 AI code editors."**
    → slug: `ai-code-editor-competitive-analysis`, horizon: 1-2 weeks, mode: setup

14. **"Plan a 30-day social media launch for my podcast."**
    → slug: `podcast-social-media-launch`, horizon: 30 days, mode: setup

15. **"Continue working on the dating app marketing project."**
    → slug: matches existing `dating-app-launch-marketing`, mode: execute

---

## What this does

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

## Where outputs go

Each project is a folder in your Obsidian vault:

```text
<vault>/
  dating-app-launch-marketing/
    00-Index/
    01-Objective/
    02-Risks/
    03-Learn-Cards/
    04-Research/
    05-Execution/
    06-Publishing/
    07-Skill-Evolution/
    08-Research-Improvement/
    10-Hubs/
  cmt1b-gene-therapy-viability/
    00-Index/
    01-Objective/
    ...
```

The slug is auto-derived from your objective. The numbered folders are created automatically.

---

## Current location of the skill in this workspace

- Main skill: `skills/progressive-learning-os-agent-skill/SKILL.md`
- References: `skills/progressive-learning-os-agent-skill/references/`
- Template assets: `skills/progressive-learning-os-agent-skill/assets/templates/`
- Obsidian starter index: `<vault>/<slug>/00-Index/current-cycle.md`

---

## What the skill does each cycle

0. Derive project slug from objective, create or match existing folder
1. Lock objective + decision gate (Go/Hold/Kill)
2. Break into highest-risk buckets
3. Build learn cards from unknowns
4. Gather and map evidence to claims
5. Promote decision packet versions (v0.1 -> v0.3)
6. Convert to day 0-7 execution board
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
  - Run 1-2 deep drill-ins
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
- Day 0-7 execution board
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

Outputs are written under:

- `<vault>/<slug>/`

Use dated filenames (`YYYY-MM-DD-...`) and keep `00-Index/current-cycle.md` updated with canonical links.

### Recommended Obsidian folders

- `00-Index/` — current-cycle dashboard and canonical links
- `01-Objective/` — objective + gates snapshots
- `02-Risks/` — ranked risk maps
- `03-Learn-Cards/` — learning cards
- `04-Research/` — decision packets, evidence maps, drill-ins
- `05-Execution/` — day 0-7 board + checkpoints
- `06-Publishing/` — LinkedIn/X/TikTok/arXiv-pathway artifacts
- `07-Skill-Evolution/` — daily skill-upgrade logs + scores
- `08-Research-Improvement/` — KPI logs + post-mortems

### How to work from Obsidian each day

1. Open `00-Index/current-cycle.md` first.
2. Fill: Objective, Status, Focus, Learning (plain/expert).
3. Update links to latest notes from folders `01`-`08`.
4. Add today's execution board movement in `05-Execution/`.
5. Add publishing bundle in `06-Publishing/`.
6. Close day with skill/research logs in `07` and `08`.

---

## How task tracking works

The skill tracks tasks through a **Day 0-7 execution board** plus risk-linked tasks:

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
- Add one-line "what changed and why" summary.

---

## Migrating an existing pile of work into this framework

Use this when you already have lots of notes/research/docs and want to continue without restarting.

### Goal

Convert existing material into a structured project under this system, then resume execution from the true current state.

### Step-by-step migration

1. **State your objective with "migrate"**
   - The system will detect migration mode and create the project folder.

2. **Collect and sort source material**
   - Gather existing docs, notes, decks, spreadsheets, and links.
   - Sort into buckets: objective, risks, evidence, execution, publishing.

3. **Backfill core artifacts (first pass, fast)**
   - Create objective + gates note from existing strategy.
   - Create risk breakdown from known blockers/failure modes.
   - Create current decision packet version (`v0.x`) that reflects real status today.
   - Create day 0-7 execution board with only actionable next steps.

4. **Build an evidence map from what already exists**
   - For each key claim, add source pointer (PMID/DOI/URL/doc link).
   - Mark gaps explicitly as `missing` instead of hand-waving.

5. **Normalize into Obsidian layout**
   - Place files in `<slug>/01..08` folders.
   - Update `00-Index/current-cycle.md` with canonical links.

6. **Set "resume point" explicitly**
   - Add a short note: "Where we left off" containing:
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

- reusable skill framework (`skills/progressive-learning-os-agent-skill/**`)
- templates/rubrics/scripts/docs

Do not commit:

- secrets/API keys
- sensitive unpublished data
- private notes you don't want public
