---
description: Migrate Obsidian vault from old layouts to the lowercase 4-category layout (research/learning/publishing/process) and normalize all directory and filenames
---
Migrate an Obsidian vault from any old Progressive Learning OS folder structure to the current standard. This includes both layout changes (numbered folders → 4-category) and filename normalization (lowercase, no spaces, alphanumeric + hyphens only).

**Old layouts (any of these):**
```
<vault>/<slug>/
  00-Index/
  01-Objective/
  02-Risks/
  03-Learn-Cards/
  04-Research/
  05-Execution/
  06-Publishing/
  07-Skill-Evolution/
  08-Research-Improvement/
```
or:
```
<vault>/domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/
  00-Index/ ... 08-Research-Improvement/
```
or title-case 4-category (previous standard):
```
<vault>/<slug>/
  Dashboard.md
  Research/
    Shared/
    <Modality>/
  Learning/
  Publishing/
  Process/
  10-Hubs/
    Stations/
    Skills/
    ...
```

**Current standard:**
```
<vault>/<slug>/
  dashboard.md
  research/
    shared/              ← multi-modality only
    <modality>/          ← kebab-case (e.g. small-molecule/)
  learning/
    <modality>/          ← optional
  publishing/
  process/
  hubs/
    stations/
    skills/
    tools/
    communities/
    people/
    competitors/
    concepts/
  project-config.yaml
```

## Naming standard

All directories and filenames MUST be:
- **Lowercase** — no uppercase characters
- **No spaces** — use hyphens as separators
- **Alphanumeric + hyphens only** — strip all other special characters (except `.` for file extensions)
- Pattern: `[a-z0-9-]+` (plus `.md`/`.yaml` extension)

Examples:
- `Dashboard.md` → `dashboard.md`
- `Research/` → `research/`
- `10-Hubs/Stations/` → `hubs/stations/`
- `Station 1 - LISTEN.md` → `station-1-listen.md`
- `App Store Connect API.md` → `app-store-connect-api.md`
- `Small Molecule/` → `small-molecule/`
- `r-Genealogy.md` → `r-genealogy.md`
- `PRAW.md` → `praw.md`
- `Connie Knox.md` → `connie-knox.md`

## File mapping

| Old location | New location | Notes |
|-----------|-------------|-------|
| `00-Index/current-cycle.md` | `dashboard.md` | Rewrite as dashboard with per-category `> Next:` lines |
| `01-Objective/*.md` | `research/` or `research/shared/` | shared if multi-modality |
| `02-Risks/*.md` | `research/` or `research/shared/` | shared if multi-modality |
| `03-Learn-Cards/*.md` | `learning/` or `learning/<modality>/` | Sort by modality if identifiable |
| `04-Research/*.md` | `research/` or `research/<modality>/` | Decision packets + deep dives |
| `05-Execution/*.md` | `research/` or `research/<modality>/` | Execution boards live with their modality's research |
| `06-Publishing/*.md` | `publishing/` | Flat |
| `07-Skill-Evolution/*.md` | `process/` | Flat |
| `08-Research-Improvement/*.md` | `process/` | Flat |
| `10-Hubs/**/*.md` | `hubs/` | Rename subcategories and files to lowercase kebab-case |
| `Dashboard.md` | `dashboard.md` | Title-case → lowercase |
| `Research/` | `research/` | Title-case → lowercase |
| `Learning/` | `learning/` | Title-case → lowercase |
| `Publishing/` | `publishing/` | Title-case → lowercase |
| `Process/` | `process/` | Title-case → lowercase |
| `Shared/` | `shared/` | Title-case → lowercase |

## Steps

1. **Resolve vault path.** Follow this order strictly — STOP at first match. Do NOT run `find`, `ls`, or scan the filesystem.
   1. If the user passed an explicit vault name, use `~/Documents/Obsidian/<vault-name>/`.
   2. Read `project-config.yaml` in the working directory. If it has a `vault` key, use that path. STOP.
   3. Check project memory files for a stored vault path. STOP.
   4. If the working directory or a parent contains `.obsidian/`, use that. STOP.
   5. Ask the user. Store the answer in project memory.

2. **Detect layout version.** Scan the vault for:
   - Numbered folders: `*/00-Index/` + `*/01-Objective/` pattern
   - Old nested: `Progressive-Learning-OS/` at vault root or under `domains/*/tracks/*/obsidian/`
   - Title-case 4-category: `*/Dashboard.md` + `*/Research/` + `*/Learning/`
   - Current standard: already lowercase with `dashboard.md` + `research/` + `learning/`

   List all discovered projects with their current paths and detected layout version. If already current, tell the user and stop.

3. **Detect modalities.** Read the objective and execution boards to determine if the project has multiple modalities. If yes, create modality subfolders (kebab-case). If single-track, keep flat.

4. **Derive slug.** From the objective file or domain/track names. Show the user the proposed slug. Proceed unless they object.

5. **Compute rename plan.** For every directory and file, compute the normalized name:
   - Lowercase the entire path
   - Replace spaces with hyphens
   - Strip characters not matching `[a-z0-9-.]`
   - Collapse multiple hyphens into one
   - Strip leading/trailing hyphens from each path segment

6. **Dry-run output.** Print the full plan as a table:
   ```
   Old path                              → New path
   <slug>/Dashboard.md                   → <slug>/dashboard.md
   <slug>/Research/Small Molecule/...    → <slug>/research/small-molecule/...
   <slug>/10-Hubs/Stations/Station 1...  → <slug>/hubs/stations/station-1-listen.md
   ```
   Wait for user confirmation before proceeding.

7. **Move and rename files** according to the plan. Process bottom-up (deepest files first, then rename directories).

8. **Update internal wikilinks.** Scan all moved files and update `[[wikilinks]]` to match new filenames. Use aliases to preserve human-readable display text:
   - `[[Station 1 - LISTEN]]` → `[[station-1-listen|Station 1 - LISTEN]]`
   - `[[PRAW]]` → `[[praw|PRAW]]`
   - `[[Dashboard]]` → `[[dashboard]]`

9. **Create dashboard.md** (if migrating from numbered layout). Read the old `current-cycle.md` and rewrite as a dashboard with:
   - Objective one-liner
   - Status + decision date + blockers
   - Per-category `> Next:` blockquotes
   - Links to all artifacts grouped by category

10. **Create project-config.yaml** from domain-config.yaml / track-config.yaml if they exist, or infer from content.

11. **Update Dataview queries.** Replace old folder paths in all files:
    - `"<slug>/03-Learn-Cards"` → `"<slug>/learning"`
    - `"<slug>/04-Research"` → `"<slug>/research"`
    - `"<slug>/05-Execution"` → `"<slug>/research"`
    - `"<slug>/Research"` → `"<slug>/research"`
    - `"<slug>/Learning"` → `"<slug>/learning"`
    - `"<slug>/Publishing"` → `"<slug>/publishing"`
    - etc.

12. **Clean up.** Remove empty old directories. Do NOT delete any folder that still contains files.

13. **Verify.** Count files before and after — numbers must match. Report: "Migrated X files. Renamed Y directories and Z files to match naming standard."

## Safety rules

- **Dry run first.** Print the full plan (old path → new path for each file) and get user confirmation.
- **Never overwrite.** If target already exists and contains files, stop and ask.
- **Never delete files.** Only move them. Only delete empty directories.
- **Back up suggestion.** Recommend the user commit or back up their vault before running.

$@
