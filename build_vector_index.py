import os
import json
from pathlib import Path
from tqdm import tqdm
import openai
import faiss
import pickle
import numpy as np

# OpenAI APIキーを環境変数から取得
openai.api_key = os.getenv("OPENAI_API_KEY")
if not openai.api_key:
    raise RuntimeError("❌ OPENAI_API_KEY が設定されていません。環境変数に登録してください。")

# 設定
BASE_DIR = Path("E:/風水AI開発/structured")
CHUNK_SIZE = 500
EMBEDDING_MODEL = "text-embedding-ada-002"

# ストレージ
texts = []
metas = []

# JSON読み込みとチャンク処理
for json_path in tqdm(list(BASE_DIR.glob("**/chapters_json/*.json")), desc="📥 JSON読み込み中"):
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    content = data.get("content", "")
    title = data.get("title", "")
    images = data.get("images", [])

    # チャンク分割
    chunks = [content[i:i+CHUNK_SIZE] for i in range(0, len(content), CHUNK_SIZE)]
    for idx, chunk in enumerate(chunks):
        texts.append(chunk)
        metas.append({
    "source": json_path.stem,
    "title": title,
    "chunk_id": idx,
    "images": images,
    "text": chunk  # ← ✅ これを追加！
})

# 埋め込み生成（OpenAI API）
print(f"🔍 OpenAI埋め込み開始：{len(texts)} チャンク")
vectors = []
for text in tqdm(texts, desc="🧠 埋め込みベクトル生成中"):
    response = openai.Embedding.create(input=[text], model=EMBEDDING_MODEL)
    vector = response["data"][0]["embedding"]
    vectors.append(vector)

# FAISSインデックス構築
dimension = len(vectors[0])
index = faiss.IndexFlatL2(dimension)
index.add(np.array(vectors).astype("float32"))

# 保存
out_dir = Path("vectorstore/faiss_index")
out_dir.mkdir(parents=True, exist_ok=True)
faiss.write_index(index, str(out_dir / "index.faiss"))
with open(out_dir / "index.pkl", "wb") as f:
    pickle.dump(metas, f)

print("✅ インデックス構築完了！ → vectorstore/faiss_index/")

metas.append({
    "source": json_path.stem,
    "title": title,
    "chunk_id": idx,
    "images": images,
    "text": chunk  # ←これを追加！
})