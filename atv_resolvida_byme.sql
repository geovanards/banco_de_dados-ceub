--  01. Contar o número total de clientes
select COUNT(*) as total_de_clientes 
from clientes;

--  02. Contar o número total de pedidos
select COUNT(*) as total_de_pedidos
from pedidos;

--  03. Calcular o valor total de todos os pedidos
select sum(produtos.preco * pedidos.quantidade)
	as valor_total_dos_pedidos 
	from pedidos
    join produtos on pedidos.produto_id =  produtos.id;
    
--  04. Calcular a média de preço dos produtos
select AVG(produtos.preco * pedidos.quantidade)
as media from pedidos
join produtos on pedidos.produto_id = produtos.id;

--  05. Listar todos os clientes e seus pedidos
select 
clientes.nome as cliente,
pedidos.id as id_pedido,
produtos.nome as produto
from
pedidos
join
clientes on pedidos.cliente_id = clientes.id
join
produtos on pedidos.produto_id = produtos.id;


--  06. Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
select 
    pedidos.id as pedidos_id,
    produtos.nome as produtos
from pedidos
left join produtos on produtos.id = pedidos.produto_id;

--  07. Listar os produtos mais caros primeiro
select
produtos.nome,
produtos.preco
from
produtos
order by preco DESC;

--  08. Listar os produtos com menor estoque
select nome, estoque
from produtos
where estoque = ( select min(estoque) from produtos); 

--  09. Contar quantos pedidos foram feitos por cliente
select 
clientes.nome as cliente,
count(pedidos.cliente_id) as pedidos_por_cliente 
from clientes
left join pedidos on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;

--  10. Contar quantos produtos diferentes foram vendidos
select count(pedidos_diferentes) as qnt_pedidos_diferentes
from ( 
		select distinct pedidos.produto_id as pedidos_diferentes
        from pedidos) as pedidos;

--  11. Mostrar os clientes que não realizaram pedidos
select clientes.nome as cliente_sem_pedido
from clientes
left join pedidos on pedidos.cliente_id =  clientes.id
where pedidos.cliente_id IS NULL;

--  12. Mostrar os produtos que nunca foram vendidos
SELECT
	produtos.nome AS produto_nao_vendido
FROM
	produtos
LEFT JOIN	
	pedidos ON pedidos.produto_id = produtos.id
WHERE 
	pedidos.produto_id IS NULL;
    
--  13. Contar o número de pedidos feitos por dia
SELECT DISTINCT
	pedidos.data_pedido AS data_do_pedido,
	COUNT(pedidos.data_pedido) AS qnt_de_pedidos
FROM
	pedidos
GROUP BY
	pedidos.data_pedido, pedidos.data_pedido;

--  14. Listar os produtos mais vendidos
SELECT
	produtos.nome AS produtos,
    SUM(pedidos.quantidade) AS qnt_vendida
FROM
	produtos
LEFT JOIN 
	pedidos ON pedidos.produto_id = produtos.id
GROUP BY 
	produtos.nome
ORDER BY
	qnt_vendida DESC;

--  15. Encontrar o cliente que mais fez pedidos
SELECT
	clientes.nome,
    COUNT(pedidos.cliente_id) AS total_de_pedidos
FROM
	clientes
JOIN
	pedidos ON pedidos.cliente_id = clientes.id
GROUP BY
	clientes.nome, pedidos.cliente_id
ORDER BY
	total_de_pedidos DESC
LIMIT 1;

--  16. Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
select 
	pedidos.id as pedido_id,
    clientes.nome as cliente,
    produtos.nome as produto
from pedidos
left join clientes on clientes.id = pedidos.cliente_id
left join produtos on produto_id = pedidos.produto_id;

--  17. Listar os produtos e o total de vendas por produto
select produtos.nome as produto,
count(pedidos.produto_id) as total_de_pedidos,
sum(pedidos.quantidade) as unidades_vendidas
from produtos
left join pedidos on pedidos.produto_id = produtos.id
group by produtos.nome;

--  18. Calcular a média de quantidade de produtos por pedido
select AVG(pedidos.quantidade) as quantidade_media_por_pedido
from pedidos;

--  19. Listar os pedidos ordenados por data (mais recentes primeiro)
select pedidos.data_pedido as data,
	   pedidos.id as pedido_id
from pedidos
order by data DESC;

--  20. Contar quantos clientes possuem telefone cadastrado
select count(clientes.id) as telefones_cadastrados
from clientes
where clientes.telefone IS NOT NULL;

--  21. Encontrar o cliente que gastou mais dinheiro em pedidos.
select 
cliente.nome as cliente,
sum(pedidos.quantidade * produtos.preco) as qnt_gasto_pedidos
from clientes
left join pedidos on pedidos.cliente_id = clientes.id
left join produtos on pedidos.produto_id = produtos
group by clientes.nome
order by qnt_gasto_pedidos DESC
LIMIT 1;

--  22. Listar os 5 produtos mais vendidos.
select produtos.nome as produto,
	sum(pedidos.quantidade) as vendidos
from produtos 
left join pedidos on pedidos.produto_id = produtos.id
group by produtos.nome
order by vendidos DESC
LIMIT 5;

--  23. Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
select clientes.nome as cliente,
count(pedidos.cliente_id) as qnt_pedidos
from clientes
join pedidos on pedidos.clientes = clientes.id
group by clientes.nome;

--  24. Encontrar a data com mais pedidos realizados
select distinct 
pedidos.data_pedido AS data_pedido,
count(pedidos.data_pedido) as quantidade_pedidos
from pedidos
group by pedidos.data_pedido
order by quantidade_pedidos DESC
LIMIT 1;

--  25. Calcular a média de valor gasto por pedido
select 
AVG(soma_preco) as media_por_pedido 
from 
(select pedidos.id as pedido_id, 
SUM(produtos.preco * pedidos.quantidade) as soma_preco 
from 
pedidos 
join produtos on pedidos.produto_id = produtos.id
group by 
pedidos.id, produtos.preco) as valores_pedidos;