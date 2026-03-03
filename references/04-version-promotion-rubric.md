# Version Promotion Rubric (v0.1 -> v0.3)

```yaml
---
type: decision-packet
version: "0.1" | "0.2" | "0.3"
gate: go | hold | kill
decision-date: YYYY-MM-DD
evidence-count: <integer>
previous-version: "[[YYYY-MM-DD-decision-packet-v0.x]]"
---
```

## Version timeline

```mermaid
timeline
    title Decision Packet Progression
    v0.1 : Framing complete
         : Objective and decision gate locked
         : Top risk map complete
    v0.2 : Evidence materially improved
         : Key assumptions falsified or strengthened
         : Go/Hold/Kill thresholds clearer
    v0.3 : Execution-ready
         : Selected path tied to evidence
         : Stop rules explicit
```

## v0.1 (framing complete)

> [!info] v0.1 Criteria
> - [ ] Objective and decision gate locked
> - [ ] Top risk map complete
> - [ ] Initial hypothesis and stop conditions drafted

## v0.2 (evidence materially improved)

> [!info] v0.2 Criteria
> - [ ] High-priority evidence gaps reduced
> - [ ] At least one key assumption falsified or strengthened
> - [ ] Updated Go/Hold/Kill with clearer thresholds
> - [ ] Evidence tier labels assigned to all cited sources (tier 1-5)
> - [ ] Any claims backed only by tier 4-5 evidence explicitly flagged as speculative or unverified

## v0.3 (execution-ready)

> [!success] v0.3 Criteria
> - [ ] Selected path tied to explicit evidence
> - [ ] Execution-critical claims backed by peer-reviewed or preprint evidence (tier 1-2); if only tier 4-5 evidence exists, the approach is flagged as speculative with a verification step in day 0-1
> - [ ] Operational plan for day 0-7 complete
> - [ ] Stop rules and rollback triggers explicit
> - [ ] Source quality assessment completed: all evidence tier labels verified and no unverified claims treated as confirmed

## Promotion note (required every version)

> [!quote] Promotion Note
> - **What changed:**
> - **Why it changed:**
> - **What remains uncertain:**
> - **Evidence quality assessment:** (Summarize the highest and lowest evidence tiers supporting key claims. Flag any execution-critical claims relying on tier 4-5 sources.)
> - **Speculative elements:** (List any approaches or claims in the plan that are based on tier 4-5 evidence and require verification.)

---

<details><summary>Plain-text version (no plugins required)</summary>

## v0.1 (framing complete)
Required:
- Objective and decision gate locked
- Top risk map complete
- Initial hypothesis and stop conditions drafted

## v0.2 (evidence materially improved)
Required:
- High-priority evidence gaps reduced
- At least one key assumption falsified or strengthened
- Updated Go/Hold/Kill with clearer thresholds
- Evidence tier labels assigned to all cited sources (tier 1-5)
- Any claims backed only by tier 4-5 evidence explicitly flagged as speculative or unverified

## v0.3 (execution-ready)
Required:
- Selected path tied to explicit evidence
- Execution-critical claims backed by peer-reviewed or preprint evidence (tier 1-2); if only tier 4-5 evidence exists, flag as speculative with verification step in day 0-1
- Operational plan for day 0-7 complete
- Stop rules and rollback triggers explicit
- Source quality assessment completed: all evidence tier labels verified

## Promotion note (required every version)
- What changed:
- Why it changed:
- What remains uncertain:
- Evidence quality assessment: (highest/lowest evidence tiers for key claims)
- Speculative elements: (claims based on tier 4-5 evidence requiring verification)

</details>
