import pandas as pd

# Excelファイルのフルパスに修正してください
file_path = "E:/風水AI開発/data/共通年盤1951-2050（立春完全版_最終修正）.xlsx"

df = pd.read_excel(file_path)
print(df.columns)