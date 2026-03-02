# Visual Explainer Integration Guide

## Overview

The [Visual Explainer](https://github.com/nicobailon/visual-explainer) agent skill generates self-contained HTML pages for complex explanations. This integration connects it to the Progressive Learning OS so that learning cards, decision packets, and execution boards can be rendered as rich visual artifacts instead of plain text.

## Prerequisites

Visual Explainer must be installed as a separate Claude Code skill:

```bash
git clone https://github.com/nicobailon/visual-explainer.git ~/.claude/skills/visual-explainer
mkdir -p ~/.claude/commands
cp ~/.claude/skills/visual-explainer/prompts/*.md ~/.claude/commands/
```

## Security Review Summary

**Review date:** 2026-03-01
**Risk level:** LOW

| Category | Finding | Status |
|----------|---------|--------|
| Shell commands | Only `which surf`, `open`/`xdg-open`, `base64` | Safe |
| File writes | Output to `~/.agent/diagrams/` only | Safe |
| HTML generation | Self-contained, no user-injected content | Safe |
| Prompt injection | User input flows to agent reasoning, not shell | Safe |
| CDN dependencies | Pinned to major versions (mermaid@11, chart.js@4) | Safe |
| API keys | None stored or required by visual-explainer itself | Safe |
| Path traversal | No dynamic path construction from user input | Safe |

**Constraints to maintain:**
- Do not modify visual-explainer to accept arbitrary file write paths
- Do not pass raw user input directly into HTML template strings
- Do not add shell commands that interpolate user strings
- Keep CDN dependencies pinned to major versions to avoid supply chain risk

## Integration Points

### Learning artifacts that benefit from visual rendering

| Artifact | Visual Treatment | Template |
|----------|-----------------|----------|
| Learn Card (ref 03) | Styled card with evidence links, confidence meter, teach-back section | `prompts/visual-learn-card.md` |
| Decision Packet (ref 04) | Version comparison panels (v0.1/v0.2/v0.3) with promotion criteria indicators | `prompts/visual-decision-packet.md` |
| Day 0-7 Execution Board (ref 05) | Dashboard with KPI cards, progress bars, owner/status indicators | `prompts/visual-execution-board.md` |
| Risk Breakdown (ref 02) | Mermaid diagram of risk hierarchy with kill-probability ranking | Use `/generate-web-diagram` directly |
| Weekly Learning Review (ref 06) | Timeline with gap analysis and confidence progression | Use `/generate-web-diagram` directly |
| Publishing Bundle (ref 10) | Multi-panel page with LinkedIn/X/TikTok/arXiv sections | Use `/generate-web-diagram` directly |

### When to render visually

Use visual rendering when:
- A learn card has 3+ unknowns or a complex evidence chain
- A decision packet is being promoted (show before/after state)
- The day 0-7 board has 5+ tasks across multiple owners
- A risk breakdown has 4+ risk buckets with dependencies
- Any artifact will be shared with stakeholders or published

Skip visual rendering when:
- Quick status checks or single-item updates
- Terminal-only environments with no browser access
- The artifact is a simple 2-3 line summary

## Output Directory

All visual outputs are written to `~/.agent/diagrams/` with descriptive filenames:
- `learn-card-<topic>.html`
- `decision-packet-v0x-<topic>.html`
- `execution-board-<date>.html`

Files are opened in the browser automatically after generation.

## How the Rendering Workflow Fits the Cycle

The visual rendering step is optional and runs after the artifact is created in markdown. The cycle flow is:

1. Create artifact in markdown (existing workflow)
2. If visual criteria are met (complexity threshold), invoke the appropriate visual prompt
3. Visual-explainer generates HTML in `~/.agent/diagrams/`
4. Both markdown (for Obsidian) and HTML (for sharing/review) versions exist

This ensures the Obsidian-first workflow is preserved while adding a visual layer.
