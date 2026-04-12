# claude-code

A collection of personal Claude Code utilities and custom slash commands.

## Overview

This repository contains a Claude Code plugin marketplace that provides custom commands to enhance your Claude Code workflow. The plugins are designed to help maintain code quality and consistency when working with AI-assisted development.

## Installation

### From Claude Code (Recommended)

You can install plugins directly from Claude Code using the plugin management system:

1. Add this repository as a marketplace:
   ```
   /plugin marketplace add rerelurelu/claude-code
   ```

2. Install the plugins:
   ```
   /plugin install deslop@rerelurelu/claude-code
   /plugin install dig@rerelurelu/claude-code
   /plugin install fix-ci@rerelurelu/claude-code
   ```

3. Restart Claude Code to activate the plugins.

### Manual Installation

Alternatively, you can clone this repository and use it as a local marketplace:

```bash
git clone https://github.com/rerelurelu/claude-code.git
```

Then in Claude Code:
```
/plugin marketplace add ./claude-code
```

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [clean-code](clean-code/) | Post-implementation code quality polishing (simplify → deslop → comment/dead-code check) |
| [review](review/) | Unified code review using Codex CLI and optionally Cursor Agent CLI |
| [decomposition](decomposition/) | Decompose complex tasks into detailed, actionable todos |
| [deslop](deslop/) | Remove AI-generated "slop" from code changes |
| [dig](dig/) | Deep exploratory interview to discover unknowns and strengthen plans |
| [fix-ci](fix-ci/) | Automatically diagnose and fix CI failures |

## Commands

### `/clean-code` - Code Quality Polish

Post-implementation code quality polishing. Runs simplify → deslop → comment accuracy check → dead-code detection in sequence.

**Usage:**
```
/clean-code
/clean-code src/components/Button.tsx
```

### `/review` - Unified Code Review

Review implementation plans, designs, and code using Codex CLI (always) and optionally Cursor Agent CLI. Cross-references findings, debates disagreements, filters by severity, and applies fixes for critical issues.

**Usage:**
```
/review
/review src/components/Button.tsx
```

### `/decomposition` - Task Decomposition

Decompose complex tasks into detailed, actionable todos. Each todo contains enough information to be executed independently.

**Usage:**
```
/decomposition
```

### `/deslop` - Remove AI Code Slop

Remove AI-generated slop (unnecessary comments, excessive defensive checks, style inconsistencies) from code changes in the current branch.

**Usage:**
```
/deslop
```

### `/dig` - Deep Exploratory Interview

Identify ambiguities in plans and discussions, then clarify requirements through structured questions.

**Usage:**
```
/dig
```

### `/fix-ci` - Fix CI Failures

Automatically diagnose and fix CI pipeline failures. Verifies `gh` authentication, then iterates by pushing fixes and waiting for CI to pass.

**Usage:**
```
/fix-ci
```

## Plugin Structure

This repository is organized as a plugin marketplace containing multiple plugins:

```
.claude-plugin/
└── marketplace.json    # Marketplace metadata

clean-code/             # clean-code plugin (command + skill)
decomposition/          # decomposition plugin (command)
deslop/                 # deslop plugin (command)
dig/                    # dig plugin (command)
fix-ci/                 # fix-ci plugin (command)
review/                 # review plugin (skill)
```

## Contributing

Feel free to fork this repository and add your own custom commands, agents, or skills.

## Acknowledgments

The `/deslop` command was inspired by [this tweet](https://x.com/ericzakariasson/status/1995671800643297542).

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
