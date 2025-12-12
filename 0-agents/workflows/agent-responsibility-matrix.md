# Agent Responsibility Matrix

## Purpose

This matrix clarifies responsibilities and prevents overlap confusion between agents. Use this as a reference when determining which agent should handle a task.

## Responsibility Matrix

| Task/Area | Primary Agent | Secondary/Support | Notes |
|-----------|--------------|-------------------|-------|
| **Product Requirements** | @product-strategist | - | Owns product vision, backlog, requirements |
| **System Architecture** | @system-architecture | - | Owns technical architecture, design, infrastructure |
| **Code Implementation** | @fullstack-engineer | - | Writes code, tests, implements features |
| **Code Review** | @code-reviewer | - | Reviews code quality, security, standards |
| **Documentation Creation** | @fullstack-engineer | - | Creates README.md, .env.example, etc. |
| **Documentation Review** | @code-reviewer | - | Reviews documentation quality |
| **Documentation Maintenance** | @docs-guardian | - | Archives, maintains structure, fixes links |
| **Domain Specs Creation** | @system-architecture | @product-strategist (stubs) | Creates domain model |
| **Domain Specs Update (Architecture)** | @system-architecture | - | Updates when architecture changes |
| **Domain Specs Update (Implementation)** | @docs-guardian | - | Updates when code/functionality changes |
| **API Contracts Creation** | @system-architecture | @product-strategist (stubs) | Creates API contracts |
| **API Contracts Update** | @fullstack-engineer | - | Updates when adding new endpoints |
| **Coding Standards Creation** | @system-architecture | - | Creates coding-standards.md |
| **Coding Standards Enforcement** | @code-reviewer | @fullstack-engineer (follows) | Enforces standards in review |
| **Plan Creation** | @fullstack-engineer, @fix-mode, @boost | - | Creates implementation plans |
| **Plan Completion** | @fullstack-engineer | - | Moves to completed when done |
| **Plan Archiving** | @docs-guardian | - | Archives old completed plans |
| **Progress Updates** | @fullstack-engineer | @devops (deployment) | Updates progress.md |
| **Changelog Updates** | @fullstack-engineer, @devops, @docs-guardian | - | Each updates their domain |
| **Tech Stack Selection** | @system-architecture | - | Selects and documents tech stack |
| **Tech Stack Usage** | @fullstack-engineer | - | Reads and uses tech stack |

## Clear Boundaries

### Domain Specs Updates

**@system-architecture updates when:**
- New system architecture designed
- Architecture patterns change
- System boundaries change
- Design decisions affect domain model

**@docs-guardian updates when:**
- Code implementation adds new entities/services
- Functionality changes affect business logic
- API endpoints modified
- Database schemas change
- Project structure reorganized

**Trigger:** If @docs-guardian detects architecture-level changes, notify @system-architecture to update.

### Documentation

**@fullstack-engineer creates:**
- README.md
- .env.example
- QUICKSTART.md
- DOCKER.md
- API.md (if applicable)

**@code-reviewer reviews:**
- All documentation created by @fullstack-engineer
- Uses same checklist for review

**@docs-guardian maintains:**
- Documentation structure
- Archives outdated docs
- Fixes broken links

### Plans

**Agents create/update:**
- @fullstack-engineer: Feature plans
- @fix-mode: Fix plans
- @boost: Refactoring plans

**All agents:**
- Check existing plans first
- Add metadata
- Update index

**@docs-guardian:**
- Archives old plans
- Maintains index
- Detects duplicates

## Handoff Patterns

### Product → Architecture → Implementation

1. @product-strategist → Creates requirements
2. @system-architecture → Creates architecture (domain-specs, API contracts)
3. @fullstack-engineer → Implements code
4. @code-reviewer → Reviews code
5. @docs-guardian → Updates domain specs (if implementation changes)

### Implementation → Review → Maintenance

1. @fullstack-engineer → Completes implementation, updates progress/changelog
2. @code-reviewer → Reviews code and documentation
3. @docs-guardian → Updates domain specs, maintains documentation

## Conflict Resolution

### If Responsibility Unclear

**Check this matrix first**, then:
1. Check agent's Core Responsibilities section
2. Check agent's Forbidden Actions section
3. If still unclear, ask human

### Common Conflicts

**Domain Specs Update:**
- Architecture change? → @system-architecture
- Implementation change? → @docs-guardian

**Documentation:**
- Creating? → @fullstack-engineer
- Reviewing? → @code-reviewer
- Maintaining? → @docs-guardian

**Plans:**
- Creating/updating? → Agent working on feature/fix
- Archiving? → @docs-guardian

## Related Documents

- **[Agent Definitions](../agents/)** - Full agent definitions
- **[Orchestration Protocol](orchestration-protocol.md)** - Agent coordination
- **[Global Rules](../_core/global-rules.md)** - Repository-wide rules

---

**Use this matrix to clarify responsibilities and avoid overlap confusion.**
