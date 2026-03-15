# Obsidian Organization Standard

Store all run outputs under:
`<vault>/<slug>/`

## Folder map — 4 categories

```
<slug>/
├── dashboard.md              ← single entry point: status, blockers, per-category next steps
├── research/                 ← decisions, evidence, execution plans
│   ├── shared/               ← objective, risks, cross-cutting deep dives (multi-modality only)
│   └── <modality>/           ← one subfolder per modality (e.g., small-molecule/, aav/)
├── learning/                 ← learn cards (one per unknown being closed)
│   └── <modality>/           ← optional: only when >1 modality exists
├── publishing/               ← LinkedIn/X/TikTok drafts + arXiv pathway notes
├── process/                  ← skill evolution logs, research improvement KPIs
└── hubs/                     ← knowledge graph hub notes (see references/output/knowledge-graph-linking.md)
    ├── stations/
    ├── skills/
    ├── tools/
    ├── communities/
    ├── people/
    ├── competitors/
    └── concepts/
```

### When to create modality subfolders
- **Single-track project:** no subfolders — files go directly in `research/` and `learning/`
- **Multi-track project:** create one subfolder per modality + `shared/` for cross-cutting artifacts

### What goes where

| Category | Artifacts | Skill steps |
|----------|-----------|-------------|
| **research** | Objective & gates, risk breakdown, decision packets, deep dives, execution boards | 1-2, 5-6, 8 |
| **learning** | Learn cards (each tracks one unknown being closed with evidence) | 3-4 |
| **publishing** | Daily content bundles, LinkedIn/X/TikTok drafts, arXiv notes | 9 |
| **process** | Skill evolution logs, research improvement KPI logs | 10 |
| **dashboard** | Weekly review summary, status update | 7 |

## Naming rules
- **All lowercase, no spaces, alphanumeric + hyphens only.** Every directory and filename must match `[a-z0-9-]+` (plus `.md`/`.yaml` extension). Convert spaces to hyphens, strip special characters, lowercase everything.
- Date prefix: `YYYY-MM-DD-<slug>.md`
- Versioned docs: append `-v0.x` (e.g., `2026-02-22-decision-packet-v0.3.md`)
- Dashboard is always `dashboard.md` (no date prefix — it's the living entry point)
- Modality subfolders use kebab-case (e.g., `small-molecule/`, not `Small Molecule/`)

## Daily filing checklist
1. Update `dashboard.md` — refresh the `> Next:` blockquote in each of the 4 sections.
2. File learn cards under `learning/` (or `learning/<modality>/`).
3. File decision packets and deep dives under `research/`.
4. File publish drafts under `publishing/`.

## Cross-link rule
Every note should include:
- `[[YYYY-MM-DD-objective-and-gates]]` link (use wikilinks for all internal references)
- `[[YYYY-MM-DD-decision-packet-v0.x]]` link
- `[[YYYY-MM-DD-execution-board]]` link

Use `[[wikilinks]]` consistently so Obsidian's graph view and backlink panels work.

**Beyond bottom-of-page cross-links**, apply inline wikilinks throughout body text per `references/output/knowledge-graph-linking.md`. Link tools, APIs, communities, stations, competitors, and sibling documents on first mention per H2 section. Create hub notes under `hubs/` for entities referenced in 2+ documents.

## dashboard.md template

The dashboard opens with the objective, status, and blockers. Then each of the 4 sections has:
1. A **`> Next:`** blockquote stating the single next action for that category
2. Links to all artifacts in that category

Every time `dashboard.md` is updated, each `> Next:` must be refreshed to reflect current state.

### How to derive each "Next"

| Category | Ask yourself | Example |
|----------|-------------|---------|
| **Research** | What's the next decision to make or evidence gap blocking a decision? | "Close SM blocker X to promote decision packet v0.2 → v0.3" |
| **Learning** | Which learn card has the lowest confidence relative to its target? What specific query/experiment closes the gap? | "Run 4 PubMed queries from TE biomarker card, grade against minimum bar" |
| **Publishing** | What's the most recent insight that hasn't been packaged yet? | "Write daily bundle from AAV DIMMER circuit finding" |
| **Process** | What research method is on trial, or what worked last cycle that should be promoted/dropped? | "Evaluate structured counter-evidence search — 2 more wins needed for Standard" |

### Rules for "Next" lines
- Each "Next" must be a **concrete action**, not a status description ("investigate X" is bad; "run PubMed query Y and grade against bar Z" is good)
- If a category has no pending action, write `> Next: None — current cycle complete. Will resume next cycle.`
- `dashboard.md` is updated at minimum once per cycle, and always after completing a next action

### Dashboard Dataview queries

Include live Dataview queries in `dashboard.md` for each category:

````markdown
## learning
```dataview
TABLE confidence, status, risk-bucket
FROM "<slug>/learning"
WHERE type = "learn-card"
SORT confidence ASC
```

## research
```dataview
TABLE version, gate, decision-date
FROM "<slug>/research"
WHERE type = "decision-packet"
SORT decision-date DESC
LIMIT 5
```

## Changed Today
```dataview
TABLE updated-sections, updated
FROM "<slug>"
WHERE updated = date(today)
SORT file.folder ASC
```
````

## Frontmatter convention

Every note gets at minimum:

```yaml
---
type: <artifact-type>
date: YYYY-MM-DD
updated: YYYY-MM-DD
updated-sections: "<comma-separated list of changed sections>"
---
```

- `date` records the creation date of the note.
- `updated` records the date the note was last modified. Set to the same value as `date` on first creation.
- `updated-sections` lists which sections were changed on the last update (e.g., `"evidence-plan, confidence-score"`). Set to `"initial"` on first creation.

Full frontmatter schemas for each artifact type are defined in `references/output/enriched-patterns.md` section A.

| Artifact | Required `type` value |
|----------|-----------------------|
| Objective | `objective` |
| Risk Breakdown | `risk-breakdown` |
| Learn Card | `learn-card` |
| Decision Packet | `decision-packet` |
| Execution Board | `execution-board` |
| Research Improvement Log | `research-improvement-log` |
| Weekly Review | `weekly-review` |
| Publishing Draft | `publishing-draft` |

## Recommended Obsidian plugins

| Plugin | Why |
|--------|-----|
| **Dataview** | Query frontmatter across all notes; build live dashboards |
| **Charts** | Render Chart.js blocks for KPI trends in research improvement logs |
| **Kanban** | Convert execution board task lists into visual kanban boards |
| **Templater** | Insert templates with dynamic date substitution |

See `references/output/visual-explainer-integration.md` for install instructions.

## Enriched markdown conventions

All enriched rendering patterns (Mermaid diagrams, callout blocks, inline HTML, Dataview queries, Chart.js blocks) are documented in `references/output/enriched-patterns.md`.

Key conventions:
- Use callout blocks (`> [!type]`) for visual hierarchy instead of nested headers
- Use Mermaid fenced blocks for diagrams (rendered by Obsidian core, no plugin needed)
- Use `<progress>` and `<span>` for inline status indicators
- Use Dataview inline fields (`field:: value`) when a value should be queryable but not in frontmatter

## Optional: CSS snippet for callout theming

For customized callout colors, create `.obsidian/snippets/plos-callouts.css`:

```css
/* Stronger visual weight for danger callouts (stop rules) */
.callout[data-callout="danger"] {
  --callout-color: 220, 38, 38;
  border-left-width: 4px;
}

/* Accent color for success callouts (go gates) */
.callout[data-callout="success"] {
  --callout-color: 22, 163, 74;
  border-left-width: 4px;
}
```

Enable in Settings > Appearance > CSS snippets.
