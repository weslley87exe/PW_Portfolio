-- ============================================================
-- 05_relatorios.sql (VERSÃO CERTA)
-- Relatórios prontos para análise — Portfólio Paulo (PW)
-- Compatível com as views criadas em 04_ovw_vendas.sql
-- ============================================================


-- ============================================================
-- 1) Top 10 "produtos" mais vendidos (usando SUBCATEGORIA)
-- ============================================================
SELECT 
    subcategoria AS produto,
    SUM(quantidade) AS total_vendida
FROM vw_vendas_completa
GROUP BY subcategoria
ORDER BY total_vendida DESC
LIMIT 10;


-- ============================================================
-- 2) Receita total por mês
-- ============================================================
SELECT 
    anomes,
    mes,
    receita_total AS receita
FROM vw_receita_por_mes
ORDER BY anomes ASC;


-- ============================================================
-- 3) Lucro por categoria
-- ============================================================
SELECT
    categoria,
    lucro_total
FROM vw_lucro_por_categoria
ORDER BY lucro_total DESC;


-- ============================================================
-- 4) Top 5 subcategorias que mais geram receita
-- ============================================================
SELECT
    subcategoria AS produto,
    SUM(receita) AS receita_total
FROM vw_vendas_completa
GROUP BY subcategoria
ORDER BY receita_total DESC
LIMIT 5;


-- ============================================================
-- 5) Receita por região
-- ============================================================
SELECT
    regiao,
    receita_total
FROM vw_receita_por_regiao
ORDER BY receita_total DESC;


-- ============================================================
-- 6) Ticket médio geral
-- ============================================================
SELECT 
    SUM(receita) * 1.0 / COUNT(DISTINCT id_venda) AS ticket_medio
FROM vw_vendas_completa;


-- ============================================================
-- 7) Ranking de clientes por valor total gasto
-- ============================================================
-- Obs: NÃO EXISTE id_cliente na vw_vendas_completa
-- Vamos usar categoria + subcategoria como proxy de agrupamento
-- (Portfolio-friendly, não quebra)
SELECT
    estado_cliente AS cliente_grupo,
    SUM(receita) AS total_gasto
FROM vw_vendas_completa
GROUP BY estado_cliente
ORDER BY total_gasto DESC;


-- ============================================================
-- 8) Crescimento mensal da receita (mês a mês)
-- ============================================================
SELECT
    anomes,
    receita_total AS receita,
    receita_total - LAG(receita_total, 1) OVER (ORDER BY anomes) AS crescimento
FROM vw_receita_por_mes;


-- ============================================================
-- 9) Percentual de participação das categorias na receita total
-- ============================================================
SELECT
    categoria,
    lucro_total,
    ROUND(
        lucro_total * 100.0 / SUM(lucro_total) OVER (),
        2
    ) AS percentual_participacao
FROM vw_lucro_por_categoria
ORDER BY percentual_participacao DESC;


-- ============================================================
-- 10) Mapa: Quantidade de vendas por estado
-- ============================================================
SELECT
    estado_cliente AS estado,
    COUNT(id_venda) AS total_vendas
FROM vw_vendas_completa
GROUP BY estado_cliente
ORDER BY total_vendas DESC;
