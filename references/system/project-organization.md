# Project Organization

## Output structure

Each project is a folder in the Obsidian vault, named by the auto-derived slug:

```text
<vault>/
  <slug>/
    dashboard.md
    research/
      shared/            ← only for multi-modality projects
      <modality>/        ← one per modality (kebab-case, e.g. small-molecule/)
    learning/
      <modality>/        ← optional, mirrors research layout
    publishing/
    process/
    hubs/
    project-config.yaml
```

For single-modality projects, omit `shared/` and `<modality>/` subfolders — files go directly in `research/` and `learning/`.

## project-config.yaml

A `project-config.yaml` can exist in two places:

1. **Repo-level** (in the working directory) — used during vault path resolution. Only needs the `vault` key:
   ```yaml
   vault: ~/Documents/Obsidian/MyVault
   ```

2. **Project-level** (inside `<vault>/<slug>/`) — created during bootstrap with full project metadata.

Project-level fields:
- `project`: slug
- `domain`: research domain (e.g., `rare-disease`)
- `description`: what this project is about
- `vault`: absolute or `~`-relative path to the Obsidian vault root
- `evidence_required`: true/false
- `citation_format`: PMID/DOI/URL (if evidence required)
- `decision_framework`: go-hold-kill (default)
- `modalities`: list of parallel tracks (triggers subfolder creation)

## Bootstrap checklist
1. Derive project slug from objective (kebab-case).
2. Resolve the Obsidian vault path (see SKILL.md vault path resolution).
3. Scan existing `<vault>/` folders for a matching slug — resume if found.
4. Create `<vault>/<slug>/` with `dashboard.md`, `research/`, `learning/`, `publishing/`, `process/`.
5. If multi-modality: create subfolders under `research/` and `learning/`.
6. Create `project-config.yaml`.
7. Start daily tri-track loop.

## Rule
The skill repo (`SKILL.md`, `references/`, `prompts/`, `assets/`) is read-only during execution. All active outputs go into the vault. `dashboard.md` is the single entry point — every artifact must be reachable from it.
