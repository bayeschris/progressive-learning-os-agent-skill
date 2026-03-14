---
name: progressive-learning-os-agent-skill
description: Run a tri-track system that advances objective execution while compounding learning and producing publishable outputs. Progressively decompose complex goals into risk-prioritized research, evidence-backed learning cards, versioned decision packets (v0.1→v0.3), day-0 to day-7 execution plans, and multi-format publishing outputs (LinkedIn, X/Twitter, TikTok, arXiv pathway). Use when the user wants AI as collaborator, teacher, and researcher without slowing delivery.
---

# Progressive Learning OS

Execute this sequence every cycle. Keep artifacts short, explicit, and versioned.
Run `references/system/tri-track-operating-system.md` continuously so execution speed is never gated by learning speed and publishing stays coupled to real work.

## 0) Organize project structure first
Use `references/16-github-repo-organization.md`.
Set up `<project>/` folder in Obsidian vault with `Dashboard.md`, `Research/`, `Learning/`, `Publishing/`, `Process/`, and `project-config.yaml`. If the project has multiple modalities, create subfolders under `Research/` and `Learning/`.

**Every substantive output MUST be written as a dated file in the Obsidian vault. Chat gets a brief summary (3-5 sentences) pointing the user to the file.**

### Vault path resolution

Resolve the Obsidian vault path in this order:
1. **Explicit argument**: If the user passes `obsidian <vault-name>`, search `~/Documents/Obsidian/` for a matching vault.
2. **Working directory detection**: If the current working directory or any parent contains `.obsidian/`, use that as vault root.
3. **Project memory**: Check project memory files for a previously stored vault path.
4. **Ask once**: If none resolve, ask the user and store in project memory.

Once resolved, write all outputs under `<vault-root>/<slug>/` using `references/output/obsidian-organization.md`.

### Chat output format

After writing each file: file name + location, one-line summary, key insight, next action. Do NOT duplicate file content in chat.

## Migrate from old layout (on request only)

If the user asks to migrate from the old nested structure (`Progressive-Learning-OS/`, `domains/*/tracks/*/obsidian/Progressive-Learning-OS/`), run `prompts/migrate-layout.md`.

---

## Cycle steps

### 0) Derive project slug and set up folder

From the user's objective, derive a kebab-case project slug (e.g., "Build a launch marketing strategy for my dating app" → `dating-app-launch-marketing`). Scan existing vault projects for a match before creating new.

## 13) Organize outputs in Obsidian
Use `references/15-obsidian-organization.md`.
File each cycle’s outputs into the 4-category structure (`Research/`, `Learning/`, `Publishing/`, `Process/`) with dated filenames. Update `Dashboard.md` — specifically, refresh the `> Next:` blockquote in each of the 4 sections to reflect the single concrete next action for that category.

Create `<vault-root>/<slug>/` with numbered artifact folders. See `references/system/project-organization.md`.

### 1) Lock objective and decision gate
Use `references/cycle/01-objective-and-gates.md`.
Classify study design (experimental, quasi-experimental, observational, retrospective). If observational or retrospective, set execution to observational-only mode.
Output: one-page objective with Go/Hold/Kill, decision date, and study design.

### 2) Decompose into top risks
Use `references/cycle/02-risk-breakdown.md`.
Output: 3-5 risk buckets ranked by kill probability.

### 3) Build learning queue from unknowns
Use `references/cycle/03-learn-card.md`.
For each top risk, create a Learn Card with unknowns, source plan, teach-back summary, and applied artifact.

### 4) Gather, grade, and tier-label evidence
Use `references/cycle/04-evidence-tiers.md`.
Tag every claim with its evidence tier. Apply confidence caps. Gate plan viability on source quality.

### 5) Promote decision packet by version
Use `references/cycle/05-version-promotion-rubric.md`.
v0.1: hypothesis + risk map. v0.2: evidence gaps reduced. v0.3: execution-ready with stop rules.

### 6) Convert decision to immediate execution
Use `references/cycle/06-execution-board.md`.
Verify no task is incompatible with study design. Output: day 0-7 board with owner, threshold, and stop trigger per task.

### 7) Weekly learning closeout
Use `references/cycle/07-weekly-learning-review.md`.
What's understood, what's weak, what to learn next.

### 8) Run hardcore drill-ins (in parallel)
Use `references/cycle/08-hardcore-drillins.md`.
1-2 deep dives per cycle. Each must change risk ranking, thresholds, or tasks.

### 9) Publish
Use `references/publish/publishing-pipeline.md` for milestone artifacts (LinkedIn, X/Twitter, TikTok, arXiv pathway).
Use `references/publish/daily-content-engine.md` for daily content (objective, status, focus, learning in two layers).

### 10) Improve
Use `references/improve/skill-evolution-loop.md` — ship 3 skill upgrades daily, score with `references/improve/skill-upgrade-scoring-rubric.md`, log in `assets/templates/skill-evolution-log.md`.
Use `references/improve/research-improvement-loop.md` — track KPIs daily, log in `assets/templates/daily-research-improvement-log.md`.

---

## Output rules

These apply on **every file write**, not as separate cycle steps.

### Obsidian organization
Use `references/output/obsidian-organization.md`. Dated filenames, updated index links.

### Frontmatter
Populate `updated` and `updated-sections` fields. Insert update-status callout after frontmatter. See `references/output/enriched-patterns.md`.

### Knowledge graph (MANDATORY)
Use `references/output/knowledge-graph-linking.md`. Inline-link shared concepts on first mention per H2. Create hub notes under `10-Hubs/` for entities in 2+ documents.

### Enriched rendering
Use `references/output/visual-explainer-integration.md` and `references/output/enriched-patterns.md` when artifacts exceed complexity thresholds (3+ unknowns, 5+ tasks, 4+ risk buckets, packet promotion).

Visual prompts:
- `prompts/visual-learn-card.md`
- `prompts/visual-decision-packet.md`
- `prompts/visual-execution-board.md`

### Table density gate
For 5+ column tables, add a `> [!info] Reading this table` legend. For 3+ tables, add per-table context. If user shows confusion, fall back to narrative prose.

---

## Rules
- Never output research as chat-only. File first, chat gets summary.
- Never present tier 4-5 claims with tier 1-2 confidence framing.
- Never build execution on tier 4-5 evidence without flagging as speculative.
- Never block execution waiting for perfect understanding — ship with explicit uncertainty.
- Prefer one strong completed loop over many partial loops.
- Keep each artifact skimmable (one page, bullets first).
- Include "what changed and why" on every version promotion.
- Every factual claim must carry an inline tier label.

## Output bundle (minimum)
- `<project>/Dashboard.md`
- `<project>/Research/YYYY-MM-DD-objective-and-gates.md`
- `<project>/Research/YYYY-MM-DD-risk-breakdown.md`
- `<project>/Research/<Modality>/YYYY-MM-DD-decision-packet-v0.x.md`
- `<project>/Research/<Modality>/YYYY-MM-DD-day0-7-execution.md`
- `<project>/Learning/YYYY-MM-DD-<topic>.md`
- `<project>/Publishing/YYYY-MM-DD-daily-publishing-bundle.md`
- `<project>/Process/YYYY-MM-DD-skill-evolution-log.md`
- `<project>/Process/YYYY-MM-DD-research-improvement-log.md`
- `<project>/project-config.yaml`

For single-modality projects, omit `<Modality>/` subfolders — files go directly in `Research/` and `Learning/`.
