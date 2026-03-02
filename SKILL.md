---
name: progressive-learning-os
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
Output: one-page objective with Go/Hold/Kill and decision date.

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

## 4) Gather and grade evidence
If biomedical/scientific, use evidence-only workflow and cite PMID/DOI/URL.
Map each source to a specific claim in the active Learn Card.

## 5) Promote decision packet by version
Use `references/04-version-promotion-rubric.md`.
Promote only when promotion criteria are met:
- v0.1: hypothesis and risk map complete
- v0.2: key evidence gaps reduced
- v0.3: execution-ready with explicit stop rules

## 6) Convert decision to immediate execution
Use `references/05-day0-7-execution.md`.
Output: day 0–7 board with owner, threshold, and stop trigger per task.

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

## 14) Render complex artifacts visually (optional)
Use `references/17-visual-explainer-integration.md`.
When an artifact exceeds complexity thresholds (3+ unknowns on a learn card, decision packet promotion, 5+ tasks on an execution board), render it as a styled HTML page using the Visual Explainer skill.
Available visual prompts:
- `prompts/visual-learn-card.md` -- learn cards with confidence meters and evidence links
- `prompts/visual-decision-packet.md` -- decision packets with version timelines and evidence maps
- `prompts/visual-execution-board.md` -- day 0-7 boards as operational dashboards
Output goes to `~/.agent/diagrams/` and opens in the browser. The markdown version in Obsidian is preserved as the source of truth.

## Rules
- Never keep claims unlinked to evidence in evidence-required domains.
- Never block objective-critical execution waiting for perfect understanding; ship with explicit uncertainty + falsification next step.
- Prefer one strong completed loop over many partial loops.
- Keep each artifact skimmable (target one page, bullets first).
- Include “what changed and why” on every version promotion.

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
