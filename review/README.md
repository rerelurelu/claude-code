# Review Plugin

Unified code review plugin using Codex CLI (OpenAI) and optionally Cursor Agent CLI (Composer 2).

## Installation

```bash
/plugin install review@relu-marketplace
```

## Usage

```
/review
/review src/components/Button.tsx
```

Or in natural language:
- "review this code"
- "code review"
- "review the implementation plan"

## Features

- **Implementation plan review**: Check consistency and gaps in plans
- **Design review**: Validate architecture and design decisions
- **Code review**: Identify bugs, security issues, and improvements
- **Multi-tool**: Always runs Codex; optionally runs Cursor when enabled
- **Cross-referencing**: Compares findings across tools when both run
- **Autonomous debate**: Challenges and discusses disagreements with tools
- **Severity filtering**: CRITICAL/HIGH (must fix), MEDIUM (consider), LOW (skip)
- **Auto-fix**: Applies fixes for CRITICAL and HIGH findings automatically

## Cursor Integration

Cursor Agent CLI is disabled by default. To enable it, add the following to `.claude/settings.json`:

```json
{
  "cursorEnabled": true
}
```

## Prerequisites

- [Codex CLI](https://github.com/openai/codex) must be installed
- [Cursor CLI](https://www.cursor.com/) must be installed (only if enabling Cursor)

## License

GPL-3.0
