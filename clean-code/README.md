# Clean Code Plugin

実装完了後のコード品質仕上げコマンド。`simplify` → `deslop` の順で実行します。

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

## 前提条件

- `simplify` スキルが利用可能であること
- `deslop` プラグインがインストールされていること

## ライセンス

GPL-3.0
