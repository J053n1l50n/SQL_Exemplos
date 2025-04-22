use restaurante;

-- 1: mostrar o ID, nome e descrição dos produtos e os ingredientes do info_produtos
select p.id_produto, p.nome, p.descricao, ip.ingredientes 
from produtos p
inner join info_produtos ip on p.id_produto = ip.id_produto;

-- 2: Mostrar o id, quantidade e data dos pedidos e nome e e-mail dos clientes
select c.nome, c.email, pe.id_cliente, pe.quantidade, pe.data_pedido
from clientes c
join pedidos pe on pe.id_cliente = c.id_cliente;

-- 3:Mostrar a mesma coisa do anterior, agora mostrando o nome dos funcionarios
select c.nome, c.email, pe.id_cliente, pe.quantidade, pe.data_pedido, f.nome as Funcionario
from clientes c
join pedidos pe on pe.id_cliente = c.id_cliente
join funcionarios f on f.id_funcionarios = pe.id_funcionarios;

-- 4: Mostrar a mesma coisa do anterior, agora com nome e preço dos produytos
select c.nome, c.email,
 pe.id_cliente, pe.quantidade, pe.data_pedido,
 f.nome as Funcionario,
 p.nome as Produto, p.preço
 from clientes c
 join pedidos pe on pe.id_cliente =c.id_cliente
 join funcionarios f on pe.id_funcionarios=f.id_funcionarios
 join produtos p on pe.id_produto=p.id_produto;
 
 -- 5: selecionar o nome dos clientes com pedidos pendentes, mostrando em ordem descendente de acordo com o pedido
 select c.nome, pe.Estatus
 from clientes c
 join pedidos pe on pe.id_cliente=c.id_cliente
 where pe.Estatus = 'Pendente'
 order by pe.id_pedido desc;
 
 -- 6: Mostrar clientes sem pedidos
 
select c.nome
from clientes c 
left join pedidos pe on pe.id_cliente=c.id_cliente
where pe.id_pedido is null;

-- 7: mostrar o nome e total dos pedidos de cada cliente

select c.nome, pe.total_pe
from clientes c
left join (select id_cliente, count(*) as total_pe from pedidos group by id_cliente) 
as pe on pe.id_cliente = c.id_cliente;
select * from produtos;
-- 8: selecionar o preço total de cada pedido
/*
select distinct c.nome as Cliente, p.id_pedido, p.preço
(select sum(p.quantidade*pr.preço)
 from pedidos p
 right join produtos pr on p.id_produto = pr.id_produto
 where p.id_cliente=c.id_cliente)as preco_total
 from clientes c 
 right join pedidos p on p.id_cliente=c.id_cliente
 order by preco_total desc;
 */
 


select pe.id_pedido, c.nome as cliente, pe.quantidade, pr.preço, (pe.quantidade * pr.preço) as preco_total
from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente
join produtos pr on pe.id_produto = pr.id_produto
order by preco_total desc;