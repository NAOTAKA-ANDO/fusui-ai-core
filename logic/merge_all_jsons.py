import os
import json

input_dirs = [
    "structured/fusui_jiken/chapters_json",
    "structured/fusui_sci/chapters_json",
    "structured/seminar_2024/chapters_json",
]
output_file = "structured/all_knowledge.json"

all_chunks = []
chunk_counter = 1

for input_dir in input_dirs:
    for filename in os.listdir(input_dir):
        if filename.endswith(".json"):
            file_path = os.path.join(input_dir, filename)
            with open(file_path, "r", encoding="utf-8") as f:
                try:
                    data = json.load(f)
                    if isinstance(data, list):
                        for chunk in data:
                            if isinstance(chunk, dict):
                                chunk["chunk_id"] = chunk_counter
                                all_chunks.append(chunk)
                                chunk_counter += 1
                            elif isinstance(chunk, str):
                                all_chunks.append({
                                    "title": filename.replace(".json", ""),
                                    "chunk_id": chunk_counter,
                                    "text": chunk
                                })
                                chunk_counter += 1
                    elif isinstance(data, str):
                        all_chunks.append({
                            "title": filename.replace(".json", ""),
                            "chunk_id": chunk_counter,
                            "text": data
                        })
                        chunk_counter += 1
                    elif isinstance(data, dict):
                        data["chunk_id"] = chunk_counter
                        all_chunks.append(data)
                        chunk_counter += 1
                    else:
                        print(f"⚠️ 未対応の形式: {file_path}")
                except Exception as e:
                    print(f"❌ 読み込みエラー: {file_path} - {e}")

# 保存
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(all_chunks, f, ensure_ascii=False, indent=2)

print(f"✅ マージ完了: {output_file} に {len(all_chunks)} チャンクを保存しました。")
