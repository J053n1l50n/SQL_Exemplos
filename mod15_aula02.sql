/*OUTER JOIN
left join=right join
*/
use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- inner join: visualizar clientes com pedidos
select c.nome, pe.id_pedido as pedidos
from cliente c
inner join pedido pe on c.id_cliente = pe.id_cliente;

-- left outer join: visualizar todos os clientes, incluindo aqueles sem pedidos
select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente;

-- right outer join: visualizar todos os pedidos, incluindo aqueles sem clientes
select c.nome, pe.id_pedido
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente;


-- left outer join: visualizar os clientes sem pedidos
select c.*
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null;

-- left outer join: visualizar todos os clientes, com seus pedidos e produtos, incluindo aqueles sem pedidos e produtos
select c.nome, pe.id_pedido, p.nome as produto
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto;

-- calcula o total gasto por cada cliente em seus pedidos
select c.nome, sum(p.preco * pe.quantidade) as total_gasto
from cliente c
inner join pedido pe on c.id_cliente = pe.id_cliente
inner join produto p on pe.id_produto = p.id_produto
group by c.nome;

-- visualizar quais clientes não gastaram em seus pedidos (erro)
select c.nome, sum(p.preco*pe.quantidade) as total_gast
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto
where p.preco is null
group by c.nome;