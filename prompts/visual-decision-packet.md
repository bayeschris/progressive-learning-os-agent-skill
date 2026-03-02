---
description: Render a Progressive Learning OS decision packet as an Obsidian-enriched markdown note with Mermaid timelines, risk diagrams, and promotion criteria
---
Generate an Obsidian-enriched markdown decision packet using patterns from `references/18-obsidian-enriched-patterns.md` and the rubric in `references/04-version-promotion-rubric.md`.

**Data source:** Read the decision packet content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed decision packet)

**Page structure:**

1. **YAML frontmatter** -- populate the decision packet schema:
   ```yaml
   ---
   type: decision-packet
   version: "<0.1|0.2|0.3>"
   gate: <go|hold|kill>
   decision-date: <date>
   evidence-count: <count>
   previous-version: "[[<previous packet note>]]"
   ---
   ```

2. **Header** -- decision packet title as H1, current version as inline badge:
   - `<span style="background:#f39c12;color:white;padding:2px 8px;border-radius:4px">v0.1</span>` (amber)
   - `<span style="background:#3498db;color:white;padding:2px 8px;border-radius:4px">v0.2</span>` (blue)
   - `<span style="background:#27ae60;color:white;padding:2px 8px;border-radius:4px">v0.3</span>` (green)

3. **Version Timeline** -- Mermaid timeline diagram showing version progression with annotations at each transition ("what changed and why"). Current version highlighted, future versions show criteria needed.

4. **Hypothesis and Risk Map** -- Mermaid flowchart showing core hypothesis linked to risk buckets. Nodes color-coded by kill probability: red=high, amber=medium, green=low. Link to learn cards with `[[wikilinks]]`.

5. **Evidence Map** -- markdown table with columns:
   - Claim
   - Evidence source (PMID/DOI/URL or `[[wikilink]]`)
   - Strength: <span style="color:green">Strong</span> / <span style="color:#e68a00">Moderate</span> / <span style="color:red">Weak</span> / <span style="color:gray">Missing</span>

6. **Promotion Criteria** -- use `> [!info]` callout with checkbox list showing criteria for the next version. Format met criteria with `- [x]` and unmet with `- [ ]`.

7. **Stop Rules** (v0.3 only) -- use `> [!danger]` callouts, one per stop rule. Each states the explicit condition under which the decision should be reversed or paused.

8. **Go/Hold/Kill Gate** -- prominent gate indicator using the appropriate callout:
   - Go: `> [!success] Gate: GO` with decision date and responsible owner
   - Hold: `> [!warning] Gate: HOLD` with conditions to resume
   - Kill: `> [!danger] Gate: KILL` with rationale

**Visual hierarchy:**
- Sections 1-3 anchor the note (frontmatter + header + timeline diagram)
- Sections 4-5 are evidence and reasoning (Mermaid diagram + table)
- Sections 6-8 are actionable outputs (checklists + callouts)

Write to the Obsidian vault path: `<vault>/Progressive-Learning-OS/04-Research/YYYY-MM-DD-decision-packet-v0.x.md`

$@
