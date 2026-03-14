# Obsidian Organization Standard

Store all run outputs under:
`<vault>/<slug>/`

## Folder map
- `00-Index/` -- navigation notes and current cycle links
- `01-Objective/` -- objective + gates snapshots
- `02-Risks/` -- ranked risk maps
- `03-Learn-Cards/` -- topic learn cards
- `04-Research/` -- evidence maps, decision packets, drill-ins
- `05-Execution/` -- day 0-7 boards, checkpoints
- `06-Publishing/` -- LinkedIn/X/TikTok drafts + arXiv pathway notes
- `07-Skill-Evolution/` -- skill upgrade logs + rubric scores
- `08-Research-Improvement/` -- daily KPI logs and post-mortems
- `10-Hubs/` -- knowledge graph hub notes (see `references/output/knowledge-graph-linking.md`)
  - `Stations/` -- workflow stage hubs (e.g., `Station 1 - LISTEN.md`)
  - `Skills/` -- Claude Code skill hubs
  - `Tools/` -- external tool/API hubs (e.g., `PRAW.md`, `App Store Connect API.md`)
  - `Communities/` -- online communities, groups, podcasts, channels
  - `People/` -- key contacts, influencers
  - `Competitors/` -- competitor product hubs
  - `Concepts/` -- recurring strategic concepts

## Naming rules
- Use date prefix: `YYYY-MM-DD-<slug>.md`
- Versioned docs: append `-v0.x` (e.g., `2026-02-22-decision-packet-v0.3.md`)
- Keep one canonical latest link in `00-Index/current-cycle.md`

## Daily filing checklist
1. Save today's Objective/Status/Focus note.
2. File any new learn cards under `03-Learn-Cards/`.
3. File decision/research deltas under `04-Research/`.
4. File publish drafts under `06-Publishing/`.
5. Update index links in `00-Index/current-cycle.md`.

## Cross-link rule
Every note should include:
- `[[YYYY-MM-DD-objective-and-gates]]` link (use wikilinks for all internal references)
- `[[YYYY-MM-DD-decision-packet-v0.x]]` link
- `[[YYYY-MM-DD-execution-board]]` link

Use `[[wikilinks]]` consistently so Obsidian's graph view and backlink panels work.

**Beyond bottom-of-page cross-links**, apply inline wikilinks throughout body text per `references/output/knowledge-graph-linking.md`. Link tools, APIs, communities, stations, competitors, and sibling documents on first mention per H2 section. Create hub notes under `10-Hubs/` for entities referenced in 2+ documents.

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
| **Dataview** | Query frontmatter across all notes; build live dashboards in index notes |
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

## Index note with Dataview queries

`00-Index/current-cycle.md` should include live Dataview queries instead of manually maintained link lists:

````markdown
## Active Learn Cards
```dataview
TABLE confidence, status, risk-bucket
FROM "<slug>/03-Learn-Cards"
WHERE type = "learn-card"
SORT date DESC
LIMIT 10
```

## Decision Packets
```dataview
TABLE version, gate, decision-date
FROM "<slug>/04-Research"
WHERE type = "decision-packet"
SORT decision-date DESC
LIMIT 5
```

## Recent Execution Boards
```dataview
TABLE total-tasks, completed, blocked, days-remaining
FROM "<slug>/05-Execution"
WHERE type = "execution-board"
SORT date-range DESC
LIMIT 3
```

## Changed Today
```dataview
TABLE updated-sections, updated
FROM "<slug>"
WHERE updated = date(today)
SORT file.folder ASC
```
````

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
