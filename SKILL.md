---
name: progressive-learning-os-agent-skill
description: Run a tri-track system that advances objective execution while compounding learning and producing publishable outputs. Progressively decompose complex goals into risk-prioritized research, evidence-backed learning cards, versioned decision packets (v0.1→v0.3), day-0 to day-7 execution plans, and multi-format publishing outputs (LinkedIn, X/Twitter, TikTok, arXiv pathway). Use when the user wants AI as collaborator, teacher, and researcher without slowing delivery.
---

# Progressive Learning OS

Execute this sequence every cycle. Keep artifacts short, explicit, and versioned.
Run `references/09-tri-track-operating-system.md` continuously so execution speed is never gated by learning speed and publishing stays coupled to real work.

## 0) Organize GitHub structure first
Use `references/16-github-repo-organization.md`.
Set up `core/`, `domains/`, and `domains/<domain>/tracks/<track>/` before generating outputs.

## 1) Lock objective and decision gate
Use `references/01-objective-and-gates.md`.
Classify the study design (experimental, quasi-experimental, observational, retrospective) before proceeding. If the objective or domain description contains signals like "natural history", "observational cohort", "registry study", "no intervention", or "disease progression tracking", set study design = observational. If observational or retrospective, set execution plan mode to observational-only and auto-populate out-of-scope constraints with "No treatment, no intervention, no randomization."
Output: one-page objective with Go/Hold/Kill, decision date, and study design classification.

## 2) Decompose into top risks
Use `references/02-risk-breakdown.md`.
Output: 3–5 risk buckets ranked by kill probability.

## 3) Build learning queue from unknowns
Use `references/03-learn-card.md`.
For each top risk, create a Learn Card with:
- unknowns
- source plan
- teach-back summary
- applied artifact

## 4) Gather, grade, and tier-label evidence

### Source reliability tier system

Every factual claim must be tagged with its evidence tier at the point of use. Use these tiers consistently across all outputs (learn cards, decision packets, execution plans, publishing artifacts):
If biomedical/scientific, use evidence-only workflow and cite PMID/DOI/URL. Also check the study design classification from step 1; if observational or retrospective, ensure evidence gathering focuses on observational methods and does not assume interventional capability.

| Tier | Label | Examples |
|------|-------|---------|
| 1 | `[peer-reviewed]` | Published papers, systematic reviews, meta-analyses |
| 2 | `[preprint]` | arXiv, bioRxiv, medRxiv -- not yet peer-reviewed |
| 3 | `[industry-report]` | White papers, technical reports from recognized bodies |
| 4 | `[press-release]` | Company announcements, PR wire, blog posts |
| 5 | `[unverified / no source]` | No citation found; assumption only |

### Mandatory inline citation with tier label

When the skill makes a factual claim in any output (learn card, decision packet, execution plan), it must cite the source and its tier label inline. Example:

```
AAV9 has demonstrated CNS tropism in non-human primates. [press-release -- Voyager Therapeutics, 2023; no peer-reviewed confirmation found]
```

Never present a tier 4-5 claim with the same confidence framing as a tier 1-2 claim. If only tier 4-5 sources exist for a claim, prefix it with "Unverified:" or "Speculative:" and include the tier label.

### Plan viability gate

Before committing to a specific technology, vector, compound, or approach in the execution plan (step 6), the skill must check:
- Does peer-reviewed evidence (tier 1-2) support this choice?
- If only tier 3 evidence exists, note the limitation and include a verification step in the first two days of the execution plan.
- If only tier 4-5 evidence exists, the plan must explicitly flag the approach as **speculative** and include a verification step as the day-0 or day-1 action. The decision packet must not be promoted to v0.3 until the speculative claim is either verified or replaced.

### Conservative confidence scoring

Confidence scores in learn cards must reflect source quality:
- **Tier 1-2 sources only:** standard confidence range applies (0-100%)
- **Tier 3 sources:** cap confidence at 60%
- **Tier 4-5 sources only:** cap confidence at 35% and add a `> [!warning] Low evidence quality` callout explaining that the confidence is capped due to the absence of peer-reviewed or preprint-level evidence

### Evidence workflow

If biomedical/scientific, use evidence-only workflow and cite PMID/DOI/URL.
Map each source to a specific claim in the active Learn Card.
Assign each source its tier label (1-5) and ensure the tier label appears alongside the citation in every artifact that references it.

## 5) Promote decision packet by version
Use `references/04-version-promotion-rubric.md`.
Promote only when promotion criteria are met:
- v0.1: hypothesis and risk map complete
- v0.2: key evidence gaps reduced
- v0.3: execution-ready with explicit stop rules

## 6) Convert decision to immediate execution
Use `references/05-day0-7-execution.md`.
Before generating tasks, verify no proposed task requires an intervention incompatible with the study design. If study design = observational or retrospective and a task implies intervention (treatment, vector, compound, protocol manipulation, randomization), flag it with a `> [!warning] Incompatible with observational study design` callout instead of including it. Use the observational study execution template for natural history, observational, or retrospective designs.
Output: day 0-7 board with owner, threshold, and stop trigger per task.

## 7) Weekly learning closeout
Use `references/06-weekly-learning-review.md`.
Capture:
- what is now understood
- what remains weak/hand-wavy
- next topic to deliberately learn

## 8) Run hardcore drill-ins (in parallel)
Use `references/08-hardcore-drillins.md`.
Run 1–2 high-leverage deep dives each cycle without blocking core execution.
Each drill-in must end with a concrete change to risk ranking, decision thresholds, or week-1 tasks.

## 9) Publish from the workstream (not beside it)
Use `references/10-publishing-pipeline.md`.
For each major milestone, generate:
- one LinkedIn narrative artifact,
- one byte-sized X/Twitter artifact,
- one TikTok short script,
- one arXiv-pathway note update.

## 10) Run the daily content engine
Use `references/11-daily-content-engine.md`.
Every day, reiterate objective, report project status, define daily focus, and teach one learning in two layers (plain + expert).

## 11) Evolve the skills during execution
Use `references/12-skill-evolution-loop.md` and log updates in `assets/templates/skill-evolution-log.md`.
When new resources/links/patterns prove reusable, patch the skill in the same cycle.

## 12) Improve research quality daily
Use `references/14-research-improvement-loop.md` and log in `assets/templates/daily-research-improvement-log.md`.
Track KPI trendlines, ship research-method upgrades daily, and promote methods from Trial to Standard only after repeated wins.

## 13) Organize outputs in Obsidian
Use `references/15-obsidian-organization.md`.
Mirror each cycle’s outputs into `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/` with dated filenames and updated index links.

On every file write, populate the `updated` and `updated-sections` frontmatter fields (see frontmatter convention in the organization reference). Additionally, insert an update-status callout block immediately after frontmatter in every skill-generated file to indicate what changed. Use `> [!info] Last updated: ...` when the file was modified this cycle, or `> [!note] No changes this cycle (last updated: ...)` when carried over unchanged. See `references/18-obsidian-enriched-patterns.md` for the update-status callout patterns.

## 14) Render complex artifacts with Obsidian-enriched markdown
Use `references/17-visual-explainer-integration.md` and `references/18-obsidian-enriched-patterns.md`.
When an artifact exceeds complexity thresholds (3+ unknowns on a learn card, decision packet promotion, 5+ tasks on an execution board, 4+ risk buckets), render it using enriched Obsidian patterns (Mermaid diagrams, callout blocks, Dataview-queryable frontmatter, Chart.js trend blocks, inline HTML status indicators).
Available visual prompts:
- `prompts/visual-learn-card.md` -- learn cards with confidence gauges, evidence linkage diagrams, and callout-based teach-back sections
- `prompts/visual-decision-packet.md` -- decision packets with Mermaid version timelines, risk maps, and promotion criteria checklists
- `prompts/visual-execution-board.md` -- execution boards with KPI callouts, Mermaid timelines, and task status indicators
Output stays in the Obsidian vault alongside the standard markdown artifacts.

## 15) Calibrate complexity before presenting dense tables
Use `references/18-obsidian-enriched-patterns.md` (Table Legend pattern).

**Table density gate -- apply BEFORE rendering:**
- **5+ columns in a single table:** Precede the table with a `> [!info] Reading this table` callout that names each column and its meaning in one sentence.
- **3+ tables in a single output:** Introduce each table with a one-line context sentence explaining what the table maps (e.g., "This table maps enzyme names to substrate specificity and optimal pH ranges").
- **Both conditions met:** Use both the per-table context sentence AND the column-legend callout for the densest table.

**Adaptive fallback -- apply when user shows confusion:**
- If the user asks about only a subset of columns, requests clarification on table structure, or expresses confusion about a prior structured output, default the next output to narrative prose with highlighted key terms instead of tables.
- Re-introduce table-heavy content only after the user confirms understanding of the simplified format.
- Track comprehension signals: questions about column meanings, requests to "explain the table," or engagement with fewer than half the presented columns indicate the density exceeded the user's current comfort level.

## Rules
- Never keep claims unlinked to evidence in evidence-required domains.
- Never present tier 4-5 claims (press releases, unverified) with the same confidence framing as tier 1-2 claims (peer-reviewed, preprints). Always disclose source quality proactively.
- Never build an execution plan on tier 4-5 evidence without flagging the approach as speculative and including a verification step as a day-0 or day-1 action.
- Never block objective-critical execution waiting for perfect understanding; ship with explicit uncertainty + falsification next step.
- Prefer one strong completed loop over many partial loops.
- Keep each artifact skimmable (target one page, bullets first).
- Include “what changed and why” on every version promotion.
- Every factual claim in an output artifact must carry an inline tier label (see step 4 tier table).

## Output bundle (minimum)
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/01-Objective/YYYY-MM-DD-objective-and-gates.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/02-Risks/YYYY-MM-DD-risk-breakdown.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/03-Learn-Cards/YYYY-MM-DD-<topic>.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/04-Research/YYYY-MM-DD-decision-packet-v0.x.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/05-Execution/YYYY-MM-DD-day0-7-execution.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/06-Publishing/YYYY-MM-DD-daily-publishing-bundle.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/07-Skill-Evolution/YYYY-MM-DD-skill-evolution-log.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/08-Research-Improvement/YYYY-MM-DD-research-improvement-log.md`
- `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/00-Index/current-cycle.md`
