#!/bin/bash

# File Placement Audit Script
# Scans entire repository and checks file locations against file-placement-guide.md
# Usage: ./file-placement-audit.sh

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AUDIT_REPORT="$REPO_ROOT/8-governance/audits/file-placement/file-placement-audit-$(date +%Y-%m-%d).md"
VIOLATIONS=0
WARNINGS=0

echo "🔍 Starting File Placement Audit..."
echo "Repository: $REPO_ROOT"
echo ""

# Function to check if file exists in correct location
check_file_location() {
    local file_path="$1"
    local expected_location="$2"
    local file_type="$3"
    
    if [[ ! -f "$REPO_ROOT/$file_path" ]]; then
        return 0  # File doesn't exist, skip
    fi
    
    local actual_dir=$(dirname "$file_path")
    local expected_dir=$(dirname "$expected_location")
    
    if [[ "$actual_dir" != "$expected_dir" ]]; then
        echo "❌ VIOLATION: $file_type" >> "$AUDIT_REPORT"
        echo "   File: $file_path" >> "$AUDIT_REPORT"
        echo "   Expected: $expected_location" >> "$AUDIT_REPORT"
        echo "   Actual: $file_path" >> "$AUDIT_REPORT"
        echo "" >> "$AUDIT_REPORT"
        ((VIOLATIONS++))
        return 1
    fi
    
    return 0
}

# Function to check for files in wrong directories
check_wrong_directory() {
    local search_dir="$1"
    local pattern="$2"
    local expected_dir="$3"
    local file_type="$4"
    
    while IFS= read -r -d '' file; do
        local rel_path="${file#$REPO_ROOT/}"
        echo "⚠️  WARNING: $file_type" >> "$AUDIT_REPORT"
        echo "   File: $rel_path" >> "$AUDIT_REPORT"
        echo "   Expected location: $expected_dir" >> "$AUDIT_REPORT"
        echo "   Consider moving to: $expected_dir/$(basename "$file")" >> "$AUDIT_REPORT"
        echo "" >> "$AUDIT_REPORT"
        ((WARNINGS++))
    done < <(find "$REPO_ROOT/$search_dir" -type f -name "$pattern" -print0 2>/dev/null)
}

# Initialize audit report
cat > "$AUDIT_REPORT" << EOF
# File Placement Audit Report

**Date:** $(date +%Y-%m-%d)  
**Time:** $(date +%H:%M:%S)  
**Repository:** $(basename "$REPO_ROOT")

## Summary

This audit checks file locations against \`0-agents/_core/file-placement-guide.md\`.

---

## Violations Found

EOF

echo "📋 Checking specific file locations..."

# Check for common violations

# 1. Team analysis files should be in 6-operations/, not 3-technical/
echo "Checking team analysis files..."
check_wrong_directory "3-technical" "*team*analysis*.md" "6-operations" "Team analysis in wrong directory"
check_wrong_directory "3-technical" "*team*gaps*.md" "6-operations" "Team gaps analysis in wrong directory"

# 2. Financial analysis/reviews should be in 5-financing/, not 3-technical/
echo "Checking financial files..."
check_wrong_directory "3-technical" "*financial*analysis*.md" "5-financing/analysis" "Financial analysis in wrong directory"
check_wrong_directory "3-technical" "*financial*review*.md" "5-financing/reviews" "Financial review in wrong directory"
check_wrong_directory "3-technical" "*equity*analysis*.md" "5-financing/analysis" "Equity analysis in wrong directory"
check_wrong_directory "3-technical" "*financing*review*.md" "5-financing/reviews" "Financing review in wrong directory"

# 3. Legal documents should be in 6-operations/legal/, not 5-financing/
echo "Checking legal documents..."
check_wrong_directory "5-financing" "*founder*agreement*.md" "6-operations/legal" "Founder agreement in wrong directory"
check_wrong_directory "5-financing" "*employment*contract*.md" "6-operations/legal" "Employment contract in wrong directory"
check_wrong_directory "5-financing" "*legal*.md" "6-operations/legal" "Legal document in wrong directory"

# 4. Audit files should be in 8-governance/, not elsewhere
echo "Checking audit files..."
find "$REPO_ROOT" -type f -name "*audit*.md" ! -path "*/0-agents/*" ! -path "*/archives/*" ! -path "*/.git/*" | while read -r file; do
    rel_path="${file#$REPO_ROOT/}"
    if [[ ! "$rel_path" =~ ^8-governance/ ]]; then
        echo "⚠️  WARNING: Audit file in wrong location" >> "$AUDIT_REPORT"
        echo "   File: $rel_path" >> "$AUDIT_REPORT"
        echo "   Expected: 8-governance/" >> "$AUDIT_REPORT"
        echo "" >> "$AUDIT_REPORT"
        ((WARNINGS++))
    fi
done

# 5. Check for generic report files (forbidden)
echo "Checking for generic report files..."
check_wrong_directory "." "COMPLETE_REPORT.md" "." "Generic report file (forbidden)"
check_wrong_directory "." "FULL_REPORT.md" "." "Generic report file (forbidden)"
check_wrong_directory "." "ANALYSIS.md" "." "Generic report file (forbidden)"
check_wrong_directory "." "FINDINGS.md" "." "Generic report file (forbidden)"
check_wrong_directory "." "report.md" "." "Generic report file (forbidden)"
check_wrong_directory "." "summary.md" "." "Generic report file (should be summaries.md)"

# 6. Check for duplicate summary files
echo "Checking for duplicate summary files..."
find "$REPO_ROOT" -type f -name "*summary*.md" ! -name "summaries.md" ! -path "*/0-agents/*" ! -path "*/archives/*" ! -path "*/.git/*" | while read -r file; do
    rel_path="${file#$REPO_ROOT/}"
    # Allow legitimate summary files (executive summaries, preparation summaries, decision summaries, roadmap summaries)
    if [[ ! "$rel_path" =~ (EXECUTIVE-SUMMARY|startup-financial-preparation-summary|architecture-decisions-summary|marketing-decisions-summary|roadmap-summary) ]]; then
        echo "⚠️  WARNING: Potential duplicate summary file" >> "$AUDIT_REPORT"
        echo "   File: $rel_path" >> "$AUDIT_REPORT"
        echo "   Consider: Should this be merged into summaries.md?" >> "$AUDIT_REPORT"
        echo "" >> "$AUDIT_REPORT"
        ((WARNINGS++))
    fi
done

# 7. Check for files in 3-technical/3.2-implementation/ that should be elsewhere
echo "Checking implementation directory..."
check_wrong_directory "3-technical/3.2-implementation" "*team*analysis*.md" "6-operations" "Team analysis in implementation directory"
check_wrong_directory "3-technical/3.2-implementation" "*financial*analysis*.md" "5-financing/analysis" "Financial analysis in implementation directory"
check_wrong_directory "3-technical/3.2-implementation" "*financial*review*.md" "5-financing/reviews" "Financial review in implementation directory"

# Add summary to report
cat >> "$AUDIT_REPORT" << EOF

---

## Audit Summary

- **Violations:** $VIOLATIONS
- **Warnings:** $WARNINGS
- **Status:** $([ $VIOLATIONS -eq 0 ] && echo "✅ PASS" || echo "❌ FAIL")

## Next Steps

1. Review all violations and warnings above
2. Move files to correct locations
3. Update references in README.md and INDEX.md
4. Update changelog.md
5. Re-run audit to verify fixes

---

**Generated by:** file-placement-audit.sh  
**Reference:** \`0-agents/_core/file-placement-guide.md\`
EOF

echo ""
echo "✅ Audit complete!"
echo "📄 Report saved to: $AUDIT_REPORT"
echo ""
echo "Summary:"
echo "  - Violations: $VIOLATIONS"
echo "  - Warnings: $WARNINGS"
echo ""

if [ $VIOLATIONS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "🎉 All files are in correct locations!"
    exit 0
elif [ $VIOLATIONS -eq 0 ]; then
    echo "⚠️  Some warnings found. Please review the report."
    exit 0
else
    echo "❌ Violations found! Please fix and re-run audit."
    exit 1
fi

