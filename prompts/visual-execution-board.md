---
description: Render a Progressive Learning OS day 0-7 execution board as a styled HTML dashboard with task cards, progress indicators, and owner assignments
---
Load the visual-explainer skill, then generate a visual HTML dashboard for a day 0-7 execution board from the Progressive Learning OS.

Follow the visual-explainer skill workflow. Read the reference template at `~/.claude/skills/visual-explainer/templates/data-table.html`, the architecture template at `~/.claude/skills/visual-explainer/templates/architecture.html`, and CSS patterns at `~/.claude/skills/visual-explainer/references/css-patterns.md` before generating. Use a blueprint or IDE-inspired aesthetic -- this is an operational dashboard, so favor clarity and density over decoration.

**Data source:** Read the execution board content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed execution board)

**Page structure:**

1. **Header** -- execution board title with date range (Day 0 date through Day 7 date). Use hero depth. Include a progress summary: X of Y tasks complete, Z blocked.

2. **KPI Dashboard** -- hero-number cards showing:
   - Total tasks (neutral)
   - Completed (green)
   - In progress (blue)
   - Blocked (red)
   - Days remaining (amber countdown)
   Use the KPI card pattern with large numbers and trend indicators.

3. **Timeline View** -- horizontal timeline bar showing Day 0 through Day 7 with:
   - Current day highlighted
   - Checkpoint markers at Day 1, Day 3, Day 7
   - Task density indicators at each day

4. **Task Board** -- the core section. Render as a three-column layout:
   - **Now** column: tasks in active execution (blue left border)
   - **Next** column: tasks queued for upcoming days (amber left border)
   - **Later** column: tasks for later in the cycle (dim/grey left border)

   Each task card includes:
   - Task name (prominent)
   - Owner (monospace label)
   - Success threshold (green badge)
   - Stop/rollback trigger (red badge)
   - Dependencies (linked task references)
   - Status: done (green check), in progress (blue spinner), blocked (red X)
   - Risk bucket link (which risk this task addresses)

5. **Checkpoint Status** -- cards for Day 1, Day 3, and Day 7 checkpoints:
   - What should be true by this checkpoint
   - Current status vs expected status
   - Color-coded: on track (green), at risk (amber), behind (red)

6. **Blockers** -- if any tasks are blocked, a dedicated section with:
   - Blocker description
   - Linked risk or evidence gap
   - Suggested unblock action
   - Visual treatment: red-tinted cards with high visual weight

7. **Daily Summary Footer** -- compact section showing:
   - What changed today and why
   - Tasks carried forward
   - One-line status for stakeholders

**Visual hierarchy:**
- Sections 1-2 are the visual anchor (hero KPI cards, large numbers)
- Sections 3-4 are the operational core (elevated, dense but readable)
- Sections 5-7 are supporting context (default/flat depth)

Include responsive section navigation. Write to `~/.agent/diagrams/` with filename `execution-board-<date>.html`. Open in browser.

$@
