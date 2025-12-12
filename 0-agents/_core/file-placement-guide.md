# File Placement Guide — AI-First Startup Factory

**Version:** 1.0  
**Last Updated:** 2025-12-12  
**Status:** Mandatory Reference

This guide defines EXACT file locations for all document types. All agents MUST follow this guide when creating files.

---

## Core Principle

**Every file type has a designated location. No exceptions.**

Before creating ANY file, agents MUST:
1. Check this guide for the correct location
2. Check if a similar file already exists in that location
3. Update existing files instead of creating duplicates
4. Consult `@docs-guardian` if unsure

---

## File Type → Location Mapping

### 1. Market Research Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Research Reports | `1-ideas/1.1-market-research/reports/` | `[topic]-[YYYY-MM].md` | e.g., `competitor-analysis-2025-12.md` |
| Research Summaries | `1-ideas/1.1-market-research/summaries.md` | **SINGLE FILE** - Always UPDATE, never create new | Update existing file |
| Research Resources | `1-ideas/1.1-market-research/resources/` | Original filenames | PDFs, links, reference materials |
| Research Templates | `1-ideas/1.1-market-research/templates/` | Template files | Reusable templates |

**Forbidden:**
- ❌ Creating new summary files (e.g., `new-summary.md`, `summary-2025.md`)
- ❌ Creating generic reports (e.g., `COMPLETE_REPORT.md`, `FULL_REPORT.md`)
- ❌ Creating reports outside `reports/` directory

---

### 2. Business Analysis Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Business Cases | `1-ideas/executive-docs/` | `business-case-[feature-or-product].md` | e.g., `business-case-building-marketplace.md` |
| Initial Financing Plans | `1-ideas/initial-plans/` | `1.2-initial-financing-plan.md` | **UPDATE existing, don't recreate** |
| Initial GTM Plans | `1-ideas/initial-plans/` | `1.3-initial-go-to-market-plan.md` | **UPDATE existing, don't recreate** |
| Executive Summaries | `1-ideas/executive-docs/` | `EXECUTIVE-SUMMARY.md` | Single comprehensive summary |
| Financial Analysis | `5-financing/analysis/` | `[topic]-analysis-[YYYY-MM].md` | e.g., `equity-structure-analysis.md` |
| Financial Reviews | `5-financing/reviews/` | `[topic]-review-[YYYY-MM].md` | e.g., `financing-plan-ai-first-review-2025-12.md` |
| Financial Preparation | `5-financing/preparation/` | `[topic]-[YYYY-MM].md` | e.g., `pitching-deck-outline.md` |
| Final Financing Plans | `5-financing/` | `plans.md` | Final version (moved from initial-plans) |

**Forbidden:**
- ❌ Creating business cases outside `executive-docs/`
- ❌ Creating duplicate financial plans
- ❌ Creating analysis files in wrong directories (e.g., `3-technical/` for financial analysis)

---

### 3. Product Foundation Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Product Overview | `2-product-foundation/` | `2.1-product-overview.md` | Single file, always UPDATE |
| Product Backlog | `2-product-foundation/2.2-product-backlog/` | `backlog.md` | Single file, always UPDATE |
| Roadmap Summary | `2-product-foundation/2.2-product-backlog/` | `roadmap-summary.md` | Executive summary |
| Requirements (PRDs) | `2-product-foundation/requirements/` | `[feature-name]/` | Directory per feature |
| User Stories | `2-product-foundation/requirements/[feature-name]/` | `user-stories.md` | Within feature directory |

**Forbidden:**
- ❌ Creating multiple product overview files
- ❌ Creating backlog files outside `2.2-product-backlog/`

---

### 4. Technical Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Architecture Decisions | `3-technical/3.1-system-foundation/` | `architecture-decisions-summary.md` | Single summary file |
| Architecture Preparation | `3-technical/3.1-system-foundation/` | `architecture-preparation-plan.md` | Preparation plan |
| Architecture Domain Specs | `3-technical/3.1-system-foundation/architecture/` | `domain-specs.md` | High-level domain specs |
| Architecture API Contracts | `3-technical/3.1-system-foundation/architecture/api-contracts/` | `[service-name].md` | Per service |
| Infrastructure Docs | `3-technical/3.1-system-foundation/` | `infrastructure.md` | Main infrastructure doc |
| Infrastructure Analysis | `3-technical/3.1-system-foundation/` | `infrastructure-[topic]-analysis.md` | e.g., `infrastructure-cost-allocation-analysis.md` |
| Design Standards | `3-technical/3.1-system-foundation/design-standards/` | `[standard-name].md` | e.g., `coding-standards.md` |
| Implementation Domain Specs | `3-technical/3.2-implementation/` | `domain-specs.md` | Implementation-level specs |
| Implementation API Contracts | `3-technical/3.2-implementation/` | `api-contract.md` | Implementation API contract |
| Implementation Plans | `3-technical/3.2-implementation/plans/active/` | `[feature-name].md` | Active plans |
| Implementation Plans (Epics) | `3-technical/3.2-implementation/plans/epics/` | `[epic-name]/` | Epic directories |
| Implementation Status | `3-technical/3.2-implementation/status/` | `progress.md` | Single progress file |
| DevOps Config | `3-technical/3.3-devops/` | Various | Server configs, local setup |

**Forbidden:**
- ❌ Creating analysis files in `3-technical/3.2-implementation/` (should be in `6-operations/` for team analysis)
- ❌ Creating review files in `3-technical/3.2-implementation/` (should be in `5-financing/reviews/` for financial reviews)
- ❌ Creating team analysis files in `3-technical/` (should be in `6-operations/`)

---

### 5. Marketing Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Go-to-Market Strategy | `4-marketing/` | `go-to-market.md` | Final version (moved from initial-plans) |
| Marketing Decisions | `4-marketing/` | `marketing-decisions-summary.md` | Summary of decisions |
| Marketing Preparation | `4-marketing/preparation/` | `marketing-preparation-plan.md` | Preparation documents |
| Customer Personas | `4-marketing/` | `personas.md` | Customer personas |
| Marketing Channels | `4-marketing/channels/` | Various | Channel-specific strategies |
| Marketing Performance | `4-marketing/performance/` | Various | Performance metrics |

**Forbidden:**
- ❌ Creating GTM plans outside `4-marketing/` or `1-ideas/initial-plans/`

---

### 6. Financing Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Final Financing Plans | `5-financing/` | `plans.md` | Final version |
| Financial Analysis | `5-financing/analysis/` | `[topic]-analysis.md` | e.g., `equity-structure-analysis.md` |
| Financial Reviews | `5-financing/reviews/` | `[topic]-review-[YYYY-MM].md` | e.g., `financing-plan-ai-first-review-2025-12.md` |
| Financial Preparation | `5-financing/preparation/` | `[topic]-[YYYY-MM].md` | e.g., `pitching-deck-outline.md` |
| Investor Pitches | `5-financing/pitches/` | Various | Pitch decks |
| Financial Projections | `5-financing/projections/` | Various | Projection models |

**Forbidden:**
- ❌ Creating financial analysis in `3-technical/` (should be in `5-financing/analysis/`)
- ❌ Creating financial reviews in `3-technical/` (should be in `5-financing/reviews/`)

---

### 7. Operations Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Team Structure | `6-operations/` | `team-structure.md` | Main team structure doc |
| Team Analysis | `6-operations/` | `team-structure-analysis.md` | Team structure analysis |
| Team Gaps Analysis | `6-operations/` | `team-gaps-analysis.md` | Team gaps and hiring needs |
| Legal Documents | `6-operations/legal/` | Various | Legal contracts, agreements |
| HR Policies | `6-operations/hr/` | Various | HR policies and procedures |
| Vendor Contracts | `6-operations/vendor-contracts/` | Various | Vendor agreements |

**Forbidden:**
- ❌ Creating team analysis files in `3-technical/` (should be in `6-operations/`)
- ❌ Creating team gaps analysis in `3-technical/` (should be in `6-operations/`)

---

### 8. Operations Monitoring Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| System Monitoring | `7-operations-monitoring/system-monitoring/` | Various | System monitoring docs |
| Marketing Analytics | `7-operations-monitoring/` | `marketing-analytics.md` | Marketing metrics |
| Incident Response | `7-operations-monitoring/` | `incident-response.md` | Incident procedures |

---

### 9. Governance Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Changelog | `8-governance/` | `changelog.md` | **SINGLE FILE** - Always UPDATE |
| Decision Log | `8-governance/` | `decision-log.md` | ADR format |
| Risk Register | `8-governance/` | `risk-register.md` | **SINGLE FILE** - Always UPDATE |
| Project Versions | `8-governance/` | `project-versions.md` | Version history |
| Documentation Audit | `8-governance/` | `documentation-location-audit-[YYYY-MM].md` | Audit reports |
| Quarterly Retrospectives | `8-governance/quarterly-retrospective/` | `[YYYY-QX].md` | Per quarter |

**Forbidden:**
- ❌ Creating multiple changelog files
- ❌ Creating multiple risk register files
- ❌ Creating audit files outside `8-governance/`

---

### 10. Feature Ideas Files

| File Type | Location | Naming Convention | Notes |
|-----------|----------|-------------------|-------|
| Feature Ideas | `1-ideas/1.4-feature-ideas/` | `feature-[feature-name]-[YYYY-MM].md` | e.g., `feature-zalo-content-automation-2025-12.md` |
| Feature Summaries | `1-ideas/1.4-feature-ideas/` | `summaries.md` | **SINGLE FILE** - Always UPDATE |

**Forbidden:**
- ❌ Creating feature ideas outside `1.4-feature-ideas/`
- ❌ Creating multiple summary files

---

## Special File Types

### Analysis Files

**Rule:** Analysis files go to the appropriate `analysis/` subdirectory based on domain:

- **Financial Analysis** → `5-financing/analysis/`
- **Team Analysis** → `6-operations/` (no subdirectory needed, files at root)
- **Infrastructure Analysis** → `3-technical/3.1-system-foundation/` (infrastructure-specific, keep at root)
- **Market Analysis** → `1-ideas/1.1-market-research/reports/` (as research reports)

**Forbidden:**
- ❌ Creating analysis files in `3-technical/3.2-implementation/` (implementation is for code, not analysis)

### Review Files

**Rule:** Review files go to the appropriate `reviews/` subdirectory based on domain:

- **Financial Reviews** → `5-financing/reviews/`
- **Code Reviews** → Handled by Code Reviewer agent (not files)
- **Architecture Reviews** → `3-technical/3.1-system-foundation/` (as part of architecture docs)

**Forbidden:**
- ❌ Creating review files in `3-technical/3.2-implementation/reviews/` (should be in `5-financing/reviews/` for financial reviews)

### Preparation Files

**Rule:** Preparation files go to the appropriate `preparation/` subdirectory:

- **Financial Preparation** → `5-financing/preparation/`
- **Marketing Preparation** → `4-marketing/preparation/`
- **Architecture Preparation** → `3-technical/3.1-system-foundation/` (as `architecture-preparation-plan.md`)

### Audit Files

**Rule:** Audit files go to `8-governance/`:

- **Documentation Audits** → `8-governance/documentation-location-audit-[YYYY-MM].md`
- **Code Audits** → Handled by Code Reviewer agent (not files)
- **Structure Audits** → `8-governance/` (as part of governance)

---

## File Creation Checklist

Before creating ANY file, agents MUST:

1. ✅ **Check this guide** - Find the correct location for the file type
2. ✅ **Search for existing files** - Check if a similar file already exists
3. ✅ **Update existing files** - If similar file exists, UPDATE it instead of creating new
4. ✅ **Consult docs-guardian** - If unsure about location or naming
5. ✅ **Follow naming convention** - Use kebab-case, descriptive names, dates if applicable
6. ✅ **Update summaries/logs** - Update relevant summary files (e.g., `summaries.md`, `changelog.md`)
7. ✅ **Update INDEX.md** - Add new file to INDEX.md if it's a major document
8. ✅ **Update README.md** - Update relevant README.md files if needed

---

## Common Mistakes to Avoid

### ❌ Wrong: Creating files in wrong directories

- **Team analysis in `3-technical/`** → Should be in `6-operations/`
- **Financial reviews in `3-technical/`** → Should be in `5-financing/reviews/`
- **Financial analysis in `3-technical/`** → Should be in `5-financing/analysis/`

### ❌ Wrong: Creating duplicate files

- **Multiple summary files** → Should UPDATE existing `summaries.md`
- **Multiple changelog files** → Should UPDATE existing `changelog.md`
- **Multiple risk register files** → Should UPDATE existing `risk-register.md`

### ❌ Wrong: Creating generic files

- **`COMPLETE_REPORT.md`** → Should be a specific report in appropriate directory
- **`ANALYSIS.md`** → Should be `[topic]-analysis.md` in appropriate directory
- **`FINDINGS.md`** → Should be part of existing summary or specific report

### ❌ Wrong: Not updating existing files

- **Creating new file when similar exists** → Should UPDATE existing file
- **Not updating summaries.md** → Must update summaries after creating new content
- **Not updating changelog.md** → Must update changelog after structural changes

---

## Quick Reference Table

| File Type | Location Pattern | Example |
|-----------|------------------|---------|
| Market Research Reports | `1-ideas/1.1-market-research/reports/` | `competitor-analysis-2025-12.md` |
| Business Cases | `1-ideas/executive-docs/` | `business-case-building-marketplace.md` |
| Financial Analysis | `5-financing/analysis/` | `equity-structure-analysis.md` |
| Financial Reviews | `5-financing/reviews/` | `financing-plan-ai-first-review-2025-12.md` |
| Team Analysis | `6-operations/` | `team-structure-analysis.md` |
| Team Gaps | `6-operations/` | `team-gaps-analysis.md` |
| Architecture Analysis | `3-technical/3.1-system-foundation/` | `infrastructure-cost-allocation-analysis.md` |
| Documentation Audits | `8-governance/` | `documentation-location-audit-2025-12.md` |
| Feature Ideas | `1-ideas/1.4-feature-ideas/` | `feature-zalo-content-automation-2025-12.md` |

---

## Enforcement

- **@docs-guardian** - Enforces this guide and corrects violations
- **All agents** - Must follow this guide when creating files
- **Global rules** - Reference this guide in file creation checks

---

**Remember:** When in doubt, consult `@docs-guardian` and this guide before creating any file.

