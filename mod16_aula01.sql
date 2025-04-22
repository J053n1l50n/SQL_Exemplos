/*Consulta avançada
*/
use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- view para simplificar a tabela Cliente(como se fosse uma tabela, porém com colunas limitadas)
create view cliente_simples as 
select id_cliente, nome, email
from cliente;

-- consultar view
select * from cliente_simples limit 10;

-- visualizae estrutura da View
show create view cliente_simples;
show create table cliente;
desc cliente_simples;

-- pode manipular dados iguais a tabelas(UPDATE, INSERT e DELETE)

-- atualizar View
create or replace view cliente_simples as
select id_cliente, nome, cidade
from cliente;

select * from cliente_simples limit 10;

-- deletar view
drop view cliente_simples;

-- view para calcular o total de pedidos feitos por cada cliente
create view cliente_pedido_total as 
select c.nome, count(pe.id_pedido) as total_pedidos
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
group by c.nome;

select * from cliente_pedido_total where total_pedidos > 15;

-- view para Listar Detalhes do Cliente e Total Gasto
create view cliente_gasto_total as
select c.nome, c.email, sum(p.preco * pe.quantidade) as total_gasto
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente
join produto p on pe.id_produto = p.id_produto
group by c.nome, c.email;

select * from cliente_gasto_total where total_gasto > 500;
