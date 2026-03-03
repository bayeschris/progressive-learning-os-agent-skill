---
description: Render a Progressive Learning OS learn card as an Obsidian-enriched markdown note with Mermaid diagrams, callout blocks, and confidence gauges
---
Generate an Obsidian-enriched markdown learn card using patterns from `references/18-obsidian-enriched-patterns.md` and the template structure in `references/03-learn-card.md`.

**Data source:** Read the learn card content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed learn card)

**Page structure:**

1. **YAML frontmatter** -- populate the learn card schema:
   ```yaml
   ---
   type: learn-card
   topic: "<actual topic>"
   risk-bucket: "<linked risk>"
   confidence: <0-100>
   status: open | partial | resolved
   unknowns-count: <count>
   date: <today>
   objective-link: "[[<objective note>]]"
   decision-packet-link: "[[<packet note>]]"
   ---
   ```

2. **Header** -- topic name as H1, linked risk bucket as inline text. Use `risk-bucket:: <value>` for Dataview queryability.

3. **Unknowns** -- render each unknown as a `> [!question]` callout with:
   - The unknown statement
   - Status badge: `<span style="color:red">Open</span>` / `<span style="color:#e68a00">Partial</span>` / `<span style="color:green">Resolved</span>`
   - Linked evidence if available

4. **Evidence Plan** -- use a `> [!example]` callout containing:
   - Source targets with `[[wikilinks]]` or URLs where available
   - Minimum evidence bar

5. **Evidence linkage diagram** -- Mermaid flowchart showing topic -> unknowns -> sources, with source nodes color-coded by evidence strength (green=strong, amber=moderate, red=weak).

6. **Teach-back** -- use a `> [!abstract]` callout (highest visual prominence). Numbered list of 5-10 bullets in the learner's own words. This is the core of the card.
   - **Format constraint:** Output ONLY a numbered list. Do NOT write prose paragraphs.
   - **Negative constraint:** Do NOT embed graphs, tables, Mermaid diagrams, Chart.js blocks, or data visualizations inside the teach-back callout. No data blocks, no chart code, and no visual elements of any kind. These belong exclusively in the Evidence Plan and Evidence Linkage Diagram sections.
   - **Voice:** Learner-direct, first-person statements -- e.g., "X works by...", "The key tradeoff is...", "I was wrong about Y because..."

7. **Applied Output** -- use a `> [!tip]` callout showing the artifact produced and how it changes the active decision.

8. **Confidence Meter** -- inline HTML progress bar:
   ```
   <progress value="<N>" max="100"></progress> **<N>%**
   ```
   Below it, a `> [!info]` callout with:
   - Remaining ambiguity
   - Next action to close ambiguity (as a highlighted call-to-action)

**Visual hierarchy:**
- Sections 1-2 and 6 dominate (hero: frontmatter properties panel + teach-back callout)
- Sections 3-5 are supporting detail (question/example callouts + Mermaid diagram)
- Sections 7-8 are reference (tip/info callouts + progress bar)

Write to the Obsidian vault path: `<vault>/Progressive-Learning-OS/03-Learn-Cards/YYYY-MM-DD-<topic-slug>.md`

$@
