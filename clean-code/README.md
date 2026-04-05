# Clean Code Plugin

実装完了後のコード品質仕上げコマンド。`simplify` → `deslop` のあと、コメントの実態との整合とデッドコードの確認を行います。

## インストール

```bash
/plugin install clean-code@relu-marketplace
```

## 使い方

```
/clean-code
```

特定のファイルを対象にする場合:
```
/clean-code src/components/Button.tsx
```

## ワークフロー

1. **Simplify** — 変更されたコードの再利用性・品質・効率をレビューし改善
2. **Deslop** — mainブランチとの差分からAI生成のスロップを除去
3. **コメント整合性** — 触れたファイルで、コメントが現在の実装と一致するか確認し、古い・誤った説明を直すか削除
4. **デッドコード** — 未使用の import/export、到達不能な分岐、リファクタ後に残った不要コードなどを検出し、意図的に残すもの以外は除去

## 前提条件

- `simplify` スキルが利用可能であること
- `deslop` プラグインがインストールされていること

## ライセンス

GPL-3.0
