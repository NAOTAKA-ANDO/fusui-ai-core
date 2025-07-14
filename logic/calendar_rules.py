
import pandas as pd
from datetime import datetime

# データファイルパス（適宜変更）
DATA_PATH = "data/共通年盤1951-2050（立春完全版_最終修正）.xlsx"

def load_calendar_data():
    return pd.read_excel(DATA_PATH)

def get_year_info(date: datetime):
    df = load_calendar_data()
    year = date.year

    try:
        risshun_date = df[df["西暦"] == year]["立春_日付"].values[0]
        risshun_time = df[df["西暦"] == year]["立春_時刻"].values[0]
        risshun_dt = pd.to_datetime(f"{risshun_date} {risshun_time}")
    except:
        return {"エラー": f"{year}年の立春データが取得できませんでした"}

    if date < risshun_dt:
        year -= 1

    row = df[df["西暦"] == year].iloc[0]
    return {
        "西暦": int(row["西暦"]),
        "干支": row["干支"],
        "九星中宮": row["九星中宮"],
        "立春": f"{row['立春_日付']} {row['立春_時刻']}"
    }
