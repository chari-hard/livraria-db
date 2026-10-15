-- 1. WHERE: Listar livros com preço superior a 50 reais
SELECT titulo, preco FROM livro WHERE preco > 50.00;

-- 2. LIKE: Buscar clientes cujo nome começa com 'Ana'
SELECT * FROM cliente WHERE nome LIKE 'Ana%';

-- 3. BETWEEN: Listar pedidos feitos em um intervalo de datas
SELECT * FROM pedido WHERE data_pedido BETWEEN '2026-09-01' AND '2026-09-10';

-- 4. ORDER BY: Listar livros ordenados do mais caro para o mais barato
SELECT titulo, preco FROM livro ORDER BY preco DESC;

-- 5. INNER JOIN: Listar os pedidos com o nome dos respectivos clientes
SELECT p.id_pedido, p.data_pedido, c.nome AS cliente, p.status_pedido 
FROM pedido p 
INNER JOIN cliente c ON p.id_cliente = c.id_cliente;

-- 6. INNER JOIN + WHERE: Listar livros da categoria 'Tecnologia'
SELECT l.titulo, l.preco, c.nome_categoria 
FROM livro l 
INNER JOIN categoria c ON l.id_categoria = c.id_categoria 
WHERE c.nome_categoria = 'Tecnologia';

-- 7. SUM: Calcular a quantidade total de itens vendidos
SELECT SUM(quantidade) AS total_itens_vendidos FROM item_pedido;

-- 8. GROUP BY + SUM: Quantidade total vendida agrupada por livro
SELECT id_livro, SUM(quantidade) AS total_vendido 
FROM item_pedido 
GROUP BY id_livro;

-- 9. GROUP BY + COUNT: Quantidade de pedidos realizados por cliente
SELECT id_cliente, COUNT(*) AS total_pedidos 
FROM pedido 
GROUP BY id_cliente;

-- 10. INNER JOIN Múltiplo: Detalhes completos dos itens (Cliente, Livro, Quantidade)
SELECT p.id_pedido, c.nome AS cliente, l.titulo AS livro, ip.quantidade, l.preco 
FROM item_pedido ip
INNER JOIN pedido p ON ip.id_pedido = p.id_pedido
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN livro l ON ip.id_livro = l.id_livro;

-- 11. MAX: Encontrar o livro mais caro do sistema
SELECT titulo, preco FROM livro WHERE preco = (SELECT MAX(preco) FROM livro);

-- 12. AVG: Calcular a média de preço dos livros na livraria
SELECT AVG(preco) AS media_preco FROM livro;

-- 13. GROUP BY + HAVING: Categorias que possuem estoque total maior que 10
SELECT id_categoria, SUM(estoque) AS estoque_total 
FROM livro 
GROUP BY id_categoria 
HAVING SUM(estoque) > 10;

-- 14. WHERE + IN: Listar clientes que moram em São Paulo ou Rio de Janeiro
SELECT * FROM cliente WHERE cidade IN ('São Paulo', 'Rio de Janeiro');

-- 15. INNER JOIN + SUM + GROUP BY: Faturamento total gerado por cliente
SELECT c.nome AS cliente, SUM(ip.quantidade * l.preco) AS faturamento_total 
FROM item_pedido ip
INNER JOIN livro l ON ip.id_livro = l.id_livro
INNER JOIN pedido p ON ip.id_pedido = p.id_pedido
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente;

select * from livro
