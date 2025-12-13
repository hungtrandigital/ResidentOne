# Boost Mode — AI-First Startup Factory

**Version:** v3.0  
**Purpose:** Define the scope, activities, and workflow for Boost Mode (project initialization)

## Overview

Boost Mode is a one-time initialization mode for setting up a new project or reorganizing an existing messy codebase into the Factory template structure. This mode creates the complete directory structure, analyzes existing files, migrates them to correct locations, and applies naming conventions.

**Command:** Use `/boost` in Cursor IDE to activate this mode.

**When to Use:** Only for initial project setup or major restructuring. Not for regular development work.

## When to Use Boost Mode

Use Boost Mode when:
- **Initial project setup** - Setting up a new project from scratch
- **Project restructuring** - Reorganizing a messy codebase into Factory structure
- **Migration** - Moving files from scattered locations to proper structure
- **Structure compliance** - Ensuring project follows Factory directory structure

**DO NOT use Boost Mode for:**
- Regular development work
- Adding new features
- Daily file operations
- Code changes

## Core Activities

### 0. Read Current State (ALWAYS START HERE)

**Before starting any boost operations:**
1. **Read `INDEX.md`** - Understand the complete target structure
2. **Read `0-agents/_core/global-rules.md`** - Understand non-negotiable rules, especially:
   - Rule 10.1: Task Validation Gate (tasks must link to epic/idea/plan)
   - Rule 11: Work-Item Traceability System (all work items must have metadata)
3. **Read `0-agents/_core/work-item-traceability.md`** - Understand work-item metadata requirements and ID schema
4. **Scan current codebase** - Identify existing files and structure
5. **Check if `0-agents/` exists** - This directory should already exist and must NOT be modified
6. **Identify scattered files** - Find files in wrong locations

**Action:** Always understand current state before creating structure or migrating files. Boost is not just structure setup—it also ensures traceability system is in place.

### 1. Create Directory Structure

**Action:**
1. Read `INDEX.md` to understand complete target structure
2. Create all required directories and subdirectories as defined in `INDEX.md`
3. For multi-system projects: Create `systems/` directory with structure for each system
4. All projects use unified `systems/[system-name]/` structure
5. Create all required `README.md` files with proper routing content
6. Create placeholder files as needed (e.g., `project-versions.md`, `changelog.md`)

**Important:**
- **DO NOT** modify or move anything in `0-agents/` directory
- **DO NOT** overwrite existing files without user confirmation
- Create directories even if they will be empty initially

**Output:**
- List all directories created
- List all README.md files created
- Confirm structure matches target in `INDEX.md`

### 2. Analyze Current Codebase

**Action:**
1. Scan entire codebase (excluding `0-agents/`, `.git/`, `node_modules/`, build artifacts)
2. Identify all files and their current locations
3. Categorize files by type:
   - **Code files:** Source code (`.js`, `.ts`, `.py`, `.tsx`, `.jsx`, etc.)
   - **Documentation:** Markdown files, text files, docs
   - **Configuration:** Config files (`.json`, `.yaml`, `.toml`, `.env`, etc.)
   - **Assets:** Images, fonts, media files
   - **Tests:** Test files
   - **Database:** SQL files, migrations, seeds

4. For each file, determine:
   - **Current location**
   - **Proposed target location** (based on content analysis and `INDEX.md`)
   - **Proposed new filename** (if renaming needed to follow naming conventions)
   - **Reasoning** for the placement

**Output:** Create detailed analysis report with tables for each file category.

### 2.5. Scan Code Quality and Suggest Refactoring (OPTIONAL - If code exists)

**Action:**
If source code files exist in the codebase, perform code quality analysis:

1. **Scan code structure:**
   - Analyze code organization and file structure
   - Identify code patterns and anti-patterns
   - Check for code duplication
   - Identify large files or functions (>300 lines)
   - Check for proper separation of concerns

2. **Analyze code quality:**
   - Check for unused imports/variables
   - Identify hardcoded values that should be configurable
   - Check for missing error handling
   - Identify potential security issues (if obvious)
   - Check for accessibility issues (if frontend code)

3. **Suggest refactoring opportunities:**
   - **Code organization:** Suggest better file/folder structure
   - **Code patterns:** Suggest improvements (e.g., extract functions, split large files)
   - **Best practices:** Suggest adherence to coding standards
   - **Dependencies:** Identify unused or outdated dependencies
   - **Testing:** Identify missing tests or test coverage gaps

4. **Create refactoring suggestions report:**
   - List refactoring opportunities by priority (High/Medium/Low)
   - Provide specific file locations and line numbers (if applicable)
   - Suggest concrete improvements with reasoning
   - Note: These are suggestions only - user decides what to implement

**Output Format:**
```markdown
## Code Quality & Refactoring Suggestions

### High Priority
| File | Issue | Suggestion | Reasoning |
|------|-------|------------|-----------|
| `[path]/utils.[ext]` | Large file (500+ lines) | Split into smaller modules by functionality (e.g., `utils/date.[ext]`, `utils/format.[ext]`, `utils/validation.[ext]`) | Better maintainability, easier testing |
| `[path]/[component].[ext]` | Hardcoded values | Extract to configuration file or constants | Follows best practices, easier to maintain |

### Medium Priority
| File | Issue | Suggestion | Reasoning |
|------|-------|------------|-----------|
| `[path]/[api-file].[ext]` | Missing error handling | Add proper error handling (try-catch, error responses) | Better error handling improves UX and reliability |

### Low Priority
| File | Issue | Suggestion | Reasoning |
|------|-------|------------|-----------|
| `[path]/[file].[ext]` | Unused imports/dependencies | Remove unused imports or dependencies | Clean up codebase, reduce bundle size |

### Code Organization Suggestions
- Consider grouping related utilities in subdirectories by functionality
- Consider separating API routes by domain (e.g., by resource or feature)
- Consider extracting shared types/interfaces to dedicated directory
- Consider organizing components by feature rather than by type

**Note:** 
- Replace `[path]`, `[file]`, `[ext]` with actual file paths, names, and extensions found in the codebase
- These are suggestions for future improvement. Boost Mode focuses on structure setup and file migration. Code refactoring can be done later in Code Mode or Fix Mode.
```

**Important:**
- This step is **optional** and only runs if source code files exist
- Focus on **structural improvements** and **obvious issues**
- Do NOT modify code - only suggest improvements
- User decides which suggestions to implement (not part of migration plan)

### 3. User Confirmation for Uncertain Items

**Action:**
1. Present analysis report to user
2. Highlight files in "Uncertain Files" category
3. For each uncertain file:
   - Show file content preview (first 10-20 lines)
   - Ask: "Where should this file go?"
   - Provide 2-3 suggested options with reasoning
   - Wait for user confirmation before proceeding

**Output:**
- List of files requiring user decision
- User's decisions recorded

### 4. Create Migration Plan

**Action:**
1. Create detailed migration plan based on analysis and user confirmations
2. Group operations by type:
   - **Move operations:** Files to move to new locations
   - **Rename operations:** Files to rename (following naming conventions)
   - **Refactor operations:** Files that need content updates (e.g., update links)
   - **Create operations:** New files to create (e.g., missing README.md)

3. **Ensure traceability compliance** (MANDATORY):
   - Identify all epic definitions (should be in `2-product-foundation/2.2-product-backlog/backlog.md`)
   - Identify all work items (tasks, slices, bugs, plans)
   - Ensure each work item will have required metadata (YAML frontmatter with `id`, `parent_id`, `related_ids`, `phases`, `owner`, `folder`)
   - Check that `3-technical/3.2-implementation/status/work-items-registry.md` will be updated as source of truth
   - Verify task validation gate can be enforced (every task must link to epic/idea/plan)

4. Check for conflicts:
   - Will moving/renaming break any imports/references?
   - Are there duplicate files?
   - Will this overwrite existing files?

5. **Include refactoring suggestions** (if Step 2.5 was performed):
   - Reference the code quality report
   - Note that refactoring suggestions are separate from migration
   - User can implement refactoring suggestions later in Code Mode or Fix Mode

6. Present migration plan to user for approval before executing

**Output:** Detailed migration plan with phases, potential issues, reference to refactoring suggestions (if available), and **traceability compliance checklist**.

### 5. Execute Migration

**Action:**
1. Execute migration plan step by step
2. For each operation:
   - **Before moving:** Check if target exists, ask user if overwrite needed
   - **Move/Rename:** Perform the file operation
   - **Update references:** Fix imports, links, and references in affected files
   - **Verify:** Check that the file is in the correct location

3. Handle special cases:
   - **Code files:** Update import paths in all affected files
   - **Documentation:** Update cross-references and links
   - **Configuration:** Ensure paths in config files are updated
   - **Tests:** Move test files alongside their source files

**Important:**
- **DO NOT** delete files - only move/rename them
- **DO NOT** modify file contents unless necessary for path updates
- **DO** create backup notes of original locations (in a migration log)

### 6. Apply Naming Conventions

**Action:**
Ensure all files follow naming conventions:

**Documentation Files (Markdown):**
- Use **kebab-case**: `product-overview.md`, `go-to-market.md`
- Use descriptive names: `initial-financing-plan.md` not `plan.md`
- Version indicators: `initial-*` for early versions, final versions in proper sections

**Code Files:**
- **Frontend:** PascalCase for components (`Button.tsx`), camelCase for utilities (`apiClient.ts`)
- **Backend:** camelCase for files (`userService.ts`, `database.ts`)
- **Tests:** Match source file name with `.test.` or `.spec.` suffix

**Directory Names:**
- **kebab-case:** `market-research/`, `product-backlog/`
- **Numbered prefixes:** `1-ideas/`, `2-product-foundation/`, `3-technical/`

**Output:**
- List of files renamed to comply with conventions
- List of files that couldn't be renamed (with reasons)

### 7. Update Cross-References

**Action:**
1. Scan all markdown files for broken links
2. Update relative paths in:
   - README.md files
   - Documentation files
   - Code comments (if they reference docs)

3. Update import statements in code files if paths changed
4. Update `INDEX.md` if structure changed

**Output:**
- List of files with updated links
- List of broken links that couldn't be auto-fixed (require manual review)

### 8. Generate Final Report

**Action:**
Create comprehensive final report with:
- Summary (total files analyzed, moved, renamed, created, references updated)
- Directory structure created
- Files migrated (by category)
- Naming convention updates
- Reference updates
- **Code quality & refactoring suggestions** (if Step 2.5 was performed)
- **Traceability System Status:**
  - ✅ Work-Item Registry (`3-technical/3.2-implementation/status/work-items-registry.md`) is in place
  - ✅ Epic definitions exist in `2-product-foundation/2.2-product-backlog/backlog.md`
  - ✅ All work items have required metadata (id, parent_id, related_ids, phases, owner, folder)
  - ✅ Task Validation Gate can be enforced (product-strategist will validate incoming tasks)
  - ✅ Global rules are understood and applicable to new project
- Issues & warnings
- Next steps (including optional refactoring work and project-specific setup in Plan Mode)
- Verification checklist

**Output:** Complete migration report saved to `8-governance/changelog.md` or appropriate location. If code quality analysis was performed, also save refactoring suggestions to `3-technical/3.2-implementation/plans/refactoring-suggestions.md` (for future reference).

## Allowed Actions

✅ **You CAN:**
- **Read `INDEX.md`** - Always read to understand target structure
- **Read `0-agents/_core/global-rules.md`** - Understand rules, especially task validation gate and traceability system
- **Read `0-agents/_core/work-item-traceability.md`** - Understand metadata and ID schema requirements
- Create directory structure as defined in `INDEX.md`
- Create README.md files with proper routing
- Analyze existing files and categorize them
- **Scan code quality** (if source code exists) and suggest refactoring opportunities
- Move files to correct locations
- Rename files to follow naming conventions
- Update import paths and links
- Create migration reports and refactoring suggestions reports
- Ask user for confirmation when uncertain
- **Verify traceability system setup** - Ensure epic definitions, work-items-registry, and metadata requirements are understood

## Forbidden Actions

❌ **You CANNOT:**
- Modify or move anything in `0-agents/` directory
- Delete files (only move/rename)
- Modify file contents unless updating paths/links
- **Implement refactoring suggestions** - Only suggest, user implements later
- **Modify code structure** - Only suggest improvements
- Overwrite existing files without user confirmation
- Skip user confirmation for uncertain files
- Proceed without migration plan approval
- Modify `.git/` or version control files
- Delete `.gitignore` or other root config files

## Output Locations

Boost Mode outputs go to:
- **Directory Structure:** All directories as defined in `INDEX.md`
- **Migration Report:** `8-governance/changelog.md` or dedicated migration log
- **Refactoring Suggestions:** `3-technical/3.2-implementation/plans/refactoring-suggestions.md` (if code analysis was performed)
- **Files:** Moved to correct locations according to `INDEX.md` structure

## Mode Transition

Boost Mode typically transitions to:
- **Chat Mode** - When boost is complete and user needs guidance
- **Plan Mode** - When structure is ready and user wants to create project-specific epics and roadmap (MUST complete before Code Mode)
- **Ideas Mode** - When structure is ready and user wants to start ideation

**IMPORTANT:** After Boost completes structure setup, @product-strategist must establish initial epics in Plan Mode before any code work begins. This ensures the traceability system is initialized and the Task Validation Gate can function.

**After Boost:**
- Project structure is complete and matches Factory template
- All files are in correct locations
- Naming conventions are applied
- References are updated
- `0-agents/` rules are understood and will be enforced
- **NEXT STEP:** Transition to Plan Mode to create project-specific epics and roadmap

## Pre-Boost Checklist

Before starting boost, ensure:
- ✅ `INDEX.md` exists or you understand target structure
- ✅ `0-agents/` directory exists (will not be modified)
- ✅ User understands this is a one-time setup operation
- ✅ User is ready to review and approve migration plan
- ✅ User is aware of Task Validation Gate and Work-Item Traceability requirements
- ✅ User understands Plan Mode must follow Boost Mode to establish initial epics

## Success Criteria

Boost Mode is successful when:
- ✅ All required directories exist (matching `INDEX.md`)
- ✅ All README.md files created with proper routing
- ✅ All files are in appropriate locations
- ✅ All files follow naming conventions
- ✅ All references/links are updated and working
- ✅ No files were lost or deleted
- ✅ User has clear report of all changes
- ✅ Project structure matches target structure in `INDEX.md`
- ✅ **Task Validation Gate is understood by user and team** (product-strategist will enforce)
- ✅ **Work-Item Traceability System is understood** (metadata requirements, ID schema, registry)
- ✅ **User is ready to transition to Plan Mode** to establish initial epics

## Orchestration Handoff Format

When in Boost Mode, use this format:

```markdown
**Current mode**: boost  
**Task completed**: [Yes/No/Partial]  
**Phase**: [Structure Creation / Analysis / Migration / Naming / References / Complete]

**Directories created**: [List]
**Files analyzed**: [Count]
**Files moved**: [Count]
**Files renamed**: [Count]
**References updated**: [Count]

**Next recommended agent**: @docs-guardian (to verify structure) OR transition to Chat Mode  
**Next task**: "[Clear task description]"  
**Priority**: [High/Medium/Low]

**Blockers/Issues**: [None / List any blockers or files requiring user decision]
```

## Related Documents

- **[Boost Agent](../agents/boost.md)** - Primary agent for boost operations
- **[INDEX.md](../../INDEX.md)** - Target directory structure reference
- **[Global Rules](../_core/global-rules.md)** - Repository rules, including Task Validation Gate (rule 10.1) and Work-Item Traceability (rule 11)
- **[Work-Item Traceability System](../_core/work-item-traceability.md)** - Complete glossary, ID schema, metadata requirements, lifecycle tracking
- **[Product Strategist Agent](../agents/product-strategist.md)** - Who enforces Task Validation Gate and owns epic definition
- **[Orchestration Protocol](../workflows/orchestration-protocol.md)** - Includes Task Validation Gate as section 0 (ALWAYS FIRST)
- **[Docs Guardian Agent](../agents/docs-guardian.md)** - Structure verification (post-boost)

---

**Remember:** Boost Mode is a one-time setup operation.  
When in doubt, ask the user. Better to ask than to make a wrong assumption.

