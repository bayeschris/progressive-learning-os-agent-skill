# GitHub-First Organization (Core → Domains → Tracks)

Set up repository structure before running any cycle.

## Canonical layout
```text
project-os/
  core/
    skills/progressive-learning-os/
    templates/
    rubrics/
  domains/
    rare-disease/
      domain-config.yaml
      templates/
      tracks/
        cmt1b/
          track-config.yaml
          obsidian/
    agentic-frameworks/
      domain-config.yaml
      templates/
      tracks/
    vertical-farming/
      domain-config.yaml
      templates/
      tracks/
```

## Config precedence (required)
1. `core` defaults
2. `domains/<domain>/domain-config.yaml`
3. `domains/<domain>/tracks/<track>/track-config.yaml`

Track-level config always wins on conflict.

## Bootstrap checklist
1. Create/confirm canonical folders.
2. Pick domain (or create new domain).
3. Create track under `domains/<domain>/tracks/<track>/`.
4. Add `track-config.yaml`.
5. Initialize Obsidian workspace in that track.
6. Start daily tri-track loop.

## Rule
Never write active outputs to `core/`. Active outputs must live under a track folder.
