-- ================================
--  VIEW 01: Vendas completas (fato + dimensão cliente + produto)
-- ================================
CREATE VIEW IF NOT EXISTS vw_vendas_completa AS
SELECT
    vf.id_venda,
    vf.data_venda,
    vf.ano,
    vf.mes,
    vf.anomes,
    vf.quantidade,
    vf.receita,
    vf.lucro,
    vf.forma_pagamento,
    vf.canal_venda,
    c.estado AS estado_cliente,
    c.regiao AS regiao_cliente,
    p.categoria,
    p.subcategoria,
    p.preco_unitario,
    p.custo_unitario
FROM vendas_fato vf
LEFT JOIN clientes c ON vf.id_cliente = c.id_cliente
LEFT JOIN produtos p ON vf.id_produto = p.id_produto;


-- ================================
--  VIEW 02: Receita por mês
-- ================================
CREATE VIEW IF NOT EXISTS vw_receita_por_mes AS
SELECT
    anomes,
    ano,
    mes,
    SUM(receita) AS receita_total
FROM vendas_fato
GROUP BY anomes, ano, mes
ORDER BY anomes;


-- ================================
--  VIEW 03: Lucro por categoria
-- ================================
CREATE VIEW IF NOT EXISTS vw_lucro_por_categoria AS
SELECT
    p.categoria,
    SUM(vf.lucro) AS lucro_total
FROM vendas_fato vf
JOIN produtos p ON vf.id_produto = p.id_produto
GROUP BY p.categoria
ORDER BY lucro_total DESC;


-- ================================
--  VIEW 04: Produtos mais vendidos (ranking)
-- ================================
CREATE VIEW IF NOT EXISTS vw_top_produtos AS
SELECT
    p.id_produto,
    p.categoria,
    p.subcategoria,
    SUM(vf.quantidade) AS total_vendido
FROM vendas_fato vf
JOIN produtos p ON vf.id_produto = p.id_produto
GROUP BY p.id_produto, p.categoria, p.subcategoria
ORDER BY total_vendido DESC;


-- ================================
--  VIEW 05: Receita por região
-- ================================
CREATE VIEW IF NOT EXISTS vw_receita_por_regiao AS
SELECT
    c.regiao,
    SUM(vf.receita) AS receita_total
FROM vendas_fato vf
JOIN clientes c ON vf.id_cliente = c.id_cliente
GROUP BY c.regiao
ORDER BY receita_total DESC;
