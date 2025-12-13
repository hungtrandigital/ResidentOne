# INDEX — AI-First Startup Factory

**Version:** v3.0  
**Last Updated:** 2025-01-27

This document is the single source of truth for the repository structure. Always consult this file to understand where files belong.

## Quick Links

### Core Directories
- **[0-agents/](0-agents/)** - AI agent definitions, modes, workflows, and skills (DO NOT MODIFY)
- **[1-ideas/](1-ideas/)** - Market research, initial financing plans, initial go-to-market plans
- **[2-product-foundation/](2-product-foundation/)** - Product overview, backlog, requirements
- **[3-technical/](3-technical/)** - System foundation, implementation, DevOps
- **[systems/](systems/)** - All code for all systems (single-system or multi-system projects)
- **[4-marketing/](4-marketing/)** - Go-to-market strategy, channels, personas, performance
- **[5-financing/](5-financing/)** - Financing plans, pitches, projections
- **[6-operations/](6-operations/)** - Team structure, legal, HR, vendor contracts
- **[7-operations-monitoring/](7-operations-monitoring/)** - System monitoring, marketing analytics, incident response
- **[8-governance/](8-governance/)** - Project versions, changelog, decision log, risk register, retrospectives
- **[shared/](shared/)** - Shared templates and assets
- **[archives/](archives/)** - Archived documents

## Complete Directory Structure

```
market/
├── README.md
├── INDEX.md (this file)
├── .cursorrules
├── 0-agents/ (already exists - DO NOT MODIFY)
│   ├── _core/
│   ├── agents/
│   ├── mode/
│   └── workflows/
├── 1-ideas/
│   ├── README.md
│   ├── 1.1-market-research/
│   │   ├── README.md
│   │   ├── reports/
│   │   ├── summaries.md
│   │   ├── templates/
│   │   └── resources/
│   ├── initial-plans/
│   │   ├── README.md
│   │   ├── 1.2-initial-financing-plan.md
│   │   └── 1.3-initial-go-to-market-plan.md
│   ├── executive-docs/
│   │   ├── README.md
│   │   ├── EXECUTIVE-SUMMARY.md
│   │   └── business-case-building-marketplace.md
│   └── 1.4-feature-ideas/
├── 2-product-foundation/
│   ├── README.md
│   ├── 2.1-product-overview.md
│   ├── 2.2-product-backlog/
│   │   └── backlog.md
│   └── requirements/
├── 3-technical/
│   ├── README.md
│   ├── 3.1-system-foundation/
│   │   ├── README.md
│   │   ├── infrastructure.md
│   │   ├── architecture-decisions-summary.md
│   │   ├── architecture-preparation-plan.md
│   │   ├── infrastructure-cost-allocation-analysis.md
│   │   ├── architecture/
│   │   │   ├── README.md
│   │   │   ├── domain-specs.md
│   │   │   └── api-contracts/
│   │   └── design-standards/
│   │       ├── README.md
│   │       ├── coding-standards.md
│   │       └── system-design.md
│   ├── 3.2-implementation/
│   │   ├── README.md
│   │   ├── domain-specs.md
│   │   ├── api-contract.md
│   │   ├── status/
│   │   │   └── progress.md
│   │   ├── history/
│   │   │   ├── epics/
│   │   │   └── history.log.md
│   │   └── plans/
│   │       ├── README.md
│   │       ├── active/
│   │       ├── completed/
│   │       ├── archived/
│   │       └── epics/
│   └── 3.3-devops/
│       ├── README.md
│       ├── local-config/
│       └── server-steps.md
├── systems/
│   ├── README.md
│   ├── shared/
│   │   ├── libraries/
│   │   ├── packages/
│   │   └── services/
│   └── [system-name]/
│       ├── README.md
│       ├── docs/
│       ├── frontend/
│       ├── backend/
│       ├── tests/
│       └── db/
├── 4-marketing/
│   ├── README.md
│   ├── go-to-market.md
│   ├── channels/
│   ├── personas.md
│   └── performance/
├── 5-financing/
│   ├── README.md
│   ├── plans.md
│   ├── analysis/
│   │   ├── README.md
│   │   ├── equity-structure-analysis.md
│   │   └── onboarding-strategy-analysis.md
│   ├── preparation/
│   │   ├── README.md
│   │   ├── pitching-deck-outline.md
│   │   └── startup-financial-preparation-summary.md
│   ├── reviews/
│   │   └── financing-plan-ai-first-review-2025-12.md
│   ├── pitches/
│   └── projections/
├── 6-operations/
│   ├── README.md
│   ├── team-structure.md
│   ├── team-structure-analysis.md
│   ├── team-gaps-analysis.md
│   ├── legal/
│   │   └── founder-agreement-outline.md
│   ├── hr/
│   └── vendor-contracts/
├── 7-operations-monitoring/
│   ├── README.md
│   ├── system-monitoring/
│   ├── marketing-analytics.md
│   └── incident-response.md
├── 8-governance/
│   ├── README.md
│   ├── project-versions.md
│   ├── changelog.md
│   ├── decision-log.md
│   ├── risk-register.md
│   ├── success-probability-assessment-2025-12.md
│   └── quarterly-retrospective/
├── shared/
│   ├── README.md
│   ├── terminology.md
│   ├── templates/
│   └── assets/
└── archives/
    └── README.md
```

## File Placement Rules

### Code Files
- **All code** goes in `systems/[system-name]/`
- **Single-system projects:** One directory in `systems/` (e.g., `systems/web-app/`)
- **Multi-system projects:** Multiple directories in `systems/` (e.g., `systems/web-app/`, `systems/mobile-app/`)
- **Shared code:** Place in `systems/shared/` for code used across systems

### Documentation Files
- **Market research:** `1-ideas/1.1-market-research/reports/`
- **Product requirements:** `2-product-foundation/requirements/`
- **Architecture docs:** `3-technical/3.1-system-foundation/architecture/`
- **Implementation plans:** `3-technical/3.2-implementation/plans/`
- **Marketing docs:** `4-marketing/`
- **Financial docs:** `5-financing/`

### Initial vs Final Documents
- **Initial plans** live in `1-ideas/initial-plans/` (e.g., `1.2-initial-financing-plan.md`)
- **Final versions** move to proper sections:
  - `initial-plans/1.2-initial-financing-plan.md` → `5-financing/plans.md`
  - `initial-plans/1.3-initial-go-to-market-plan.md` → `4-marketing/go-to-market.md`
- When moving, leave a Markdown link pointing to the new location

## Naming Conventions

- **Files & Folders:** kebab-case (`product-overview.md`, `market-research/`)
- **Dates:** YYYY-MM-DD format
- **Versioned files:** `filename.v2025-12-09.md` (only in `archives/`)
- **All documents:** Markdown (.md)
- **Code files:** Follow language conventions (PascalCase for React components, camelCase for utilities)

## Important Notes

- **DO NOT modify `0-agents/`** - This directory contains agent definitions and must remain untouched
- **Every folder has a README.md** - Read it before taking action in that folder
- **Single source of truth** - Never duplicate information across folders
- **Update INDEX.md and changelog.md** after structural changes

---

**Remember:** When in doubt about file placement, consult this INDEX.md file first.

