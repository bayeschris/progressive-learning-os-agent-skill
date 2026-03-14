#!/usr/bin/env bash
# Integration tests for Obsidian-enriched rendering + Progressive Learning OS skill
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

echo "=== Obsidian-Enriched Rendering Integration Tests ==="
echo ""

# -------------------------------------------------------
# Test 1: Required files exist
# -------------------------------------------------------
echo "--- Test 1: Required integration files exist ---"

required_files=(
  "SKILL.md"
  "references/output/visual-explainer-integration.md"
  "references/output/enriched-patterns.md"
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

if grep -q "visual-explainer-integration" "$PROJECT_ROOT/SKILL.md"; then
  pass "SKILL.md references integration guide"
else
  fail "SKILL.md does not reference integration guide"
fi

if grep -q "enriched-patterns" "$PROJECT_ROOT/SKILL.md"; then
  pass "SKILL.md references pattern library"
else
  fail "SKILL.md does not reference pattern library"
fi

# -------------------------------------------------------
# Test 3: Integration reference document structure
# -------------------------------------------------------
echo ""
echo "--- Test 3: Integration reference document structure ---"

INTEGRATION_REF="$PROJECT_ROOT/references/output/visual-explainer-integration.md"
if [ -f "$INTEGRATION_REF" ]; then
  # Check for required sections
  for section in "Security" "Integration" "Output" "Obsidian"; do
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
# Test 6: Obsidian-native output references
# -------------------------------------------------------
echo ""
echo "--- Test 6: Obsidian-native output references ---"

if grep -rq 'Obsidian vault' "$PROJECT_ROOT/references/output/visual-explainer-integration.md" 2>/dev/null; then
  pass "Integration doc references Obsidian vault output"
else
  fail "Integration doc does not reference Obsidian vault output"
fi

if grep -rq '<slug>/' "$PROJECT_ROOT/references/output/visual-explainer-integration.md" 2>/dev/null; then
  pass "Integration doc references vault folder structure"
else
  fail "Integration doc does not reference vault folder structure"
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
# Test 8: Prompt templates reference Obsidian-enriched workflow
# -------------------------------------------------------
echo ""
echo "--- Test 8: Prompt templates reference Obsidian-enriched workflow ---"

for f in "${prompt_files[@]}"; do
  filepath="$PROJECT_ROOT/$f"
  if [ -f "$filepath" ]; then
    if grep -qi "obsidian-enriched\|mermaid\|callout\|diagram\|frontmatter" "$filepath"; then
      pass "$f references Obsidian-enriched workflow"
    else
      fail "$f does not reference Obsidian-enriched workflow"
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
# Test 10: Pattern library completeness
# -------------------------------------------------------
echo ""
echo "--- Test 10: Pattern library completeness ---"

PATTERNS_REF="$PROJECT_ROOT/references/output/enriched-patterns.md"
if [ -f "$PATTERNS_REF" ]; then
  for section in "Frontmatter" "Mermaid" "Callout" "Inline HTML" "Dataview" "Chart"; do
    if grep -qi "$section" "$PATTERNS_REF"; then
      pass "Pattern library contains '$section' section"
    else
      fail "Pattern library missing '$section' section"
    fi
  done
else
  fail "Pattern library file does not exist (skipping completeness tests)"
fi

# -------------------------------------------------------
# Test 11: Reference templates have frontmatter schemas
# -------------------------------------------------------
echo ""
echo "--- Test 11: Reference templates have frontmatter schemas ---"

ref_templates=(
  "references/cycle/02-risk-breakdown.md"
  "references/cycle/03-learn-card.md"
  "references/cycle/05-version-promotion-rubric.md"
  "references/cycle/06-execution-board.md"
  "references/cycle/07-weekly-learning-review.md"
)

for f in "${ref_templates[@]}"; do
  filepath="$PROJECT_ROOT/$f"
  if [ -f "$filepath" ]; then
    if grep -q "^type:" "$filepath"; then
      pass "$f has type field in frontmatter schema"
    else
      fail "$f missing type field in frontmatter schema"
    fi
  else
    fail "$f does not exist"
  fi
done

# -------------------------------------------------------
# Test 12: Frontmatter convention includes update fields
# -------------------------------------------------------
echo ""
echo "--- Test 12: Frontmatter convention includes update tracking fields ---"

OBSIDIAN_ORG="$PROJECT_ROOT/references/output/obsidian-organization.md"
if [ -f "$OBSIDIAN_ORG" ]; then
  if grep -q "updated:" "$OBSIDIAN_ORG"; then
    pass "Obsidian organization doc includes 'updated' frontmatter field"
  else
    fail "Obsidian organization doc missing 'updated' frontmatter field"
  fi
  if grep -q "updated-sections:" "$OBSIDIAN_ORG"; then
    pass "Obsidian organization doc includes 'updated-sections' frontmatter field"
  else
    fail "Obsidian organization doc missing 'updated-sections' frontmatter field"
  fi
else
  fail "Obsidian organization doc does not exist"
fi

# -------------------------------------------------------
# Test 13: Changed Today Dataview query in index specification
# -------------------------------------------------------
echo ""
echo "--- Test 13: Changed Today Dataview query in index specification ---"

if [ -f "$OBSIDIAN_ORG" ]; then
  if grep -qi "Changed Today" "$OBSIDIAN_ORG"; then
    pass "Obsidian organization doc includes 'Changed Today' query section"
  else
    fail "Obsidian organization doc missing 'Changed Today' query section"
  fi
  if grep -q 'updated = date(today)' "$OBSIDIAN_ORG"; then
    pass "Obsidian organization doc has Dataview filter for today's updates"
  else
    fail "Obsidian organization doc missing Dataview filter for today's updates"
  fi
else
  fail "Obsidian organization doc does not exist"
fi

# -------------------------------------------------------
# Test 14: Pattern library frontmatter schemas include update fields
# -------------------------------------------------------
echo ""
echo "--- Test 14: Pattern library frontmatter schemas include update fields ---"

PATTERNS_REF="$PROJECT_ROOT/references/output/enriched-patterns.md"
if [ -f "$PATTERNS_REF" ]; then
  # Count how many frontmatter schema blocks contain 'updated:' field
  updated_count=$(grep -c "^updated:" "$PATTERNS_REF" 2>/dev/null || true)
  updated_count=${updated_count:-0}
  if [ "$updated_count" -ge 5 ]; then
    pass "Pattern library has 'updated' field in all 5 frontmatter schemas ($updated_count found)"
  else
    fail "Pattern library missing 'updated' field in some schemas (found $updated_count, expected 5)"
  fi
  updated_sections_count=$(grep -c "^updated-sections:" "$PATTERNS_REF" 2>/dev/null || true)
  updated_sections_count=${updated_sections_count:-0}
  if [ "$updated_sections_count" -ge 5 ]; then
    pass "Pattern library has 'updated-sections' field in all 5 frontmatter schemas ($updated_sections_count found)"
  else
    fail "Pattern library missing 'updated-sections' field in some schemas (found $updated_sections_count, expected 5)"
  fi
else
  fail "Pattern library file does not exist"
fi

# -------------------------------------------------------
# Test 15: Pattern library includes update-status callout patterns
# -------------------------------------------------------
echo ""
echo "--- Test 15: Pattern library includes update-status callout patterns ---"

if [ -f "$PATTERNS_REF" ]; then
  if grep -q 'Last updated:' "$PATTERNS_REF"; then
    pass "Pattern library includes update-status callout example (Last updated)"
  else
    fail "Pattern library missing update-status callout example (Last updated)"
  fi
  if grep -q 'No changes this cycle' "$PATTERNS_REF"; then
    pass "Pattern library includes no-changes callout example"
  else
    fail "Pattern library missing no-changes callout example"
  fi
else
  fail "Pattern library file does not exist"
fi

# -------------------------------------------------------
# Test 16: SKILL.md includes update-status callout instruction
# -------------------------------------------------------
echo ""
echo "--- Test 16: SKILL.md includes update-status callout instruction ---"

SKILL_FILE="$PROJECT_ROOT/SKILL.md"
if [ -f "$SKILL_FILE" ]; then
  if grep -qi "update-status callout\|update.status callout" "$SKILL_FILE"; then
    pass "SKILL.md includes update-status callout instruction"
  else
    fail "SKILL.md missing update-status callout instruction"
  fi
  if grep -q "updated" "$SKILL_FILE" && grep -q "updated-sections" "$SKILL_FILE"; then
    pass "SKILL.md references updated and updated-sections frontmatter fields"
  else
    fail "SKILL.md missing reference to updated/updated-sections frontmatter fields"
  fi
else
  fail "SKILL.md does not exist"
fi

# -------------------------------------------------------
# Test 17: Study design classifier in objective template
# -------------------------------------------------------
echo ""
echo "--- Test 17: Study design classifier in objective template ---"

OBJ_TEMPLATE="$PROJECT_ROOT/references/cycle/01-objective-and-gates.md"
if [ -f "$OBJ_TEMPLATE" ]; then
  if grep -qi "study design" "$OBJ_TEMPLATE"; then
    pass "Objective template contains study design section"
  else
    fail "Objective template missing study design section"
  fi
  if grep -qi "observational" "$OBJ_TEMPLATE"; then
    pass "Objective template references observational design"
  else
    fail "Objective template missing observational design reference"
  fi
  if grep -qi "natural history" "$OBJ_TEMPLATE"; then
    pass "Objective template references natural history studies"
  else
    fail "Objective template missing natural history reference"
  fi
  if grep -qi "experimental\|RCT" "$OBJ_TEMPLATE"; then
    pass "Objective template references experimental/RCT design"
  else
    fail "Objective template missing experimental/RCT reference"
  fi
  if grep -qi "retrospective\|registry" "$OBJ_TEMPLATE"; then
    pass "Objective template references retrospective/registry design"
  else
    fail "Objective template missing retrospective/registry reference"
  fi
  if grep -qi "out-of-scope.*intervention\|no treatment.*no intervention\|intervention.*prohibited" "$OBJ_TEMPLATE"; then
    pass "Objective template has auto-population guidance for observational out-of-scope"
  else
    fail "Objective template missing auto-population guidance for observational out-of-scope"
  fi
else
  fail "Objective template does not exist (skipping study design tests)"
fi

# -------------------------------------------------------
# Test 18: SKILL.md study design detection
# -------------------------------------------------------
echo ""
echo "--- Test 18: SKILL.md study design detection ---"

if [ -f "$SKILL_FILE" ]; then
  if grep -qi "study design" "$SKILL_FILE"; then
    pass "SKILL.md contains study design reference"
  else
    fail "SKILL.md missing study design reference"
  fi
  if grep -qi "observational" "$SKILL_FILE"; then
    pass "SKILL.md contains observational reference"
  else
    fail "SKILL.md missing observational reference"
  fi
  if grep -qi "incompatib\|intervention.*check\|design.*gate\|design.*constraint" "$SKILL_FILE"; then
    pass "SKILL.md contains incompatibility/intervention gate reference"
  else
    fail "SKILL.md missing incompatibility/intervention gate reference"
  fi
else
  fail "SKILL.md does not exist (skipping study design detection tests)"
fi

# -------------------------------------------------------
# Test 19: Observational execution template
# -------------------------------------------------------
echo ""
echo "--- Test 19: Observational execution template ---"

EXEC_TEMPLATE="$PROJECT_ROOT/references/cycle/06-execution-board.md"
if [ -f "$EXEC_TEMPLATE" ]; then
  if grep -qi "observational" "$EXEC_TEMPLATE"; then
    pass "Execution template contains observational section"
  else
    fail "Execution template missing observational section"
  fi
  if grep -qi "cohort" "$EXEC_TEMPLATE"; then
    pass "Execution template contains cohort task type"
  else
    fail "Execution template missing cohort task type"
  fi
  if grep -qi "endpoint" "$EXEC_TEMPLATE"; then
    pass "Execution template contains endpoint task type"
  else
    fail "Execution template missing endpoint task type"
  fi
  if grep -qi "data collection" "$EXEC_TEMPLATE"; then
    pass "Execution template contains data collection task type"
  else
    fail "Execution template missing data collection task type"
  fi
  if grep -qi "follow-up\|followup" "$EXEC_TEMPLATE"; then
    pass "Execution template contains follow-up task type"
  else
    fail "Execution template missing follow-up task type"
  fi
  if grep -qi "statistical analysis" "$EXEC_TEMPLATE"; then
    pass "Execution template contains statistical analysis task type"
  else
    fail "Execution template missing statistical analysis task type"
  fi
else
  fail "Execution template does not exist (skipping observational template tests)"
fi

# -------------------------------------------------------
# Test 20: Incompatibility gate for observational design
# -------------------------------------------------------
echo ""
echo "--- Test 20: Incompatibility gate for observational design ---"

incompatibility_found=false
if [ -f "$EXEC_TEMPLATE" ]; then
  if grep -qi "incompatible.*observational\|observational.*study.*design" "$EXEC_TEMPLATE"; then
    incompatibility_found=true
  fi
fi
if [ -f "$SKILL_FILE" ]; then
  if grep -qi "incompatible.*observational\|observational.*study.*design" "$SKILL_FILE"; then
    incompatibility_found=true
  fi
fi

if [ "$incompatibility_found" = true ]; then
  pass "Incompatibility gate reference found for observational study design"
else
  fail "Missing incompatibility gate reference for observational study design"
fi

if [ -f "$EXEC_TEMPLATE" ]; then
  if grep -q '\[!warning\]' "$EXEC_TEMPLATE"; then
    pass "Execution template contains warning callout for incompatibility"
  else
    fail "Execution template missing warning callout for incompatibility"
  fi
else
  fail "Execution template does not exist (skipping warning callout test)"
fi

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
