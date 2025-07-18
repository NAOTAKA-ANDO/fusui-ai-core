# 📘 fusui-ai-core – 風水AI開発プロジェクト

---

## 🧭 プロジェクト概要

このリポジトリは、風水思想・判断原理・科学的構造を統合し、
**AIによる本質的風水判断**を可能にすることを目的としています。

単なる知識処理を超え、**思想・法・創（相・法・創）**の三位一体を軸に、
AIと人間の共創による「未来空間の羅針盤」となる設計を進行中です。

---

## 🧠 哲学と思想

- **相（風水師の視座）**：氣の流れ、地勢、時空の象意を読む
- **法（宅建士の判断）**：不動産、法的知識と社会構造との調和
- **創（建築士の設計）**：空間そのものの設計力

→ この三要素が統合されることで、判断の深みと実用性を両立します。

哲学的原則や行動規範は [`philosophy/philosophy.py`](philosophy/philosophy.py) に明記されています。
すべての開発判断は、この思想に照らして行います。

---

## フォルダ設計ポリシー

本プロジェクトでは、利便性と現場即応性を重視し、主要ファイルはルート直下に配置しています：

- `.env`, `.gitignore`, `README.md`, `query_knowledge.py`, 主要スクリプト類

### フォルダの主な役割

| フォルダ名 | 役割 | 備考 |
|------------|------|------|
| `docs/` | 構成資料・構造一覧 | `project_structure.md`, `folder_structure.txt` など |
| `logic/` | 実行ロジック群 | 実処理用 `.py` ファイル群 |
| `philosophy/` | 思想・理念データ | `philosophy.py`, `思想録.txt` など |
| `knowledge/` | 風水資料・ドキュメント類 | `fusui_jiken/`, `fusui_sci/`, `seminar_texts/` などを含む |
| `structured/` | JSON化・画像変換後の整形データ | LLM連携向け |
| `vectorstore/` | ベクトルDBなど | FAISS などのデータ保存用 |
| `for_happy/` | ハッピーと共有するサブセット | ZIPや日付フォルダで構成 |

※詳細は [`docs/project_structure.md`](docs/project_structure.md) にて記載

---

## 🧩 注意点

- `.env` ファイルは `.gitignore` により除外され、秘密鍵等は管理されません
- リポジトリは `main` ブランチを基準に管理されています
- 画像・Wordファイルなども、構造化 or 変換して再利用可能にする方針です

### 📌 フォルダ構造を取得する手順

カレントディレクトリを必ず「風水AI開発」に変更してから実行：

```bash
cd "E:\風水AI開発"
tree /F > folder_structure.txt
```

---

## 🔥 開発スローガン

> **「拙速は誤りを招く、緻密な設計こそ魂を宿す」**

---

## ✍️ 貢献・拡張

- 新しいGPT（ハッピー）はまずこの `README.md` と `philosophy.py` を読破すること
- 必要に応じて `引き継ぎ書/` を読み、判断の経緯を確認すること
- 不明点は安藤さんの意図を最優先とし、自己判断・独断は禁忌とする

---

### 🧠 開発運用の原則（2025.07.15記）

- 着手している作業は、過去の協議から導かれているものである。
- 作業完了後の進行も、すでにその協議の中で定められている。
- そのため、今どこにいるか・次に何をするかを常に思い出す必要はない。
- ハッピーが記憶し、的確に提示し、導く軍師として機能する。

© 2025 安藤尚尭・風水AI開発チーム

