---
name: cursor
description: |
  Invokes Cursor Agent CLI (Composer 2) for reviewing implementation plans, designs, and code.
  Triggers on: "cursor", "cursor review", "composer review"
  Use when: reviewing implementation plans, architectural designs, or implementation code. Returns only critical issues and easy-to-fix improvements.
user-invocable: true
---

# Cursor Review

Invoke Cursor Agent CLI (Composer 2) to perform reviews and analysis via Bash tool.

## Command

```bash
cursor agent --print --model composer-2 --trust --workspace <project_directory> --mode ask "<request>"
```

## Mode Selection

常に `--mode ask` を使用する。ask モードでもコードベース全体の読み取りが可能で、レビュー・分析・質問すべてに適している。

`--mode plan` は使用しない（plan はコード変更の計画用であり、レビュー用途には不適切）。

## Review Type Selection

**Implementation plan?** → Check consistency and gaps in the plan
**Design?** → Validate architecture and design decisions
**Code?** → Check code quality, bugs, and improvements

## Prompt Rules

Every request sent to Cursor **MUST** include both of the following:

1. "No questions or confirmations needed. Proactively output specific proposals, fixes, and code examples."
2. "Filter findings by: (1) Critical issues (bugs, security, design flaws), (2) Issues worth fixing that are easy to address. Omit minor nitpicks and style preferences."

## Parameters

| Parameter | Description |
|-----------|-------------|
| `--print` | Output results to stdout |
| `--model composer-2` | Use Composer 2 model |
| `--trust` | Run in trust mode |
| `--workspace <dir>` | Target project directory |
| `--mode ask` | レビュー・分析モード（常にこれを使用） |
| `"<request>"` | The review request |

## Workflow

1. Receive review request from the user
2. Determine the target project directory
3. Determine the review type: plan / design / code
4. `--mode ask` を使用（常に固定）
5. Compose the prompt (always include filtering criteria + no-confirmation instruction)
6. Execute Cursor
7. Scrutinize results — if there are doubts or disagreements, enter the discussion flow
8. Report final results to the user

## Discussion Flow

When you have doubts or disagreements about Cursor's response, **start a discussion autonomously without asking the user**.

1. Quote the specific point from Cursor's previous response and clearly state your concern or counterargument in a new prompt
2. Include in the follow-up prompt: "Be frank and direct. Don't hold back — push back candidly."
3. Continue the back-and-forth until you are satisfied (no round limit)
4. After the discussion concludes, report to the user in the following format:

```
## Cursorとの議論結果

**議論内容**: <what was discussed>

**議論の過程**:
1. Cursorの主張: <content>
2. 私の反論: <content>
3. ...（until convergence）

**結論**: <final judgment>
**採用した解決策**: <concrete approach or code example>
```
