---
description: Migrate Obsidian vault from old numbered-folder layout to the 4-category layout (Research/Learning/Publishing/Process)
---
Migrate an Obsidian vault from the old Progressive Learning OS folder structure to the new 4-category structure.

**Old layout (any of these):**
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

**New layout:**
```
<vault>/<slug>/
  Dashboard.md
  Research/
    Shared/              ← objective, risks, cross-cutting (multi-modality only)
    <Modality>/          ← one per modality
  Learning/
    <Modality>/          ← optional
  Publishing/
  Process/
  10-Hubs/               ← preserved if exists
  project-config.yaml
```

## File mapping

| Old folder | New location | Notes |
|-----------|-------------|-------|
| `00-Index/current-cycle.md` | `Dashboard.md` | Rewrite as Dashboard with per-category `> Next:` lines |
| `01-Objective/*.md` | `Research/` or `Research/Shared/` | Shared if multi-modality |
| `02-Risks/*.md` | `Research/` or `Research/Shared/` | Shared if multi-modality |
| `03-Learn-Cards/*.md` | `Learning/` or `Learning/<Modality>/` | Sort by modality if identifiable |
| `04-Research/*.md` | `Research/` or `Research/<Modality>/` | Decision packets + deep dives |
| `05-Execution/*.md` | `Research/` or `Research/<Modality>/` | Execution boards live with their modality's research |
| `06-Publishing/*.md` | `Publishing/` | Flat |
| `07-Skill-Evolution/*.md` | `Process/` | Flat |
| `08-Research-Improvement/*.md` | `Process/` | Flat |
| `10-Hubs/**/*.md` | `10-Hubs/` | Preserved as-is |

## Steps

1. **Resolve vault path** using the vault path resolution logic in SKILL.md.

2. **Detect old layout.** Scan the vault for:
   - `*/00-Index/` + `*/01-Objective/` pattern (numbered folders)
   - `Progressive-Learning-OS/` at vault root
   - `domains/*/tracks/*/obsidian/Progressive-Learning-OS/` anywhere under vault root

   List all discovered projects with their current paths. If none found, tell the user and stop.

3. **Detect modalities.** Read the objective and execution boards to determine if the project has multiple modalities (e.g., Small Molecule + AAV). If yes, create modality subfolders. If single-track, keep flat.

4. **Derive slug.** From the objective file or domain/track names. Show the user the proposed slug. Proceed unless they object.

5. **Move files** according to the file mapping table above. Sort learn cards, decision packets, and execution boards into the correct modality subfolder based on content.

6. **Create Dashboard.md.** Read the old `current-cycle.md` and rewrite as a Dashboard with:
   - Objective one-liner
   - Status + decision date + blockers
   - Per-category `> Next:` blockquotes
   - Links to all artifacts grouped by category

7. **Create project-config.yaml** from domain-config.yaml / track-config.yaml if they exist, or infer from content.

8. **Update Dataview queries.** Replace old folder paths:
   - `"<slug>/03-Learn-Cards"` → `"<slug>/Learning"`
   - `"<slug>/04-Research"` → `"<slug>/Research"`
   - `"<slug>/05-Execution"` → `"<slug>/Research"`
   - etc.

9. **Clean up.** Remove empty old directories. Do NOT delete any folder that still contains files.

10. **Verify.** Count files before and after — numbers must match. Report: "Migrated X files from old layout to 4-category structure."

## Safety rules

- **Dry run first.** Print the full plan (old path → new path for each file) and get user confirmation.
- **Never overwrite.** If target already exists and contains files, stop and ask.
- **Never delete files.** Only move them. Only delete empty directories.
- **Back up suggestion.** Recommend the user commit or back up their vault before running.

$@
