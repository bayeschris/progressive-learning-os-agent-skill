# Evidence Tiers and Citation Rules

## Source reliability tiers

Every factual claim must be tagged with its evidence tier at the point of use.

| Tier | Label | Examples |
|------|-------|---------|
| 1 | `[peer-reviewed]` | Published papers, systematic reviews, meta-analyses |
| 2 | `[preprint]` | arXiv, bioRxiv, medRxiv -- not yet peer-reviewed |
| 3 | `[industry-report]` | White papers, technical reports from recognized bodies |
| 4 | `[press-release]` | Company announcements, PR wire, blog posts |
| 5 | `[unverified / no source]` | No citation found; assumption only |

## Inline citation format

Cite the source and tier label inline with every factual claim:

```
AAV9 has demonstrated CNS tropism in non-human primates. [press-release -- Voyager Therapeutics, 2023; no peer-reviewed confirmation found]
```

Never present a tier 4-5 claim with the same confidence framing as a tier 1-2 claim. If only tier 4-5 sources exist, prefix with "Unverified:" or "Speculative:" and include the tier label.

## Confidence caps

Confidence scores in learn cards must reflect source quality:
- **Tier 1-2 sources only:** standard range (0-100%)
- **Tier 3 sources:** cap at 60%
- **Tier 4-5 sources only:** cap at 35% and add a `> [!warning] Low evidence quality` callout

## Plan viability gate

Before committing to a specific approach in the execution plan:
- **Tier 1-2 evidence:** proceed normally.
- **Tier 3 only:** note limitation, include verification step in first two days.
- **Tier 4-5 only:** flag as **speculative**, include verification as day-0 or day-1 action. Decision packet must not reach v0.3 until verified or replaced.

## Evidence workflow

If biomedical/scientific, use evidence-only workflow and cite PMID/DOI/URL.
Map each source to a specific claim in the active Learn Card.
Assign each source its tier label and ensure it appears alongside the citation in every artifact.

Check the study design classification from step 1; if observational or retrospective, ensure evidence gathering focuses on observational methods and does not assume interventional capability.
