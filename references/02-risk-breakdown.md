# Risk Breakdown Template

```yaml
---
type: risk-breakdown
risk-count: <integer>
highest-kill-probability: high | medium | low
date: YYYY-MM-DD
---
```

Rank by probability of invalidating the objective.

## Risk hierarchy diagram

```mermaid
flowchart TD
    OBJ["Objective"] --> R1
    OBJ --> R2
    OBJ --> R3

    R1["Risk 1: <name>"]:::high
    R2["Risk 2: <name>"]:::medium
    R3["Risk 3: <name>"]:::low

    R1 --> T1["Falsification: <test>"]
    R2 --> T2["Falsification: <test>"]
    R3 --> T3["Falsification: <test>"]

    classDef high fill:#e74c3c,color:#fff,stroke:#c0392b
    classDef medium fill:#f39c12,color:#fff,stroke:#e67e22
    classDef low fill:#27ae60,color:#fff,stroke:#1e8449
```

## Top risks (3-5)

> [!danger] Risk 1: <name>
> - Kill probability: <span style="color:red">High</span> / <span style="color:#e68a00">Medium</span> / <span style="color:green">Low</span>
> - Why it can kill the program:
> - Earliest falsification test:

> [!warning] Risk 2: <name>
> - Kill probability:
> - Why it can kill the program:
> - Earliest falsification test:

> [!info] Risk 3: <name>
> - Kill probability:
> - Why it can kill the program:
> - Earliest falsification test:

## Prioritization
- Highest-risk-first order:
- Why this order:

## Immediate work queue

> [!tip] Next Actions
> - Risk #1 next action:
> - Risk #2 next action:
> - Risk #3 next action:

---

<details><summary>Plain-text version (no plugins required)</summary>

## Top risks (3-5)
1. Risk:
   - Why it can kill the program:
   - Earliest falsification test:
2. Risk:
3. Risk:

## Prioritization
- Highest-risk-first order:
- Why this order:

## Immediate work queue
- Risk #1 next action:
- Risk #2 next action:
- Risk #3 next action:

</details>
