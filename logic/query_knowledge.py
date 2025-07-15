
import pandas as pd
import re
from datetime import datetime
import os

# データファイルのパスを指定（共通年盤）
data_path = os.path.join("data", "共通年盤1951-2050（立春完全版_最終修正）.xlsx")
df = pd.read_excel(data_path)

# 質問を受け取る
question = input("🧭 質問をどうぞ（例：今年の干支は？、2025年の干支は？）\n🧭 質問をどうぞ：")

# 現在の時刻
now = datetime.now()
target_year = None

# 年の特定処理（自然表現対応）
if "来年" in question:
    target_year = now.year + 1
elif "再来年" in question:
    target_year = now.year + 2
elif "今年" in question:
    target_year = now.year
elif "去年" in question:
    target_year = now.year - 1
elif "おととし" in question:
    target_year = now.year - 2
elif match := re.search(r"(\d{1,2})年前", question):
    target_year = now.year - int(match.group(1))
elif match := re.search(r"(\d{1,2})年後", question):
    target_year = now.year + int(match.group(1))
elif match := re.search(r"(\d{4})年", question):
    target_year = int(match.group(1))

# 該当年のデータを検索
if target_year:
    row = df[df["西暦"] == target_year]
    if not row.empty:
        eto = row["干支"].values[0]
        kyusei = row["九星中宮"].values[0]
        risshun_date = row["立春_日付"].values[0]
        risshun_time = row["立春_時刻"].values[0]
        risshun = f"{risshun_date} {risshun_time}"
        print(f"\n🧠 回答：\n\n{target_year}年の干支は「{eto}」、九星中宮は「{kyusei}」です。\n立春は {risshun} です。")
    else:
        print(f"\n🧠 回答：\n\n申し訳ありません。その年（{target_year}年）の情報はデータに登録されていません。")
else:
    print("\n🧠 回答：\n\n日付の解釈に失敗しました。例：「2025年の干支は？」のようにお尋ねください。")
