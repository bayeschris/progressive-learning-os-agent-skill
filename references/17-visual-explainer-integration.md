# Obsidian-Native Visual Rendering Guide

## Overview

The Progressive Learning OS renders complex artifacts using Obsidian-native enriched markdown: Mermaid diagrams, callout blocks, Dataview-queryable frontmatter, Chart.js trend blocks, and inline HTML status indicators. All output stays in the Obsidian vault alongside standard markdown artifacts -- no external tools or browser required.

For the full pattern library, see `references/18-obsidian-enriched-patterns.md`.

## Recommended Obsidian Plugins

| Plugin | Purpose | Required? |
|--------|---------|-----------|
| **Dataview** | Query frontmatter across notes; build dashboards and cross-reference tables | Recommended |
| **Charts** (Obsidian Charts) | Render Chart.js fenced code blocks for KPI trends and distributions | Optional |
| **Kanban** | Convert task lists into drag-and-drop boards | Optional |
| **Templater** | Insert learn card / execution board templates with dynamic dates | Optional |

**Install via Obsidian:** Settings > Community plugins > Browse > search plugin name > Install > Enable.

Mermaid diagrams and callout blocks are built into Obsidian core -- no plugin needed.

## Integration Points

### Learning artifacts and their visual treatment

| Artifact | Visual Treatment | Template |
|----------|-----------------|----------|
| Learn Card (ref 03) | Frontmatter + callout-based sections + confidence gauge + Mermaid evidence linkage diagram | `prompts/visual-learn-card.md` |
| Decision Packet (ref 04) | Frontmatter + Mermaid version timeline + Mermaid risk diagram + callout blocks for stop rules and gate | `prompts/visual-decision-packet.md` |
| Day 0-7 Execution Board (ref 05) | Frontmatter + callout-based KPI cards + Mermaid timeline + task list with status indicators | `prompts/visual-execution-board.md` |
| Risk Breakdown (ref 02) | Frontmatter + Mermaid risk hierarchy flowchart with color-coded kill probability | Use patterns from `references/18-obsidian-enriched-patterns.md` |
| Weekly Learning Review (ref 06) | Chart.js KPI trend block + gap analysis callouts + Dataview cross-references | Use patterns from `references/18-obsidian-enriched-patterns.md` |
| Publishing Bundle (ref 10) | Callout blocks per platform (LinkedIn/X/TikTok/arXiv) with status badges | Use patterns from `references/18-obsidian-enriched-patterns.md` |

### When to render with enriched patterns

Use enriched rendering when:
- A learn card has 3+ unknowns or a complex evidence chain
- A decision packet is being promoted (show before/after state)
- The day 0-7 board has 5+ tasks across multiple owners
- A risk breakdown has 4+ risk buckets with dependencies
- Any artifact will be shared with stakeholders or published

Skip enriched rendering when:
- Quick status checks or single-item updates
- The artifact is a simple 2-3 line summary
- Working in a terminal-only environment without Obsidian access

## Output Location

All visual outputs are written to the Obsidian vault under `Progressive-Learning-OS/` using the standard folder structure defined in `references/15-obsidian-organization.md`:

- Learn cards: `Progressive-Learning-OS/03-Learn-Cards/YYYY-MM-DD-<topic>.md`
- Decision packets: `Progressive-Learning-OS/04-Research/YYYY-MM-DD-decision-packet-v0.x.md`
- Execution boards: `Progressive-Learning-OS/05-Execution/YYYY-MM-DD-execution-board.md`
- Risk breakdowns: `Progressive-Learning-OS/02-Risks/YYYY-MM-DD-risk-breakdown.md`

The enriched markdown IS the artifact -- there is no separate visual layer. The same file renders as plain text in any markdown viewer and as rich visual content in Obsidian.

## How the Rendering Workflow Fits the Cycle

1. Create artifact using the enriched template (frontmatter + Mermaid + callouts)
2. File it in the appropriate Obsidian vault folder
3. Dataview queries in `00-Index/current-cycle.md` automatically pick up the new artifact
4. If Charts plugin is installed, KPI trend blocks render inline

This keeps the Obsidian-first workflow with no external dependencies.

## Security Notes

- No shell commands are executed for visual rendering
- No external CDN dependencies -- all rendering is local via Obsidian
- Inline HTML is limited to safe elements (`<progress>`, `<span>` with style attributes)
- No user input is interpolated into executable contexts
- Frontmatter values are plain YAML -- no code execution
