---
description: "Post-implementation code quality polishing. Runs simplify then deslop in sequence."
---

# Clean Code: Code Quality Polish

Run quality polishing steps in sequence after implementation is complete.

## Steps

### Step 1: Simplify

Invoke the `simplify` skill via the Skill tool.
- Target: $ARGUMENTS (if not specified, use recently changed files)

### Step 2: Deslop

After Step 1 completes, invoke `deslop:deslop` via the Skill tool.
- Target: all changes from the main branch (including changes made by Simplify)

## Completion Report

After both steps complete, report to the user in the following format:

```
仕上げ処理完了
Simplify: <change summary or 変更なし>
Deslop: <change summary in 1-3 sentences>
```
