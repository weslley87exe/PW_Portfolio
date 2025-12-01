import sqlite3

db_path = r"C:\PW_Portfolio\SQL_Scripts\vendas.db"

conn = sqlite3.connect(db_path)
c = conn.cursor()

print("✔ Conectado ao banco vendas.db")

# ===== 1. Reset clientes =====
print("🧹 Resetando tabela clientes...")
c.execute("DROP TABLE IF EXISTS clientes")

c.execute("""
CREATE TABLE clientes AS
SELECT
    DISTINCT id_cliente,
    estado,
    regiao
FROM vendas_raw;
""")
print("✔ Tabela clientes criada")

# ===== 2. Reset produtos =====
print("🧹 Resetando tabela produtos...")
c.execute("DROP TABLE IF EXISTS produtos")

c.execute("""
CREATE TABLE produtos AS
SELECT
    DISTINCT id_produto,
    categoria,
    subcategoria,
    preco_unitario,
    custo_unitario
FROM vendas_raw;
""")
print("✔ Tabela produtos criada")

# ===== 3. Reset vendas_fato =====
print("🧹 Resetando tabela vendas_fato...")
c.execute("DROP TABLE IF EXISTS vendas_fato")

c.execute("""
CREATE TABLE vendas_fato AS
SELECT
    id_venda,
    id_cliente,
    id_produto,
    quantidade,
    receita,
    lucro,
    forma_pagamento,
    canal_venda,
    estado,
    data_venda,
    ano,
    mes,
    anomes
FROM vendas_raw;
""")
print("✔ Tabela vendas_fato criada")

conn.commit()
conn.close()

print("TRANSFORMAÇÃO FINALIZADA ✔")
