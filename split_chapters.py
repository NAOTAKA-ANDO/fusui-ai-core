from docx import Document
import os
import re

# 読み込むWordファイル名（ファイル名変更している場合はここを修正）
doc = Document("knowledge/fusui_sci.docx")

# 出力フォルダ
output_dir = "knowledge/chapters"
os.makedirs(output_dir, exist_ok=True)

# 章の検出パターン（例：「第1章　タイトル」）
chapter_pattern = re.compile(r"^第?(\d+)[章|章：|\s]")

current_chapter = None
chapter_text = []

for para in doc.paragraphs:
    text = para.text.strip()

    if not text:
        continue  # 空行はスキップ

    match = chapter_pattern.match(text)
    if match:
        # 章タイトルが見つかった場合、前の章を保存
        if current_chapter:
            filename = f"{output_dir}/chapter{current_chapter}.txt"
            with open(filename, "w", encoding="utf-8") as f:
                f.write("\n".join(chapter_text))

        # 新しい章に切り替え
        current_chapter = match.group(1)
        chapter_text = [text]
    else:
        chapter_text.append(text)

# 最後の章を保存
if current_chapter:
    filename = f"{output_dir}/chapter{current_chapter}.txt"
    with open(filename, "w", encoding="utf-8") as f:
        f.write("\n".join(chapter_text))

print("章ごとの分割が完了しました。")



