---
description: Render a Progressive Learning OS learn card as an Obsidian-enriched markdown note with Mermaid diagrams, callout blocks, and confidence gauges
---
Generate an Obsidian-enriched markdown learn card using patterns from `references/output/enriched-patterns.md` and the template structure in `references/cycle/03-learn-card.md`.

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
   - Each source must include an evidence tier badge rendered as an inline span:
     - `<span style="background:#27ae60;color:white;padding:2px 6px;border-radius:3px;font-size:0.85em">[peer-reviewed]</span>` (tier 1)
     - `<span style="background:#2980b9;color:white;padding:2px 6px;border-radius:3px;font-size:0.85em">[preprint]</span>` (tier 2)
     - `<span style="background:#f39c12;color:white;padding:2px 6px;border-radius:3px;font-size:0.85em">[industry-report]</span>` (tier 3)
     - `<span style="background:#e74c3c;color:white;padding:2px 6px;border-radius:3px;font-size:0.85em">[press-release]</span>` (tier 4)
     - `<span style="background:#95a5a6;color:white;padding:2px 6px;border-radius:3px;font-size:0.85em">[unverified / no source]</span>` (tier 5)
   - Minimum evidence bar
   - If all sources are tier 4-5 only, add a `> [!warning] Low evidence quality` callout within the Evidence Plan stating that no peer-reviewed or preprint evidence was found

5. **Evidence linkage diagram** -- Mermaid flowchart showing topic -> unknowns -> sources, with source nodes color-coded by evidence tier: tier 1-2 = green (strong), tier 3 = amber (moderate), tier 4-5 = red (weak). Each source node label must include the tier label (e.g., `[peer-reviewed] Smith et al. 2024`).

6. **Teach-back** -- use a `> [!abstract]` callout (highest visual prominence). Numbered list of 5-10 bullets in the learner's own words. This is the core of the card.
   - **Format constraint:** Output ONLY a numbered list. Do NOT write prose paragraphs.
   - **Negative constraint:** Do NOT embed graphs, tables, Mermaid diagrams, Chart.js blocks, or data visualizations inside the teach-back callout. No data blocks, no chart code, and no visual elements of any kind. These belong exclusively in the Evidence Plan and Evidence Linkage Diagram sections.
   - **Voice:** Learner-direct, first-person statements -- e.g., "X works by...", "The key tradeoff is...", "I was wrong about Y because..."

7. **Applied Output** -- use a `> [!tip]` callout showing the artifact produced and how it changes the active decision.

8. **Confidence Meter** -- inline HTML progress bar:
   ```
   <progress value="<N>" max="100"></progress> **<N>%**
   ```
   Apply tier-based confidence caps before rendering:
   - Tier 1-2 sources only: standard range (0-100%)
   - Tier 3 sources: cap at 60%
   - Tier 4-5 sources only: cap at 35%

   Below it, a `> [!info]` callout with:
   - Highest evidence tier available
   - Confidence cap applied (if any)
   - Remaining ambiguity
   - Next action to close ambiguity (as a highlighted call-to-action)

   When confidence is capped due to tier 4-5 evidence, add a `> [!warning] Low evidence quality` callout explaining that confidence is capped at 35% because no peer-reviewed or preprint-level evidence supports the core claims.

**Visual hierarchy:**
- Sections 1-2 and 6 dominate (hero: frontmatter properties panel + teach-back callout)
- Sections 3-5 are supporting detail (question/example callouts + Mermaid diagram)
- Sections 7-8 are reference (tip/info callouts + progress bar)

Write to the Obsidian vault path: `<vault>/<slug>/learning/YYYY-MM-DD-<topic-slug>.md`

$@
