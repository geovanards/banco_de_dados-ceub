-- 01.Contar o número total de clientes
SELECT COUNT(*) AS total_clientes FROM clientes;
-- conta o número de registros na tabela clientes. O resultado é o número total de clientes cadastrados na loja. Resultado: O número total de clientes
-- count: conta o número de linhas em uma tabela ou o número de valores não nulos em uma coluna especificada



-- 02.Contar o número total de pedidos
SELECT COUNT(*) AS total_pedidos FROM pedidos;
-- Conta o número de registros na tabela pedidos, ou seja, o número total de pedidos feitos por todos os clientes.



-- 03.Calcular o valor total de todos os pedidos
SELECT SUM(p.preco * pe.quantidade) AS valor_total
FROM pedidos pe
JOIN produtos p ON pe.produto_id = p.id;
-- calcula o valor total de todos os pedidos multiplicando o preço de cada produto (p.preco) pela quantidade comprada (pe.quantidade) e somando esses valores. A junção (JOIN) entre as tabelas pedidos e produtos é necessária para acessar os preços dos produtos.
-- sum: a soma total


--  Calcular a média de preço dos produtos
SELECT AVG(preco) AS media_preco_produtos FROM produtos;
-- AVG(): calcula a média dos valores de uma coluna numérica. Ela soma todos os valores de uma coluna especificada e divide pelo número de registros não nulos presentes nessa coluna.


--  Listar todos os clientes e seus pedidos
SELECT c.nome AS cliente, p.id AS pedido, p.data_pedido, pr.nome AS produto, p.quantidade
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
LEFT JOIN produtos pr ON p.produto_id = pr.id;



--  Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT p.id AS pedido, c.nome AS cliente, pr.nome AS produto, p.quantidade, p.data_pedido
FROM pedidos p
LEFT JOIN clientes c ON p.cliente_id = c.id
LEFT JOIN produtos pr ON p.produto_id = pr.id;

--  Listar os produtos mais caros primeiro
SELECT nome, preco FROM produtos
ORDER BY preco DESC;

--  Listar os produtos com menor estoque
SELECT nome, estoque FROM produtos
ORDER BY estoque ASC;

--  Contar quantos pedidos foram feitos por cliente
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id;

--  Contar quantos produtos diferentes foram vendidos
SELECT COUNT(DISTINCT produto_id) AS total_produtos_vendidos
FROM pedidos
WHERE produto_id IS NOT NULL;

--  Mostrar os clientes que não realizaram pedidos
SELECT nome
FROM clientes
WHERE id NOT IN (SELECT DISTINCT cliente_id FROM pedidos WHERE cliente_id IS NOT NULL);

--  Mostrar os produtos que nunca foram vendidos
SELECT nome
FROM produtos
WHERE id NOT IN (SELECT DISTINCT produto_id FROM pedidos WHERE produto_id IS NOT NULL);

--  Contar o número de pedidos feitos por dia
SELECT data_pedido, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY data_pedido
ORDER BY data_pedido;

--  Listar os produtos mais vendidos
SELECT pr.nome, SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id
ORDER BY total_vendido DESC;

--  Encontrar o cliente que mais fez pedidos
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id
ORDER BY total_pedidos DESC
LIMIT 1;

--  Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
SELECT p.id AS pedido, c.nome AS cliente, p.data_pedido
FROM pedidos p
LEFT JOIN clientes c ON p.cliente_id = c.id;

--  Listar os produtos e o total de vendas por produto
SELECT pr.nome, SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id
ORDER BY total_vendido DESC;

--  Calcular a média de quantidade de produtos por pedido
SELECT AVG(quantidade) AS media_quantidade_por_pedido
FROM pedidos;

--  Listar os pedidos ordenados por data (mais recentes primeiro)
SELECT * FROM pedidos
ORDER BY data_pedido DESC;

--  Contar quantos clientes possuem telefone cadastrado
SELECT COUNT(*) AS total_clientes_com_telefone
FROM clientes
WHERE telefone IS NOT NULL;

--  Encontrar o cliente que gastou mais dinheiro em pedidos.
SELECT c.nome, SUM(p.preco * pe.quantidade) AS total_gasto
FROM pedidos pe
JOIN clientes c ON pe.cliente_id = c.id
JOIN produtos p ON pe.produto_id = p.id
GROUP BY c.id
ORDER BY total_gasto DESC
LIMIT 1;

-- Listar os 5 produtos mais vendidos.
SELECT pr.nome, SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id
ORDER BY total_vendido DESC
LIMIT 5;

-- Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id;

-- Encontrar a data com mais pedidos realizados
SELECT data_pedido, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY data_pedido
ORDER BY total_pedidos DESC
LIMIT 1;

-- Calcular a média de valor gasto por pedido
SELECT AVG(p.preco * pe.quantidade) AS media_valor_gasto_por_pedido
FROM pedidos pe
JOIN produtos p ON pe.produto_id = p.id;
