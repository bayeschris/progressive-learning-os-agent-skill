# Project Organization

## Output structure

Each project is a folder in the Obsidian vault, named by the auto-derived slug:

```text
<vault>/
  <slug>/
    Dashboard.md
    Research/
      Shared/            ← only for multi-modality projects
      <Modality>/        ← one per modality
    Learning/
      <Modality>/        ← optional, mirrors Research layout
    Publishing/
    Process/
    10-Hubs/
    project-config.yaml
```

For single-modality projects, omit `Shared/` and `<Modality>/` subfolders — files go directly in `Research/` and `Learning/`.

## project-config.yaml

Each project carries a config file with:
- `project`: slug
- `domain`: research domain (e.g., `rare-disease`)
- `description`: what this project is about
- `evidence_required`: true/false
- `citation_format`: PMID/DOI/URL (if evidence required)
- `decision_framework`: go-hold-kill (default)
- `modalities`: list of parallel tracks (triggers subfolder creation)

## Bootstrap checklist
1. Derive project slug from objective (kebab-case).
2. Resolve the Obsidian vault path (see SKILL.md vault path resolution).
3. Scan existing `<vault>/` folders for a matching slug — resume if found.
4. Create `<vault>/<slug>/` with `Dashboard.md`, `Research/`, `Learning/`, `Publishing/`, `Process/`.
5. If multi-modality: create subfolders under `Research/` and `Learning/`.
6. Create `project-config.yaml`.
7. Start daily tri-track loop.

## Rule
The skill repo (`SKILL.md`, `references/`, `prompts/`, `assets/`) is read-only during execution. All active outputs go into the vault. Dashboard.md is the single entry point — every artifact must be reachable from it.
