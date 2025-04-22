use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- left join
select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente=pe.id_cliente;

-- right join
select c.nome, pe. id_pedido
from cliente c
right join pedido pe on c.id_cliente=pe.id_cliente;

-- full join(comando não existente no sql, então une o left com right, union junta duas funções, desde que o select tenha mesmos campos)
select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null
union
select c.nome, pe. id_pedido
from cliente c
right join pedido pe on c.id_cliente=pe.id_cliente
where c.id_cliente is null;

-- com três ou mais tabelas

select c.nome as cliente, p.nome as produto, pe.quantidade
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto
union
select c.nome as cliente, p.nome as produto, pe.quantidade
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente
right join produto p on pe.id_produto = p.id_produto;

-- natural join
select *
from pedido
natural join produto; -- não recomendado
/*vai fazer um join automaticamente, contatena apagando as columas automanticamente*/

-- self join

-- compara clientes dentro da mesma cidade, excluindo comparações do mesmo cliente

select
	c1.nome as cliente1,
    c2.nome as cliente2,
    c1.cidade as CidadeComun
from
	cliente c1
join
	cliente c2 on c1.cidade=c2.cidade and c1.id_cliente != c2.id_cliente
order by
	c1.cidade, c1.nome, c2.nome;
    
