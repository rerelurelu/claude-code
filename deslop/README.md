# deslop

Remove AI-generated "slop" from uncommitted code changes (or a specified scope).

## Overview

This plugin helps maintain code quality by identifying and removing unnecessary additions that AI assistants sometimes introduce, ensuring code remains consistent with the project's existing style and practices.

## Installation

```
/plugin marketplace add rerelurelu/claude-code
/plugin install deslop@rerelurelu/claude-code
```

## Usage

The skill is automatically invoked by Claude when needed, or you can manually invoke it:

```
/deslop
```

## What it removes

- Extra comments that a human wouldn't add or are inconsistent with the rest of the file
- Extra defensive checks or try/catch blocks that are abnormal for that area of the codebase (especially if called by trusted/validated codepaths)
- Any other style that is inconsistent with the file

## How it works

1. Determine the target scope — `$ARGUMENTS` if given, otherwise uncommitted changes (`git diff HEAD` plus untracked files from `git status --porcelain`)
2. Analyze changes for AI-generated patterns
3. Remove unnecessary additions
4. Provide a brief 1-3 sentence summary of what was changed

## Allowed Tools

This skill uses the following tools:
- Read
- Edit
- Write
- Bash
- Grep
- Glob
- Task

## Plugin Structure

```
deslop/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   └── deslop/
│       └── SKILL.md
└── README.md
```

## Acknowledgments

Inspired by [this tweet](https://x.com/ericzakariasson/status/1995671800643297542).

## License

GPL-3.0
