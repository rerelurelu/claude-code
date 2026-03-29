---
name: codex
description: |
  Invokes Codex CLI (OpenAI) for reviewing implementation plans, designs, and code.
  Triggers on: "codex", "codex review", "code review", "review this"
  Use when: reviewing implementation plans, architectural designs, or implementation code. Returns only critical issues and easy-to-fix improvements.
user-invocable: true
---

# Codex Review

Invoke Codex CLI to perform reviews and analysis via Bash tool.

## Command

```bash
codex exec --full-auto --sandbox read-only --cd <project_directory> "<request>"
```

## Review Type Selection

**Implementation plan?** → Check consistency and gaps in the plan
**Design?** → Validate architecture and design decisions
**Code?** → Check code quality, bugs, and improvements

## Prompt Rules

Every request sent to Codex **MUST** include both of the following:

1. "No questions or confirmations needed. Proactively output specific proposals, fixes, and code examples."
2. "Filter findings by: (1) Critical issues (bugs, security, design flaws), (2) Issues worth fixing that are easy to address. Omit minor nitpicks and style preferences."

## Parameters

| Parameter | Description |
|-----------|-------------|
| `--full-auto` | Run in fully automatic mode |
| `--sandbox read-only` | Read-only sandbox |
| `--cd <dir>` | Target project directory |
| `"<request>"` | The review request |

## Workflow

1. Receive review request from the user
2. Determine the target project directory
3. Determine the review type: plan / design / code
4. Compose the prompt (always include filtering criteria + no-confirmation instruction)
5. Execute Codex
6. Scrutinize results — if there are doubts or disagreements, enter the discussion flow
7. Report final results to the user

## Discussion Flow

When you have doubts or disagreements about Codex's response, **start a discussion autonomously without asking the user**.

1. Quote the specific point from Codex's previous response and clearly state your concern or counterargument in a new prompt
2. Include in the follow-up prompt: "Be frank and direct. Don't hold back — push back candidly."
3. Continue the back-and-forth until you are satisfied (no round limit)
4. After the discussion concludes, report to the user in the following format:

```
## Codexとの議論結果

**議論内容**: <what was discussed>

**議論の過程**:
1. Codexの主張: <content>
2. 私の反論: <content>
3. ...（until convergence）

**結論**: <final judgment>
**採用した解決策**: <concrete approach or code example>
```
