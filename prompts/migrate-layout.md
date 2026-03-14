---
description: Migrate Obsidian vault from the old nested layout (domains/tracks/obsidian/Progressive-Learning-OS/) to the new flat layout (<slug>/)
---
Migrate an Obsidian vault from the old Progressive Learning OS folder structure to the new flat structure.

**Old layout:**
```
<vault>/
  Progressive-Learning-OS/
    00-Index/
    01-Objective/
    ...
```
or:
```
<vault>/
  domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/
    00-Index/
    01-Objective/
    ...
```

**New layout:**
```
<vault>/
  <slug>/
    00-Index/
    01-Objective/
    02-Risks/
    03-Learn-Cards/
    04-Research/
    05-Execution/
    06-Publishing/
    07-Skill-Evolution/
    08-Research-Improvement/
    10-Hubs/
```

## Steps

1. **Resolve vault path** using the vault path resolution logic in SKILL.md.

2. **Detect old layout.** Scan the vault for:
   - `Progressive-Learning-OS/` at vault root
   - `domains/*/tracks/*/obsidian/Progressive-Learning-OS/` anywhere under vault root
   - Any folder matching `*/Progressive-Learning-OS/0*-*` pattern

   List all discovered projects with their current paths. If none found, tell the user and stop.

3. **Derive slug for each project.** For each discovered project:
   - Read the objective file (`01-Objective/*objective*.md`) if it exists — derive slug from the objective text.
   - If no objective file, derive slug from the old domain/track names (e.g., `rare-disease` + `cmt1b` → `rare-disease-cmt1b`).
   - If just `Progressive-Learning-OS/` at root with no domain/track context, ask the user for a project name.
   - Show the user the proposed slug and old path. Proceed unless they object.

4. **Move files.** For each project:
   - Create `<vault>/<slug>/` if it doesn't exist.
   - Move all contents of the old `Progressive-Learning-OS/` folder into `<vault>/<slug>/`.
   - Preserve the numbered subfolder structure (`00-Index/`, `01-Objective/`, etc.) as-is.

5. **Update internal references.** In all moved `.md` files:
   - Replace Dataview `FROM "Progressive-Learning-OS/` with `FROM "<slug>/`
   - Replace wikilink paths that include `Progressive-Learning-OS/` with just the filename (Obsidian resolves by filename anyway)
   - Replace any `domains/<domain>/tracks/<track>/obsidian/Progressive-Learning-OS/` path strings with `<slug>/`

6. **Clean up.** Remove empty directories left behind:
   - Empty `Progressive-Learning-OS/` folders
   - Empty `obsidian/` folders
   - Empty `tracks/` and `domains/` folders
   - Do NOT delete any folder that still contains files.

7. **Verify.** After migration:
   - Confirm all numbered folders exist under `<vault>/<slug>/`
   - Confirm `00-Index/current-cycle.md` exists and its Dataview queries point to the new paths
   - Count files before and after — numbers must match
   - Report: "Migrated X files from `<old-path>` to `<vault>/<slug>/`"

## Safety rules

- **Dry run first.** Before moving anything, print the full plan (old path → new path for each project) and get user confirmation.
- **Never overwrite.** If `<vault>/<slug>/` already exists and contains files, stop and ask the user how to handle the conflict.
- **Never delete files.** Only move them. Only delete empty directories.
- **Back up suggestion.** Recommend the user commit or back up their vault before running this migration.

$@
