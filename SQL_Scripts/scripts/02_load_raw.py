import sqlite3
import pandas as pd

print("🔌 Conectando ao banco...")

# AGORA O CERTO:
conn = sqlite3.connect(r"C:\PW_Portfolio\SQL_Scripts\vendas.db")
c = conn.cursor()

print("📦 Lendo o CSV bruto...")
df = pd.read_csv(
    r"C:\PW_Portfolio\SQL_Scripts\dataset\dataset_vendas.csv",
    sep=";",
    encoding="latin1"
)

print("🔍 Colunas detectadas:", df.columns.tolist())

# Converter data corretamente
print("🕒 Convertendo coluna data_venda...")
df["data_venda"] = pd.to_datetime(
    df["data_venda"],
    format="%Y-%m-%d",
    errors="coerce"
)

print("🧹 Resetando tabela vendas_raw...")
c.execute("DROP TABLE IF EXISTS vendas_raw")

df.to_sql("vendas_raw", conn, index=False)

print(f"✅ Import completo! {len(df)} linhas inseridas sem dor de cabeça.")
print("💾 Banco atualizado: vendas.db")

conn.commit()
conn.close()
