# Orchestration Protocol — AI-First Startup Factory (v2.1)

This file defines exactly how multiple AI agents (or multiple instances of the same agent) coordinate with each other inside this repository.  
All agents must obey this protocol without exception.

## Core Principles

1. One source of truth → the repository file system + INDEX.md
2. **Structure compliance** → ALL files MUST follow the directory structure defined in INDEX.md
3. Zero surprise → never modify a file that another agent is currently working on
4. Explicit handoff → always end your output with a clear next agent + next task
5. No infinite loops → maximum 2 review cycles per task before escalating to human

## Supported Orchestration Patterns

### 0. Task Validation Gate (ALWAYS FIRST)

**Before any task is assigned to an agent, @product-strategist MUST validate it.**

When a new task is proposed:
1. Check if it links to an existing epic (`2-product-foundation/2.2-product-backlog/backlog.md`)
2. Check if it's part of an existing idea (`1-ideas/`)
3. Check if it's part of an existing plan (`3-technical/3.2-implementation/plans/`)

**If validation fails:**
- 🛑 STOP — Do not hand off to other agents
- 🛑 Ask human for clarification (which epic? what's the business case? what's the success metric?)
- 🛑 Once clarified, add to backlog or update relevant plan FIRST

**If validation passes:**
- ✅ Proceed with orchestration chains below

---

### 1. Sequential Chaining (default & safest)
Use when output of step N is required as input for step N+1.

Common chains:
- Market Research → Product Strategist → Product Overview → Domain Specs → System Architecture → Implementation
- Idea → Business Analyst → Product Strategist → Backlog → Fullstack Engineer → Code Reviewer → DevOps
- Creative Brief → UI/UX Designer → Graphics Designer → Frontend Engineer

Execution rule:
[Agent A] completes → writes summary + file links → explicitly calls:
"Next agent: @product-strategist, please take over using the outputs above."

### 2. Parallel Execution (high productivity)
Use when tasks are independent and can run simultaneously.

Allowed parallel tracks:
- Frontend Engineer + Backend Engineer (different folders)
- UI/UX Designer + Copywriter + Marketing Expert
- Multiple unrelated backlog items
- iOS Engineer ↔ Android Engineer ↔ Web Engineer

Coordination rules:
- Before starting parallel work, **update the active plan file** in `3-technical/3.2-implementation/plans/` with a short “Parallel Coordination” section stating:
  - Which agents run in parallel
  - Integration/merge point
  - Shared files (if any)
- All parallel agents must read that plan section before starting
- Final merge is done by a designated “Integration Agent” (usually @fullstack-engineer or @devops)

If a separate coordination file is truly necessary:
1. **Read INDEX.md** - Verify correct location for coordination files
2. **Consult @docs-guardian** - Get confirmation on location and naming
3. **Use kebab-case, non-generic filename** - Place in correct folder per INDEX.md structure

### 3. Review & Approval Loops
Every execution or parallel track must end with a review cycle:

Executor → Code Reviewer / Docs Guardian / Marketing Expert
          ↓
If approved → merge + update progress.md + changelog.md
If rejected → return to Executor with clear feedback → max 2 cycles → escalate to human

### 4. Escalation to Human
Trigger escalation when:
- More than 2 review rejections
- Conflicting instructions from different agents
- Decision required outside defined scope (pricing, legal, partnership, etc.)
- Risk register entry needed

Escalation format:

@human — ESCALATION REQUIRED
Issue: [brief description]
Options considered: [A, B, C]
Recommendation: [agent’s choice]
Please reply with final decision.

### 5. Agent Handoff Template (must use exactly)

At the end of every agent response, include this block:
```markdown
### ORCHESTRATION HANDOFF

**Current mode**: execution | plan | ideas | review  
**Task completed**: Yes / No  
**Files created/modified**:
- path/to/file1.md
- path/to/file2.ts

**Next recommended agent**: @fullstack-engineer / @marketing-expert / @human  
**Next task**: "Implement user authentication flow according to newly created domain-specs.md"  
**Priority**: High / Medium / Low
```markdown
### 6. Forbidden Patterns (will be rejected)

**Structure Violations:**
- ❌ **Creating files outside the defined folder structure** - ALL files MUST be in locations defined in INDEX.md
- ❌ **Not reading INDEX.md before creating files** - MANDATORY: Read INDEX.md first to understand structure
- ❌ **Not consulting file-placement-guide.md** - MANDATORY: Check `0-agents/_core/file-placement-guide.md` for placement rules
- ❌ **Creating files without verifying location** - Always verify location matches INDEX.md structure

**File Creation Violations:**
- ❌ **Creating files without consulting docs-guardian** - Agents must consult `@docs-guardian` before creating new files
- ❌ **Creating duplicate files** - Always check for existing files and update them instead of creating new ones
- ❌ **Creating generic report files** - Files like `COMPLETE_REPORT.md`, `FULL_REPORT.md`, `report.md`, `summary.md`, `log.md` are FORBIDDEN
- ❌ **Not updating summary/log files** - Always update existing summary files (e.g., `summaries.md`) instead of creating new ones

**Plan Management Violations:**
- ❌ **Creating plans without checking existing** - Always check `plans/active/` and `plans/epics/` before creating new plan
- ❌ **Creating plans without metadata** - All plans MUST include metadata (status, type, priority, dates, epic, system)
- ❌ **Creating plans without updating index** - All new plans MUST be added to `plans/README.md` index
- ❌ **Leaving completed plans in active** - Move completed plans to `plans/completed/[YYYY-MM]/` when implementation is done

**Other Violations:**
- ❌ Two agents editing the same file simultaneously
- ❌ Skipping review step for code or architecture changes
- ❌ Deleting files without moving them to archives/ first

### 7. Example Full Workflow (Feature Development)

1. @product-strategist → writes requirements/user-stories
2. @system-architecture → creates domain-specs.md + api-contracts/
3. @fullstack-engineer → implements in systems/[system-name]/
4. Parallel: @ui-ux-designer works on Figma → assets/
5. @code-reviewer → reviews PR/diff
6. @devops → deploys staging
7. @human → final approval → production

Respect this protocol at all times.  
Violation will cause the Docs Guardian agent to revert your changes and notify human.