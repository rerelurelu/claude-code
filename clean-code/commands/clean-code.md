---
description: "Post-implementation code quality polishing. Runs simplify, deslop, then comment/dead-code checks."
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

### Step 3: Comment accuracy and dead code

After Step 2 completes, audit the same scope (diff vs `main`, or files from `$ARGUMENTS` if specified). Do not skip even if Simplify and Deslop reported no changes.

**Stale or misleading comments**

- In touched files, read comments (block, line, JSDoc/TSDoc) against the actual code: behavior, parameters, return values, invariants, and edge cases.
- Update comments that are outdated after refactors, or remove them if they add no value.
- Remove comments that contradict the implementation or describe code paths that no longer exist.

**Dead code**

- Find and remove unused imports, unused exports, private helpers never referenced, unreachable branches, and code left behind after refactors.
- If something appears unused but must stay (e.g. public API, framework entry points, intentional fallbacks), leave it and note that in the completion report instead of deleting it.

Use project-appropriate checks (e.g. linters, typechecker, `grep` / symbol references) where they exist; otherwise verify by reading call sites and the diff.

## Completion Report

After all steps complete, report to the user in the following format:

```
仕上げ処理完了
Simplify: <change summary or 変更なし>
Deslop: <change summary in 1-3 sentences>
コメント整合性: <fixes/removals or 問題なし>
デッドコード: <removals or 検出なし>
```
