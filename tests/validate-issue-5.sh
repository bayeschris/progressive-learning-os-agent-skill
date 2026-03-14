#!/usr/bin/env bash
# Validation script for Issue #5: Complexity calibration — pre-explain complex tables
# Checks that table density gate, table legend pattern, and adaptive fallback
# rules were added to the correct files.

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

echo "=== Issue #5: Complexity Calibration Validation ==="
echo ""

# ---------------------------------------------------------------------------
# File 1: SKILL.md — Table density complexity gate
# ---------------------------------------------------------------------------
FILE1="$REPO_ROOT/SKILL.md"
echo "--- File 1: SKILL.md ---"

if [ ! -f "$FILE1" ]; then
  fail "File does not exist: $FILE1"
else
  # Check 1.1: Contains a table density gate section mentioning "5+ columns"
  if grep -q "5+ column" "$FILE1"; then
    pass "SKILL.md contains '5+ column' threshold in table density gate"
  else
    fail "SKILL.md does NOT contain '5+ column' threshold"
  fi

  # Check 1.2: Contains "3+ tables" threshold
  if grep -q "3+ tables" "$FILE1"; then
    pass "SKILL.md contains '3+ tables' threshold in table density gate"
  else
    fail "SKILL.md does NOT contain '3+ tables' threshold"
  fi

  # Check 1.3: Contains "Reading this table" callout reference
  if grep -qi "Reading this table" "$FILE1"; then
    pass "SKILL.md contains 'Reading this table' callout reference"
  else
    fail "SKILL.md does NOT contain 'Reading this table' callout reference"
  fi

  # Check 1.4: Contains adaptive fallback rule mentioning narrative prose
  if grep -qi "narrative prose" "$FILE1"; then
    pass "SKILL.md contains adaptive fallback rule with 'narrative prose'"
  else
    fail "SKILL.md does NOT contain adaptive fallback rule with 'narrative prose'"
  fi

  # Check 1.5: Contains user confusion signals (comprehension tracking)
  if grep -qiE "(user.*confusion|confusion.*signal|comprehension.*signal|shows confusion)" "$FILE1"; then
    pass "SKILL.md contains user confusion/comprehension signal tracking"
  else
    fail "SKILL.md does NOT contain user confusion/comprehension signal tracking"
  fi

  # Check 1.6: Contains section header for table complexity calibration
  if grep -qiE "table density|dense table|Table density gate" "$FILE1"; then
    pass "SKILL.md contains a section for table complexity calibration"
  else
    fail "SKILL.md does NOT contain a section for table complexity calibration"
  fi
fi

echo ""

# ---------------------------------------------------------------------------
# File 2: references/output/enriched-patterns.md — Table Legend pattern
# ---------------------------------------------------------------------------
FILE2="$REPO_ROOT/references/output/enriched-patterns.md"
echo "--- File 2: references/output/enriched-patterns.md ---"

if [ ! -f "$FILE2" ]; then
  fail "File does not exist: $FILE2"
else
  # Check 2.1: Contains "Table Legend" subsection header
  if grep -qi "Table Legend" "$FILE2"; then
    pass "enriched-patterns.md contains 'Table Legend' subsection"
  else
    fail "enriched-patterns.md does NOT contain 'Table Legend' subsection"
  fi

  # Check 2.2: Contains "> [!info] Reading this table" example callout
  if grep -q "Reading this table" "$FILE2"; then
    pass "enriched-patterns.md contains 'Reading this table' callout example"
  else
    fail "enriched-patterns.md does NOT contain 'Reading this table' callout example"
  fi

  # Check 2.3: Contains adaptive fallback prose example with "Key findings (simplified)"
  if grep -qi "Key findings (simplified)" "$FILE2"; then
    pass "enriched-patterns.md contains 'Key findings (simplified)' fallback example"
  else
    fail "enriched-patterns.md does NOT contain 'Key findings (simplified)' fallback example"
  fi

  # Check 2.4: Contains per-table context line guidance for 3+ tables
  if grep -qiE "(3.*tables|per-table context|context sentence)" "$FILE2"; then
    pass "enriched-patterns.md contains per-table context line guidance"
  else
    fail "enriched-patterns.md does NOT contain per-table context line guidance"
  fi
fi

echo ""

# ---------------------------------------------------------------------------
# File 3: references/cycle/03-learn-card.md — Table preamble guidance
# ---------------------------------------------------------------------------
FILE3="$REPO_ROOT/references/cycle/03-learn-card.md"
echo "--- File 3: references/cycle/03-learn-card.md ---"

if [ ! -f "$FILE3" ]; then
  fail "File does not exist: $FILE3"
else
  # Check 3.1: Contains a table complexity note in Evidence Plan section
  if grep -qi "Table complexity note" "$FILE3"; then
    pass "03-learn-card.md contains 'Table complexity note' callout"
  else
    fail "03-learn-card.md does NOT contain 'Table complexity note' callout"
  fi

  # Check 3.2: References the Table Legend pattern in enriched-patterns.md
  if grep -qi "Table Legend" "$FILE3"; then
    pass "03-learn-card.md references the Table Legend pattern"
  else
    fail "03-learn-card.md does NOT reference the Table Legend pattern"
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
