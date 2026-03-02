---
description: Render a Progressive Learning OS decision packet as a styled HTML page with version progression, evidence map, and promotion criteria
---
Load the visual-explainer skill, then generate a visual HTML page for a decision packet from the Progressive Learning OS.

Follow the visual-explainer skill workflow. Read the reference template at `~/.claude/skills/visual-explainer/templates/architecture.html`, the data table template at `~/.claude/skills/visual-explainer/templates/data-table.html`, and CSS patterns at `~/.claude/skills/visual-explainer/references/css-patterns.md` before generating. Use a blueprint aesthetic with deep slate/blue palette for authority and precision.

**Data source:** Read the decision packet content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed decision packet)

**Page structure:**

1. **Header** -- decision packet title, current version (v0.1/v0.2/v0.3), and decision date. Use hero depth with a prominent version badge. Color the badge: amber for v0.1, blue for v0.2, green for v0.3.

2. **Version Timeline** -- horizontal timeline showing version progression:
   - v0.1: hypothesis and risk map complete
   - v0.2: key evidence gaps reduced
   - v0.3: execution-ready with explicit stop rules
   - Current version highlighted, future versions dimmed
   - "What changed and why" annotation at each transition

3. **Hypothesis and Risk Map** -- Mermaid diagram showing the core hypothesis and linked risk buckets. Wrap in `.mermaid-wrap` with zoom controls. Nodes color-coded by kill probability: red for high, amber for medium, green for low.

4. **Evidence Map** -- table with columns:
   - Claim
   - Evidence source (PMID/DOI/URL)
   - Strength (strong/moderate/weak/missing)
   - Status indicator with colored dots

5. **Promotion Criteria** -- checklist-style card showing criteria for the next version. Met criteria in green with checkmarks, unmet in amber with empty circles. This makes it immediately clear what work remains.

6. **Stop Rules** (v0.3 only) -- styled callout cards with red borders showing explicit conditions under which the decision should be reversed or paused.

7. **Go/Hold/Kill Gate** -- prominent decision indicator:
   - Go: green badge with forward arrow
   - Hold: amber badge with pause icon
   - Kill: red badge with stop icon
   - Decision date and responsible owner

**Visual hierarchy:**
- Sections 1-2 anchor the page (hero depth, timeline is the visual centerpiece)
- Sections 3-4 are evidence and reasoning (elevated depth)
- Sections 5-7 are actionable outputs (elevated for 7, default for 5-6)

Include responsive section navigation if the packet has extensive evidence maps. Write to `~/.agent/diagrams/` with filename `decision-packet-v0x-<topic-slug>.html`. Open in browser.

$@
