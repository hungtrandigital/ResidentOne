# File Placement Audit Guide

**Purpose:** Ensure all files are in correct locations according to `file-placement-guide.md`

## Quick Start

Run the audit script:

```bash
./8-governance/scripts/file-placement-audit.sh
```

The script will:
1. Scan entire repository
2. Check file locations against `file-placement-guide.md`
3. Generate audit report: `8-governance/audits/file-placement/file-placement-audit-YYYY-MM-DD.md`
4. Show summary of violations and warnings

## When to Run Audit

### Mandatory Times:
- ✅ **After major documentation reorganization**
- ✅ **Before committing large changes**
- ✅ **When @docs-guardian is called** (agent should run this)
- ✅ **After moving files** (verify they're in correct locations)

### Recommended Times:
- 📅 **Weekly** - Regular maintenance check
- 📅 **Monthly** - Comprehensive compliance check
- 📅 **Before releases** - Ensure documentation is organized

## What the Audit Checks

### 1. Common Violations
- ❌ Team analysis files in `3-technical/` → Should be in `6-operations/`
- ❌ Financial analysis in `3-technical/` → Should be in `5-financing/analysis/`
- ❌ Financial reviews in `3-technical/` → Should be in `5-financing/reviews/`
- ❌ Legal documents in `5-financing/` → Should be in `6-operations/legal/`
- ❌ Audit files outside `8-governance/` → Should be in `8-governance/`

### 2. Forbidden Files
- ❌ Generic report files: `COMPLETE_REPORT.md`, `FULL_REPORT.md`, `ANALYSIS.md`, `FINDINGS.md`
- ❌ Generic summary files: `summary.md` (should be `summaries.md`)

### 3. Duplicate Files
- ⚠️ Multiple summary files (should consolidate into `summaries.md`)
- ⚠️ Duplicate analysis files

## Understanding Audit Results

### ✅ PASS
- **Violations:** 0
- **Warnings:** 0
- **Action:** None needed

### ⚠️ WARNINGS
- **Violations:** 0
- **Warnings:** > 0
- **Action:** Review warnings, fix if needed

### ❌ FAIL
- **Violations:** > 0
- **Action:** **MUST FIX** before proceeding

## Fixing Violations

1. **Read the audit report** - See specific violations
2. **Check file-placement-guide.md** - Verify correct location
3. **Move files** - Use `git mv` to preserve history
4. **Update references** - Update README.md, INDEX.md, and any links
5. **Update changelog.md** - Document the move
6. **Re-run audit** - Verify fixes

## Example Workflow

```bash
# 1. Run audit
./8-governance/scripts/file-placement-audit.sh

# 2. Review report
cat 8-governance/audits/file-placement/file-placement-audit-2025-12-12.md

# 3. Fix violations (example)
git mv 3-technical/team-analysis.md 6-operations/team-analysis.md

# 4. Update references
# Edit README.md, INDEX.md, changelog.md

# 5. Re-run audit to verify
./8-governance/scripts/file-placement-audit.sh
```

## Integration with Docs Guardian

The `@docs-guardian` agent should:
1. **Run audit automatically** when checking structure
2. **Fix violations** found in audit
3. **Report results** in orchestration handoff

## Manual Audit Checklist

If you prefer manual checking, use this checklist:

- [ ] No team analysis files in `3-technical/`
- [ ] No financial analysis in `3-technical/`
- [ ] No financial reviews in `3-technical/`
- [ ] No legal documents in `5-financing/`
- [ ] No audit files outside `8-governance/`
- [ ] No generic report files (`COMPLETE_REPORT.md`, etc.)
- [ ] No duplicate summary files
- [ ] All files follow kebab-case naming
- [ ] All files have proper dates if applicable

---

**Reference:** `0-agents/_core/file-placement-guide.md`  
**Script:** `8-governance/scripts/file-placement-audit.sh`

