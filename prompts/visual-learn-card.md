---
description: Render a Progressive Learning OS learn card as a styled HTML page with evidence links, confidence meter, and teach-back section
---
Load the visual-explainer skill, then generate a visual HTML page for a learn card from the Progressive Learning OS.

Follow the visual-explainer skill workflow. Read the reference template at `~/.claude/skills/visual-explainer/templates/architecture.html` and CSS patterns at `~/.claude/skills/visual-explainer/references/css-patterns.md` before generating. Use an editorial or paper/ink aesthetic with warm tones.

**Data source:** Read the learn card content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed learn card)

**Page structure:**

1. **Header** -- topic name and linked risk bucket as a monospace label with colored dot indicator. Use hero depth with larger type.

2. **Unknowns** -- render each unknown as a styled card with:
   - The unknown statement
   - Status indicator: open (amber), partially resolved (blue), resolved (green)
   - Linked evidence if available

3. **Evidence Plan** -- two-column layout:
   - Left: source targets with clickable links where available
   - Right: minimum evidence bar as a visual threshold indicator

4. **Teach-back** -- the teach-back bullets rendered as a clean numbered list with generous spacing. This is the core of the card -- give it visual prominence. Use elevated depth.

5. **Applied Output** -- card showing the artifact produced and how it changes the active decision. Use a callout box with accent border.

6. **Confidence Meter** -- a visual progress bar or gauge showing confidence (0-100) with:
   - Color gradient from red (0-30) through amber (31-60) to green (61-100)
   - Remaining ambiguity listed below
   - Next action to close ambiguity as a highlighted call-to-action

**Visual hierarchy:**
- Sections 1, 4, and 6 should dominate (hero/elevated depth)
- Sections 2-3 are supporting detail (default depth)
- Section 5 is reference (flat/recessed depth)

Write to `~/.agent/diagrams/` with filename `learn-card-<topic-slug>.html`. Open in browser.

$@
