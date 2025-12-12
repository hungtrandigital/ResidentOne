# systems/ — Code Repository

This directory contains all code for all systems in the project.

## Structure

- **[shared/](shared/)** - Shared code used across multiple systems
- **[system-name/](system-name/)** - Individual system directories

## Project Types

### Single-System Projects
- One directory in `systems/` (e.g., `systems/web-app/`)

### Multi-System Projects
- Multiple directories in `systems/` (e.g., `systems/web-app/`, `systems/mobile-app/`)

## System Structure

Each system directory should contain:
- **README.md** - System documentation
- **docs/** - System-specific documentation
- **frontend/** - Frontend code
- **backend/** - Backend code
- **tests/** - Test files
- **db/** - Database schemas, migrations, seeds

## Shared Code

Code used across multiple systems should be placed in `systems/shared/`:
- **libraries/** - Shared libraries
- **packages/** - Shared packages
- **services/** - Shared services

## Important Rules

- **All code goes here** - No code files outside `systems/`
- **Follow system structure** - Use the standard structure for each system
- **Document everything** - Each system should have a README.md

## Navigation

- **Technical Documentation:** [../3-technical/](../3-technical/)
- **Product Requirements:** [../2-product-foundation/](../2-product-foundation/)

---

See [INDEX.md](../INDEX.md) for complete repository structure.

