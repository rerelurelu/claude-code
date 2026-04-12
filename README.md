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
| [codex](codex/) | Invoke Codex CLI (OpenAI) for reviewing plans, designs, and code |
| [cursor](cursor/) | Invoke Cursor Agent CLI (Composer 2) for reviewing plans, designs, and code |
| [decomposition](decomposition/) | Decompose complex tasks into detailed, actionable todos |
| [deslop](deslop/) | Remove AI-generated "slop" from code changes |
| [dig](dig/) | Deep exploratory interview to discover unknowns and strengthen plans |
| [fix-ci](fix-ci/) | Automatically diagnose and fix CI failures |

## Commands

### `/clean-code` - Code Quality Polish

実装完了後のコード品質仕上げ。simplify → deslop → コメント整合性チェック → デッドコード検出の順で実行。

**Usage:**
```
/clean-code
/clean-code src/components/Button.tsx
```

### `/codex` - Codex Review

Codex CLI (OpenAI) を使って実装計画・設計・コードをレビュー。重大な問題と簡単に修正できる改善点のみを報告。

**Usage:**
```
/codex
```

### `/cursor` - Cursor Review

Cursor Agent CLI (Composer 2) を使って実装計画・設計・コードをレビュー。重大な問題と簡単に修正できる改善点のみを報告。

**Usage:**
```
/cursor
```

### `/decomposition` - Task Decomposition

複雑なタスクを詳細で実行可能なtodoに分解。各todoには独立して実行するのに十分な情報が含まれる。

**Usage:**
```
/decomposition
```

### `/deslop` - Remove AI Code Slop

現在のブランチのコード変更からAI生成のスロップ（不要なコメント、過剰な防御的チェック、スタイルの不整合）を除去。

**Usage:**
```
/deslop
```

### `/dig` - Deep Exploratory Interview

計画や議論の曖昧な点を特定し、構造化された質問で要件を明確化。

**Usage:**
```
/dig
```

### `/fix-ci` - Fix CI Failures

CI パイプラインの失敗を自動的に診断・修正。`gh` 認証を確認後、修正をpushしてCIが通るまで繰り返す。

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
codex/                  # codex plugin (skill)
cursor/                 # cursor plugin (skill)
decomposition/          # decomposition plugin (command)
deslop/                 # deslop plugin (command)
dig/                    # dig plugin (command)
fix-ci/                 # fix-ci plugin (command)
```

## Contributing

Feel free to fork this repository and add your own custom commands, agents, or skills.

## Acknowledgments

The `/deslop` command was inspired by [this tweet](https://x.com/ericzakariasson/status/1995671800643297542).

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
