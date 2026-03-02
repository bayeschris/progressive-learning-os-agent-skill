#!/usr/bin/env bash
# Integration tests for Visual Explainer + Progressive Learning OS skill
# Run from the project root: bash tests/test_integration.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PASS=0
FAIL=0
TOTAL=0

pass() {
  PASS=$((PASS + 1))
  TOTAL=$((TOTAL + 1))
  echo "  PASS: $1"
}

fail() {
  FAIL=$((FAIL + 1))
  TOTAL=$((TOTAL + 1))
  echo "  FAIL: $1"
}

echo "=== Visual Explainer Integration Tests ==="
echo ""

# -------------------------------------------------------
# Test 1: Required files exist
# -------------------------------------------------------
echo "--- Test 1: Required integration files exist ---"

required_files=(
  "SKILL.md"
  "references/17-visual-explainer-integration.md"
  "prompts/visual-learn-card.md"
  "prompts/visual-decision-packet.md"
  "prompts/visual-execution-board.md"
)

for f in "${required_files[@]}"; do
  if [ -f "$PROJECT_ROOT/$f" ]; then
    pass "$f exists"
  else
    fail "$f missing"
  fi
done

# -------------------------------------------------------
# Test 2: SKILL.md references visual rendering
# -------------------------------------------------------
echo ""
echo "--- Test 2: SKILL.md references visual rendering ---"

if grep -q "visual" "$PROJECT_ROOT/SKILL.md"; then
  pass "SKILL.md contains visual rendering reference"
else
  fail "SKILL.md does not reference visual rendering"
fi

if grep -q "17-visual-explainer-integration" "$PROJECT_ROOT/SKILL.md"; then
  pass "SKILL.md references integration guide"
else
  fail "SKILL.md does not reference integration guide"
fi

# -------------------------------------------------------
# Test 3: Integration reference document structure
# -------------------------------------------------------
echo ""
echo "--- Test 3: Integration reference document structure ---"

INTEGRATION_REF="$PROJECT_ROOT/references/17-visual-explainer-integration.md"
if [ -f "$INTEGRATION_REF" ]; then
  # Check for required sections
  for section in "Security" "Integration" "Output" "visual-explainer"; do
    if grep -qi "$section" "$INTEGRATION_REF"; then
      pass "Integration doc contains '$section' section"
    else
      fail "Integration doc missing '$section' section"
    fi
  done
else
  fail "Integration reference file does not exist (skipping structure tests)"
fi

# -------------------------------------------------------
# Test 4: Prompt templates have required frontmatter
# -------------------------------------------------------
echo ""
echo "--- Test 4: Prompt templates have required frontmatter ---"

prompt_files=(
  "prompts/visual-learn-card.md"
  "prompts/visual-decision-packet.md"
  "prompts/visual-execution-board.md"
)

for f in "${prompt_files[@]}"; do
  filepath="$PROJECT_ROOT/$f"
  if [ -f "$filepath" ]; then
    # Check for YAML frontmatter with description
    if head -5 "$filepath" | grep -q "^---"; then
      pass "$f has frontmatter delimiter"
    else
      fail "$f missing frontmatter delimiter"
    fi
    if grep -q "^description:" "$filepath"; then
      pass "$f has description field"
    else
      fail "$f missing description field"
    fi
  else
    fail "$f does not exist (skipping frontmatter tests)"
  fi
done

# -------------------------------------------------------
# Test 5: Security constraints - no unsafe patterns
# -------------------------------------------------------
echo ""
echo "--- Test 5: Security constraints - no unsafe patterns ---"

all_md_files=$(find "$PROJECT_ROOT" -name "*.md" -not -path "*/.git/*" -not -path "*/node_modules/*")

unsafe_patterns=(
  "eval("
  "exec("
  "rm -rf /"
  "sudo "
  "chmod 777"
)

for pattern in "${unsafe_patterns[@]}"; do
  if echo "$all_md_files" | xargs grep -l "$pattern" 2>/dev/null | grep -v "test_integration" | head -1 > /dev/null 2>&1; then
    found=$(echo "$all_md_files" | xargs grep -l "$pattern" 2>/dev/null | grep -v "test_integration" | head -1)
    if [ -n "$found" ]; then
      fail "Unsafe pattern '$pattern' found in: $found"
    else
      pass "No unsafe pattern '$pattern' found"
    fi
  else
    pass "No unsafe pattern '$pattern' found"
  fi
done

# -------------------------------------------------------
# Test 6: Output directory reference is correct
# -------------------------------------------------------
echo ""
echo "--- Test 6: Output directory references ---"

if grep -rq '~/.agent/diagrams/' "$PROJECT_ROOT/references/17-visual-explainer-integration.md" 2>/dev/null; then
  pass "Integration doc references correct output directory"
else
  fail "Integration doc does not reference ~/.agent/diagrams/ output directory"
fi

# -------------------------------------------------------
# Test 7: No hardcoded API keys or secrets
# -------------------------------------------------------
echo ""
echo "--- Test 7: No hardcoded secrets ---"

secret_patterns=(
  "GEMINI_API_KEY="
  "OPENAI_API_KEY="
  "sk-[a-zA-Z0-9]"
  "AIza[a-zA-Z0-9]"
)

for pattern in "${secret_patterns[@]}"; do
  if echo "$all_md_files" | xargs grep -lE "$pattern" 2>/dev/null | head -1 > /dev/null 2>&1; then
    found=$(echo "$all_md_files" | xargs grep -lE "$pattern" 2>/dev/null | head -1)
    if [ -n "$found" ]; then
      fail "Potential secret pattern '$pattern' found in: $found"
    else
      pass "No secret pattern '$pattern' found"
    fi
  else
    pass "No secret pattern '$pattern' found"
  fi
done

# -------------------------------------------------------
# Test 8: Prompt templates reference visual-explainer skill
# -------------------------------------------------------
echo ""
echo "--- Test 8: Prompt templates reference visual-explainer workflow ---"

for f in "${prompt_files[@]}"; do
  filepath="$PROJECT_ROOT/$f"
  if [ -f "$filepath" ]; then
    if grep -qi "visual-explainer\|html\|diagram\|browser" "$filepath"; then
      pass "$f references visual output workflow"
    else
      fail "$f does not reference visual output workflow"
    fi
  fi
done

# -------------------------------------------------------
# Test 9: No path traversal patterns in prompts
# -------------------------------------------------------
echo ""
echo "--- Test 9: No path traversal patterns ---"

for f in "${prompt_files[@]}"; do
  filepath="$PROJECT_ROOT/$f"
  if [ -f "$filepath" ]; then
    if grep -q '\.\.\/' "$filepath"; then
      fail "$f contains ../ path traversal pattern"
    else
      pass "$f has no path traversal patterns"
    fi
  fi
done

# -------------------------------------------------------
# Summary
# -------------------------------------------------------
echo ""
echo "=== Test Summary ==="
echo "Total: $TOTAL | Pass: $PASS | Fail: $FAIL"

if [ "$FAIL" -gt 0 ]; then
  echo "RESULT: SOME TESTS FAILED"
  exit 1
else
  echo "RESULT: ALL TESTS PASSED"
  exit 0
fi
