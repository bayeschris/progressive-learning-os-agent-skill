# Issue #6 Validation Checklist: Source Reliability

This checklist defines the acceptance criteria for issue #6 as verifiable checks against the modified files.

---

## SKILL.md Checks

### CHECK-S1: Source Reliability Tier Table
- **File:** `SKILL.md`
- **Requirement:** A source-ranking tier table MUST be present with tiers 1-5
- **Pattern MUST exist:** `[peer-reviewed]`
- **Pattern MUST exist:** `[preprint]`
- **Pattern MUST exist:** `[industry-report]`
- **Pattern MUST exist:** `[press-release]`
- **Pattern MUST exist:** `[unverified / no source]`

### CHECK-S2: Mandatory Inline Citation Rule
- **File:** `SKILL.md`
- **Requirement:** A rule requiring inline citation with tier labels on every factual claim
- **Pattern MUST exist:** `inline citation` (case-insensitive)
- **Pattern MUST exist:** `tier label` or `tier` used in citation context

### CHECK-S3: Plan Viability Gate
- **File:** `SKILL.md`
- **Requirement:** A plan viability gate section requiring peer-reviewed evidence check before committing to a specific approach
- **Pattern MUST exist:** `plan viability gate` (case-insensitive)
- **Pattern MUST exist:** `speculative` (flagging approaches with only tier 4-5 evidence)
- **Pattern MUST exist:** `verification step` or `verify` in the gate context

### CHECK-S4: Conservative Confidence Scoring
- **File:** `SKILL.md`
- **Requirement:** Confidence scoring rules tied to source quality tiers
- **Pattern MUST exist:** `60%` or `60` as cap for tier 3
- **Pattern MUST exist:** `35%` or `35` as cap for tier 4-5
- **Pattern MUST exist:** `[!warning]` or `warning` callout for low evidence quality

### CHECK-S5: Integration with Existing Steps
- **File:** `SKILL.md`
- **Requirement:** Source reliability rules integrated into the existing step sequence (step 4 "Gather and grade evidence" or as a new dedicated section)
- **Pattern MUST exist:** References to tier system within evidence gathering or a dedicated source reliability section

---

## references/03-learn-card.md Checks

### CHECK-L1: Evidence Tier Labels in Evidence Plan
- **File:** `references/03-learn-card.md`
- **Requirement:** Evidence Plan section must include tier labels for sources
- **Pattern MUST exist:** `[peer-reviewed]` or `[preprint]` or tier label notation in Evidence plan section

### CHECK-L2: Source Tier Field in Template
- **File:** `references/03-learn-card.md`
- **Requirement:** Source entries in Evidence Plan must have a tier/reliability indicator
- **Pattern MUST exist:** `tier` (case-insensitive) in the Evidence plan area

### CHECK-L3: Confidence Cap Rules
- **File:** `references/03-learn-card.md`
- **Requirement:** Confidence + gap section must include tier-based confidence cap rules
- **Pattern MUST exist:** `cap` or `maximum` related to confidence scoring
- **Pattern MUST exist:** `35` as cap for tier 4-5 sources
- **Pattern MUST exist:** `60` as cap for tier 3 sources

### CHECK-L4: Low Evidence Warning Callout
- **File:** `references/03-learn-card.md`
- **Requirement:** Warning callout for low evidence quality
- **Pattern MUST exist:** `[!warning]` in context of low evidence quality

### CHECK-L5: Evidence Linkage Diagram Tier Integration
- **File:** `references/03-learn-card.md`
- **Requirement:** Mermaid evidence linkage diagram legend or node labels should reference tiers
- **Pattern MUST exist:** `tier` or tier label in or near the Mermaid diagram section

---

## references/04-version-promotion-rubric.md Checks

### CHECK-V1: Evidence Tier Requirement in v0.2
- **File:** `references/04-version-promotion-rubric.md`
- **Requirement:** v0.2 criteria must reference evidence tier quality
- **Pattern MUST exist:** `tier` (case-insensitive) in v0.2 section

### CHECK-V2: Evidence Tier Requirement in v0.3
- **File:** `references/04-version-promotion-rubric.md`
- **Requirement:** v0.3 criteria must require peer-reviewed evidence for execution-critical claims
- **Pattern MUST exist:** `tier` or `peer-reviewed` in v0.3 section

### CHECK-V3: Speculative Flag for Low-Tier Evidence
- **File:** `references/04-version-promotion-rubric.md`
- **Requirement:** Promotion note or criteria must flag when execution plan relies on tier 4-5 evidence
- **Pattern MUST exist:** `speculative` or `tier 4` or `tier 5` or `unverified`

### CHECK-V4: Source Quality in Promotion Note
- **File:** `references/04-version-promotion-rubric.md`
- **Requirement:** Promotion note section must include source quality assessment
- **Pattern MUST exist:** `source quality` or `evidence quality` or `evidence tier`

---

## prompts/visual-decision-packet.md Checks

### CHECK-D1: Tier Badge in Evidence Map
- **File:** `prompts/visual-decision-packet.md`
- **Requirement:** Evidence Map table must include a tier/source reliability column or badge
- **Pattern MUST exist:** `tier` (case-insensitive) in Evidence Map section
- **Pattern MUST exist:** `[peer-reviewed]` or tier label notation

### CHECK-D2: Tier Badge Rendering Instructions
- **File:** `prompts/visual-decision-packet.md`
- **Requirement:** Instructions for rendering tier badges as visual indicators
- **Pattern MUST exist:** `tier` and (`badge` or `label` or `span`)

### CHECK-D3: Plan Viability Gate Reference
- **File:** `prompts/visual-decision-packet.md`
- **Requirement:** Reference to plan viability gate or speculative flag for low-tier evidence
- **Pattern MUST exist:** `speculative` or `viability` or `unverified`

---

## prompts/visual-learn-card.md Checks

### CHECK-VL1: Tier Labels in Evidence Plan Rendering
- **File:** `prompts/visual-learn-card.md`
- **Requirement:** Evidence Plan rendering instructions must include tier labels
- **Pattern MUST exist:** `tier` (case-insensitive) in Evidence Plan section

### CHECK-VL2: Tier Badge Rendering Instructions
- **File:** `prompts/visual-learn-card.md`
- **Requirement:** Instructions for rendering tier badges alongside sources
- **Pattern MUST exist:** `tier` and (`badge` or `label` or `span`)

### CHECK-VL3: Confidence Cap Visual Indicator
- **File:** `prompts/visual-learn-card.md`
- **Requirement:** Confidence meter section must reference tier-based caps
- **Pattern MUST exist:** `cap` or `tier` in Confidence Meter section

### CHECK-VL4: Low Evidence Warning Rendering
- **File:** `prompts/visual-learn-card.md`
- **Requirement:** Instructions for rendering warning callout when evidence is low-tier
- **Pattern MUST exist:** `[!warning]` or `warning` in context of evidence quality

---

## Cross-File Consistency Checks

### CHECK-X1: Tier Table Consistency
- **Requirement:** The same 5-tier system (peer-reviewed, preprint, industry-report, press-release, unverified/no source) must be referenced consistently across all modified files
- **Check:** All five tier labels appear in SKILL.md; other files reference the tier system defined in SKILL.md

### CHECK-X2: Confidence Cap Consistency
- **Requirement:** The same cap values (60% for tier 3, 35% for tier 4-5) must be used in both SKILL.md and references/03-learn-card.md
- **Check:** Both files contain matching cap values

### CHECK-X3: Plan Viability Gate Consistency
- **Requirement:** The plan viability gate concept in SKILL.md is referenced in the decision packet prompt
- **Check:** Both SKILL.md and prompts/visual-decision-packet.md reference viability gate or speculative flagging

---

**Total checks:** 23
