# Governance Scripts

This directory contains scripts for governance and maintenance tasks.

## Scripts

### file-placement-audit.sh

**Purpose:** Comprehensive audit of file locations against `file-placement-guide.md`

**Usage:**
```bash
./8-governance/scripts/file-placement-audit.sh
```

**What it checks:**
- Team analysis files in wrong directories (should be in `6-operations/`)
- Financial analysis/reviews in wrong directories (should be in `5-financing/`)
- Legal documents in wrong directories (should be in `6-operations/legal/`)
- Audit files in wrong locations (should be in `8-governance/`)
- Generic report files (forbidden)
- Duplicate summary files
- Files in `3-technical/3.2-implementation/` that should be elsewhere

**Output:**
- Creates audit report: `8-governance/file-placement-audit-YYYY-MM-DD.md`
- Shows violations and warnings
- Provides recommendations for fixes

**When to run:**
- After major documentation reorganization
- Before committing large changes
- Periodically (weekly/monthly) to ensure compliance
- When @docs-guardian is called

---

## Integration with Docs Guardian

The `@docs-guardian` agent should run this audit:
- After any file reorganization
- Before archiving files
- When checking structure violations
- Periodically as part of maintenance

---

See [../README.md](../README.md) for more information.

