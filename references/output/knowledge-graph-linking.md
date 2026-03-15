# Knowledge Graph Linking Standard

Obsidian's power comes from backlinks and graph view. Every note the skill produces must participate in a dense link graph — not just cross-links at the bottom, but **inline wikilinks wherever a shared concept appears in body text**.

---

## Hub Notes

Hub notes are small linking nodes that accumulate backlinks. They live under `hubs/` and serve as the connective tissue of the vault.

### Hub categories

| Category | Path | What gets a hub | Example |
|----------|------|----------------|---------|
| **stations** | `hubs/stations/` | Each factory station or major workflow stage | `station-1-listen.md` |
| **skills** | `hubs/skills/` | Each Claude Code skill (existing or planned) | `design-review.md`, `swarm.md` |
| **tools** | `hubs/tools/` | External tools, APIs, platforms referenced across multiple notes | `praw.md`, `app-store-connect-api.md` |
| **communities** | `hubs/communities/` | Online communities, groups, forums, podcasts, channels | `r-genealogy.md`, `genealogy-discord.md` |
| **people** | `hubs/people/` | Key contacts, influencers, interviewees | `connie-knox.md` |
| **competitors** | `hubs/competitors/` | Competitor products or companies | `camscanner.md`, `cleo-ai.md` |
| **concepts** | `hubs/concepts/` | Recurring strategic concepts | `ai-factory.md`, `foundry-factory-framework.md` |

### Hub note template

```markdown
---
type: hub
tags:
  - <category>
  - <topic-specific-tags>
---

# <Name>

<1-2 sentence description>

## Used By / Relevance
- [[Note 1]] — <how it relates>
- [[Note 2]] — <how it relates>

## Key References
- [[Primary document that discusses this in depth]]

## Details
<Optional: cost, members, URL, or other key facts>
```

### When to create a hub

Create a hub note when a concept, tool, community, or entity is:
1. Referenced in **2+ separate documents**, OR
2. Likely to be referenced again in future documents (e.g., a key API, a target community, a competitor)

Do NOT create hubs for one-off mentions that won't recur.

---

## Inline Linking Rules

### Rule 1: Link on first mention in each section

When a hub-worthy concept appears in body text, link it with a wikilink **on its first mention in each major section** (H2 level). Do not link every single occurrence — that creates visual noise.

**Good:**
```markdown
## Channel 1: Reddit
Monitored via [[praw|PRAW]] (free tier). Primary target is [[r-genealogy|r/Genealogy]].
Later in this section, PRAW's stream.submissions() function...
```

**Bad (over-linking):**
```markdown
Monitored via [[praw|PRAW]] (free tier). [[praw|PRAW]]'s stream feature... using [[praw|PRAW]] we can...
```

### Rule 2: Link in table cells for key entities

When tables reference tools, communities, stations, or other hub-worthy entities, link them in the table:

```markdown
| `app-store-reviews` | [[station-1-listen\|LISTEN]] | Fetch reviews via [[app-store-connect-api\|App Store Connect API]] |
```

Use the pipe alias syntax `[[target\|Display Text]]` when the hub note name doesn't read naturally inline.

### Rule 3: Link station flow in every document

Every document that is part of a multi-station workflow should include station flow links in its cross-links section:

```markdown
## Cross-links

### Factory flow
- **This station:** [[station-1-listen|Station 1 - LISTEN]]
- **Feeds into:** [[station-2-think|Station 2 - THINK]]
- **Receives from:** [[station-6-market|Station 6 - MARKET]], [[station-7-learn|Station 7 - LEARN]]
```

### Rule 4: Link to parent and sibling documents

Every deep-dive document should link back to its parent architecture document and sibling deep-dives:

```markdown
Part of the [[2026-03-09-ai-factory-architecture|AI Factory Architecture]].
See also: [[2026-03-09-station-2-think-deep-dive]].
```

---

## Linking Checklist (run before finalizing any note)

Before writing a file to the vault, scan the content for these linkable categories:

- [ ] **Station references** — Any mention of LISTEN, THINK, BUILD, TEST, SHIP, MARKET, LEARN, ORCHESTRATE → link to `[[station-n-name]]` (use alias for display: `[[station-1-listen|Station 1 - LISTEN]]`)
- [ ] **Tool/API references** — Any mention of a tool, API, or platform (PRAW, Firebase, Sentry, Appfigures, etc.) → check if hub exists, create if referenced 2+ times, link to `[[tool-name]]` (use alias for display: `[[praw|PRAW]]`)
- [ ] **Community references** — Any mention of a subreddit, Facebook group, Discord, podcast, YouTube channel → check if hub exists, create if referenced 2+ times, link to `[[community-name]]`
- [ ] **Skill references** — Any mention of a Claude Code skill (`/swarm`, `design-review`, etc.) → link to skill hub if it exists
- [ ] **Competitor references** — Any mention of a competitor product → link to competitor hub
- [ ] **Cross-document references** — Any mention of another vault document by concept (not just in cross-links) → add inline wikilink
- [ ] **Parent document link** — Does this document link back to its parent architecture/index document?
- [ ] **Station flow** — Does this document indicate where it sits in the factory pipeline?

---

## Hub Maintenance

### On every skill run:
1. **Scan for new hub candidates** — If a new tool, community, or concept appears in 2+ places across the outputs, create a hub note for it.
2. **Update existing hubs** — If a document references an existing hub entity, check that the hub's "Used By" section includes a backlink to the new document. (Obsidian's backlinks panel handles this automatically, but explicit links in the hub are clearer.)
3. **Don't orphan notes** — Every note must link to at least one other note. If a note has zero outgoing wikilinks, it's missing connections.

### Hub naming conventions:

All hub filenames must be **lowercase, no spaces, alphanumeric + hyphens only** (`[a-z0-9-]+.md`). Use wikilink aliases for human-readable display names.

- **Subreddits:** `r-genealogy.md` — display via `[[r-genealogy|r/Genealogy]]`
- **Facebook groups:** `technology-for-genealogy.md` — display via `[[technology-for-genealogy|Technology for Genealogy]]`
- **Tools/APIs:** `praw.md`, `app-store-connect-api.md` — display via `[[praw|PRAW]]`
- **Stations:** `station-1-listen.md` — display via `[[station-1-listen|Station 1 - LISTEN]]`
- **People:** `connie-knox.md` — display via `[[connie-knox|Connie Knox]]`
- **General rule:** Lowercase the name, replace spaces with hyphens, strip non-alphanumeric chars (except hyphens)
