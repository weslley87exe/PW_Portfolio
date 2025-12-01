<h1 align="center">📈 SQL_Scripts</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Em%20Desenvolvimento-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Stack-SQL%20%7C%20SQLite%20%7C%20ETL-orange?style=for-the-badge">
  <img src="https://img.shields.io/badge/Version-1.0-lightgrey?style=for-the-badge">
</p>

---

## 🧠 Sobre o Projeto

Este repositório reúne scripts SQL que demonstram domínio em **modelagem, criação de tabelas, inserção, consultas analíticas e criação de views**.  
Ele faz parte do meu portfólio como Analista de Dados.

Atualmente, o destaque é o módulo **Projeto de Vendas (Etapa 3)**, onde foi criado um banco de dados realista contendo:

- Tabelas normalizadas  
- Carga de dados via ETL  
- Criação de views analíticas para dashboards  
- Consultas otimizadas para análise de negócios  

Este módulo será expandido com novos estudos de SQL ao longo do tempo.

---

## 🛠️ Tecnologias Utilizadas

- **SQLite**
- **SQL (DDL, DML e Views)**
- **Python (para carga de dados – ETL simples)**
- **Beekeeper Studio (visualização)**
- **VS Code + SQLite Viewer**

---

## 📂 Estrutura do Projeto

SQL_scripts/
├── dataset/
│ └── dataset_vendas.csv
│
├── prints/
│ ├── estrutura_banco.png
│ ├── view_lucro_por_categoria.png
│ ├── view_receita_por_mes.png
│ ├── view_receita_por_regiao.png
│ ├── view_top_produtos.png
│ └── view_vendas_completa.png
│
├── scripts/
│ ├── 01_create_tables.sql
│ ├── 02_load_raw.py
│ ├── 03_transform_data.py
│ ├── 04_create_views.sql
│ └── 05_views_and_procedures.sql
│
├── vendas.db
└── README.md

---

## 📊 Views Criadas (Etapa 3)

As seguintes views foram geradas a partir do banco `vendas.db`:

### • `vw_lucro_por_categoria`
Lucro total por categoria, ajudando a entender quais segmentos são mais rentáveis.

### • `vw_receita_por_mes`
Receita mensal consolidada para análises temporais.

### • `vw_receita_por_regiao`
Receita agrupada por região (Norte, Sul, Leste, Oeste).

### • `vw_top_produtos`
Top produtos por receita, essencial para identificação de best-sellers.

### • `vw_vendas_completa`
View unificada contendo venda + cliente + categoria, usada para dashboards completos.

---

## 📌 Status

🚧 Em constante evolução.  
Novos scripts, consultas, procedures e estudos de SQL serão adicionados conforme o desenvolvimento do portfólio.

---

## 👤 Autor

**Paulo Wesley Mesquita Oliveira**  
📧 Email: **pauloweslleypw8@gmail.com**  
🔗 LinkedIn: **www.linkedin.com/in/paulo-wesley-mesquita-oliveira-841b0b377**  
🐙 GitHub: **github.com/weslley87exe**

---

---

# 🌍 English Version

<h1 align="center">📈 SQL_Scripts — Data Analysis & Views</h1>

---

## 🧠 About the Project

This repository gathers SQL scripts showcasing proficiency in **table design, DDL, DML, analytical queries, and view creation**.  
It is part of my Data Analytics portfolio.

The current highlight is the **Sales Project (Stage 3)**, where a realistic database was built with:

- Normalized tables  
- Data loading through a simple ETL process  
- Analytical views for dashboards  
- Optimized business queries  

More SQL modules will be added over time as the repository grows.

---

## 🛠️ Technologies Used

- **SQLite**
- **SQL (DDL, DML, Views)**
- **Python ETL**
- **Beekeeper Studio**
- **VS Code + SQLite Viewer**

---

## 📂 Project Structure

SQL_scripts/
├── dataset/
│ └── dataset_vendas.csv
│
├── prints/
│ ├── estrutura_banco.png
│ ├── view_lucro_por_categoria.png
│ ├── view_receita_por_mes.png
│ ├── view_receita_por_regiao.png
│ ├── view_top_produtos.png
│ └── view_vendas_completa.png
│
├── scripts/
│ ├── 01_create_tables.sql
│ ├── 02_load_raw.py
│ ├── 03_transform_data.py
│ ├── 04_create_views.sql
│ └── 05_views_and_procedures.sql
│
├── vendas.db
└── README.md


---

## 📊 Analytical Views (Stage 3)

### • `vw_lucro_por_categoria`
Shows total profit per category.

### • `vw_receita_por_mes`
Monthly revenue for time-based analysis.

### • `vw_receita_por_regiao`
Revenue grouped by region.

### • `vw_top_produtos`
Top-performing products by revenue.

### • `vw_vendas_completa`
Unified view combining sales, clients, and categories.

---

## 📌 Status

🚧 Work in progress.  
New SQL studies, queries and modules will be added regularly.

---

## 👤 Author

**Paulo Wesley Mesquita Oliveira**  
📧 Email: **pauloweslleypw8@gmail.com**  
🔗 LinkedIn: **www.linkedin.com/in/paulo-wesley-mesquita-oliveira-841b0b377**  
🐙 GitHub: **github.com/weslley87exe**
