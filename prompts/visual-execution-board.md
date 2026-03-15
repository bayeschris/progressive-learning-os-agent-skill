---
description: Render a Progressive Learning OS day 0-7 execution board as an Obsidian-enriched markdown note with KPI callouts, Mermaid timelines, and task status indicators
---
Generate an Obsidian-enriched markdown execution board using patterns from `references/output/enriched-patterns.md` and the template in `references/cycle/06-execution-board.md`.

**Data source:** Read the execution board content from:
- `$1` if a file path is provided
- Otherwise, gather from the current conversation context (the most recently discussed execution board)

**Page structure:**

1. **YAML frontmatter** -- populate the execution board schema:
   ```yaml
   ---
   type: execution-board
   date-range: "<start> to <end>"
   total-tasks: <count>
   completed: <count>
   blocked: <count>
   days-remaining: <count>
   ---
   ```

2. **Header** -- execution board title as H1 with date range. Include a progress summary line: "X of Y tasks complete, Z blocked".

3. **KPI Dashboard** -- use callout blocks as KPI cards:
   - `> [!info] Total Tasks` with the count as bold large text
   - `> [!success] Completed` with count
   - `> [!danger] Blocked` with count (omit if zero)
   - `> [!warning] Days Remaining` with countdown

4. **Timeline** -- Mermaid gantt chart showing Day 0 through Day 7 with:
   - Checkpoint milestones at Day 1, Day 3, Day 7
   - Task bars showing duration and dependencies
   - Current day indicated in the date axis

5. **Task Board** -- organized into three sections with status indicators:

   **Now (active)** -- each task as a `> [!info]` callout containing:
   - Task name (prominent)
   - Owner, success threshold, stop/rollback trigger
   - Dependencies as `[[wikilinks]]`
   - Status: <span style="color:#3498db">In Progress</span>

   **Next (queued)** -- same format, status: <span style="color:gray">Pending</span>

   **Later** -- same format, status: <span style="color:gray">Pending</span>

6. **Task dependency diagram** -- Mermaid flowchart showing task relationships, nodes color-coded by status (green=done, blue=in-progress, red=blocked, gray=pending).

7. **Checkpoint Status** -- `> [!info]` callouts for Day 1, Day 3, Day 7:
   - What should be true by this checkpoint
   - Current status vs expected
   - Color indicator: <span style="color:green">On track</span> / <span style="color:#e68a00">At risk</span> / <span style="color:red">Behind</span>

8. **Blockers** (if any) -- `> [!danger]` callouts, one per blocker:
   - Blocker description
   - Linked risk or evidence gap (`[[wikilink]]`)
   - Suggested unblock action

9. **Daily Summary Footer** -- `> [!quote]` callout with:
   - What changed today and why
   - Tasks carried forward
   - One-line status for stakeholders

**Visual hierarchy:**
- Sections 1-3 are the visual anchor (frontmatter + KPI callouts)
- Sections 4-6 are the operational core (Mermaid diagrams + task cards)
- Sections 7-9 are supporting context (checkpoint callouts + blockers)

Write to the Obsidian vault path: `<vault>/<slug>/research/YYYY-MM-DD-execution-board.md`

$@
