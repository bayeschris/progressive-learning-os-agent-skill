# Skill Evolution Loop (Learn → Update Skill → Reuse)

Use this loop continuously so capabilities improve while execution continues.

## Trigger events (run loop when any occurs)
- New high-quality source/repository/tool is discovered
- A workflow step is repeatedly manual or error-prone
- A decision heuristic proves useful across >1 cycle
- A template fails or causes ambiguity

## Evolution cycle
1. **Capture**
   - Log the discovery in `skill-evolution-log.md` (what, where, why it matters).
2. **Decide scope**
   - If reusable: update skill references/templates/scripts.
   - If one-off: keep in project notes only.
3. **Patch skill**
   - Add or edit the smallest durable artifact (template, checklist, script, guardrail).
4. **Validate**
   - Run a quick proof on current work (did it reduce time, errors, or ambiguity?).
5. **Promote**
   - Record adoption rule: when this should be used next time.

## Update targets (in priority order)
1. `references/` knowledge and decision patterns
2. `assets/templates/` reusable outputs
3. `scripts/` deterministic repeated operations
4. `SKILL.md` only when behavior/sequence changes

## Quality bar for each skill update
- Reusability: useful in future cycles
- Specificity: clear trigger for use
- Evidence: linked to observed friction or win
- Brevity: minimal context cost

## Daily minimum (required)
At daily closeout, ship and log exactly 3 skill upgrades:
- Upgrade 1 (merged)
- Upgrade 2 (merged)
- Upgrade 3 (merged)

Score each using `references/13-skill-upgrade-scoring-rubric.md` and log totals.
If fewer than 3 can be safely merged, log blockers and include a catch-up plan for next day.