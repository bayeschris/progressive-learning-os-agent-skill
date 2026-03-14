# Project Organization

## Output structure

Each project is a folder in the Obsidian vault, named by the auto-derived slug:

```text
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

## Bootstrap checklist
1. Derive project slug from objective (kebab-case).
2. Resolve the Obsidian vault path (see SKILL.md vault path resolution).
3. Scan existing `<vault>/` folders for a matching slug — resume if found.
4. Create `<vault>/<slug>/` with numbered artifact folders if new.
5. Start daily tri-track loop.

## Rule
The skill repo (`SKILL.md`, `references/`, `prompts/`, `assets/`) is read-only during execution. All active outputs go into the vault.
