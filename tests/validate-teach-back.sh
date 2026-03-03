#!/usr/bin/env bash
# Validation script for Issue #3: Teach-back Feature Fix
# Checks that teach-back sections in 3 files follow correct format:
#   - Numbered list only (no prose paragraphs)
#   - No embedded graphs, tables, Mermaid diagrams, or data blocks
#   - Learner-direct voice guidance present

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASS_COUNT=0
FAIL_COUNT=0
TOTAL=0

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  TOTAL=$((TOTAL + 1))
  echo "  PASS: $1"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  TOTAL=$((TOTAL + 1))
  echo "  FAIL: $1"
}

echo "=== Teach-back Validation ==="
echo ""

# ---------------------------------------------------------------------------
# File 1: references/03-learn-card.md
# ---------------------------------------------------------------------------
FILE1="$REPO_ROOT/references/03-learn-card.md"
echo "--- File 1: references/03-learn-card.md ---"

if [ ! -f "$FILE1" ]; then
  fail "File does not exist: $FILE1"
else
  # Check 1.1: Teach-back section contains numbered list format guidance
  if grep -qi "numbered list" "$FILE1"; then
    pass "03-learn-card.md mentions 'numbered list' in teach-back guidance"
  else
    fail "03-learn-card.md does NOT mention 'numbered list' in teach-back guidance"
  fi

  # Check 1.2: Contains anti-pattern guidance (mentions what NOT to include)
  if grep -qiE "(no graphs|no tables|no mermaid|no data block|do not embed|do not include)" "$FILE1"; then
    pass "03-learn-card.md contains anti-pattern guidance (what NOT to include)"
  else
    fail "03-learn-card.md does NOT contain anti-pattern guidance (what NOT to include)"
  fi

  # Check 1.3: Contains learner-direct voice examples or guidance
  if grep -qiE "(works by|key tradeoff|I was wrong|learner-direct|first-person)" "$FILE1"; then
    pass "03-learn-card.md contains learner-direct voice guidance"
  else
    fail "03-learn-card.md does NOT contain learner-direct voice guidance"
  fi
fi

echo ""

# ---------------------------------------------------------------------------
# File 2: prompts/visual-learn-card.md
# ---------------------------------------------------------------------------
FILE2="$REPO_ROOT/prompts/visual-learn-card.md"
echo "--- File 2: prompts/visual-learn-card.md ---"

if [ ! -f "$FILE2" ]; then
  fail "File does not exist: $FILE2"
else
  # Check 2.1: Negative constraint about no graphs in teach-back
  if grep -qiE "(no graph|do not.*graph|never.*graph)" "$FILE2"; then
    pass "visual-learn-card.md has negative constraint about graphs in teach-back"
  else
    fail "visual-learn-card.md does NOT have negative constraint about graphs in teach-back"
  fi

  # Check 2.2: Negative constraint about no tables in teach-back
  if grep -qiE "(no table|do not.*table|never.*table)" "$FILE2"; then
    pass "visual-learn-card.md has negative constraint about tables in teach-back"
  else
    fail "visual-learn-card.md does NOT have negative constraint about tables in teach-back"
  fi

  # Check 2.3: Negative constraint about no Mermaid in teach-back
  if grep -qiE "(no mermaid|do not.*mermaid|never.*mermaid)" "$FILE2"; then
    pass "visual-learn-card.md has negative constraint about Mermaid in teach-back"
  else
    fail "visual-learn-card.md does NOT have negative constraint about Mermaid in teach-back"
  fi

  # Check 2.4: Negative constraint about no data blocks in teach-back
  if grep -qiE "(no data block|no data visual|do not.*data block|no chart)" "$FILE2"; then
    pass "visual-learn-card.md has negative constraint about data blocks in teach-back"
  else
    fail "visual-learn-card.md does NOT have negative constraint about data blocks in teach-back"
  fi

  # Check 2.5: Specifies numbered list format for teach-back
  if grep -qiE "numbered list" "$FILE2"; then
    pass "visual-learn-card.md specifies numbered list format for teach-back"
  else
    fail "visual-learn-card.md does NOT specify numbered list format for teach-back"
  fi
fi

echo ""

# ---------------------------------------------------------------------------
# File 3: references/18-obsidian-enriched-patterns.md
# ---------------------------------------------------------------------------
FILE3="$REPO_ROOT/references/18-obsidian-enriched-patterns.md"
echo "--- File 3: references/18-obsidian-enriched-patterns.md ---"

if [ ! -f "$FILE3" ]; then
  fail "File does not exist: $FILE3"
else
  # Check 3.1: Teach-back callout example contains numbered list items (e.g., "> 1." or "> 2.")
  if grep -qE '> [0-9]+\.' "$FILE3"; then
    pass "18-obsidian-enriched-patterns.md teach-back example has numbered list items"
  else
    fail "18-obsidian-enriched-patterns.md teach-back example does NOT have numbered list items"
  fi

  # Check 3.2: Teach-back example does NOT contain prose-only format ("In my own words, the key insight is...")
  if grep -q "In my own words, the key insight is" "$FILE3"; then
    fail "18-obsidian-enriched-patterns.md teach-back example still has prose paragraph format"
  else
    pass "18-obsidian-enriched-patterns.md teach-back example does not have prose paragraph format"
  fi

  # Check 3.3: Anti-pattern note present (no visual elements in teach-back)
  if grep -qiE "(no graph|no table|no mermaid|no chart|no data|do not embed)" "$FILE3"; then
    pass "18-obsidian-enriched-patterns.md has anti-pattern note about visual elements in teach-back"
  else
    fail "18-obsidian-enriched-patterns.md does NOT have anti-pattern note about visual elements in teach-back"
  fi
fi

echo ""

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo "=== Summary ==="
echo "  Total checks: $TOTAL"
echo "  Passed: $PASS_COUNT"
echo "  Failed: $FAIL_COUNT"

if [ "$FAIL_COUNT" -gt 0 ]; then
  echo ""
  echo "RESULT: FAIL ($FAIL_COUNT checks failed)"
  exit 1
else
  echo ""
  echo "RESULT: PASS (all checks passed)"
  exit 0
fi
