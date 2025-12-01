-- 01_create_tables.sql
PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS vendedores;
PRAGMA foreign_keys = ON;

-- Tabela de clientes (apenas campos que tipicamente aparecem)
CREATE TABLE IF NOT EXISTS clientes (
  id_cliente INTEGER PRIMARY KEY,
  nome TEXT,
  estado TEXT,
  regiao TEXT
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
  id_produto INTEGER PRIMARY KEY,
  categoria TEXT,
  subcategoria TEXT,
  produto TEXT,
  preco_unit REAL
);

-- Tabela de vendedores (se houver no CSV)
CREATE TABLE IF NOT EXISTS vendedores (
  id_vendedor INTEGER PRIMARY KEY,
  nome TEXT
);

-- Tabela de vendas (fato) - mantemos campos brutos + métricas
CREATE TABLE IF NOT EXISTS vendas (
  id_venda INTEGER PRIMARY KEY,
  id_cliente INTEGER,
  id_produto INTEGER,
  id_vendedor INTEGER,
  data_venda TEXT,
  ano INTEGER,
  mes INTEGER,
  anomes TEXT,
  quantidade INTEGER,
  preco_unit REAL,
  receita REAL,
  custo REAL,
  lucro REAL,
  forma_pagamento TEXT,
  canal_venda TEXT,
  estado TEXT,
  regiao TEXT,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
  FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);
