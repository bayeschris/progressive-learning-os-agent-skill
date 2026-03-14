# Project Organization

Set up project structure before running any cycle.

## Obsidian vault layout

Each research project gets a top-level folder in the Obsidian vault:

```text
Obsidian Vault/
  <project>/                    ← e.g., cmt1b-research/
    Dashboard.md
    Research/
    Learning/
    Publishing/
    Process/
    project-config.yaml         ← project metadata and constraints
  <another-project>/
    Dashboard.md
    Research/
    Learning/
    Publishing/
    Process/
    project-config.yaml
```

## project-config.yaml

Each project carries a config file with:
- `project`: slug (e.g., `cmt1b-research`)
- `domain`: research domain (e.g., `rare-disease`)
- `description`: what this project is about
- `evidence_required`: true/false
- `citation_format`: PMID/DOI/URL (if evidence required)
- `decision_framework`: go-hold-kill (default)
- `modalities`: list of parallel tracks (triggers subfolder creation)

## Bootstrap checklist
1. Create `<project>/` folder in Obsidian vault.
2. Add `project-config.yaml`.
3. Create `Dashboard.md` with objective and status.
4. Create `Research/`, `Learning/`, `Publishing/`, `Process/` folders.
5. If multi-modality: create subfolders under `Research/` and `Learning/`.
6. Start daily tri-track loop.

## Rule
Dashboard.md is the single entry point. Every artifact must be reachable from it.
