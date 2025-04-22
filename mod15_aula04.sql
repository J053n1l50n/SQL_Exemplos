/*sub consultas
uso: quando não é possivel resolver o problema é uma unica consulta; fora pra simplificar a logica*/

use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- subconsulta no WHERE
select nome
from cliente
where id_cliente in(select id_cliente from pedido);

select distinct c.nome
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente; -- join traz em ordem alfabetica, para um melhor desenpenho é recomendado escolher o Join ao inves de uma subconsulta, apenas no caso de subconsultas possiveis de serem trocadas

select nome, email
from cliente
where id_cliente in(select id_cliente from pedido where quantidade > 5); 

-- subconsulta no select
select nome, 
		(select count(*) from pedido where pedido.id_cliente=cliente. id_cliente) as total_pedidos
from cliente;

select c.nome, c.email,
		(select sum(pe.quantidade*pr.preco)
        from pedido pe
        join produto pr on pe.id_produto=pr.id_produto
        where pe.id_cliente=c.id_cliente)as total_pedidos
	from cliente c order by total_pedidos desc;
    
-- subconsulta no having

select categoria, round(avg(preco), 2) as media_preco
from produto
group by categoria
having avg(preco) > (select avg(preco) from produto);

-- subconsulta no from

select cl.nome, pedidos_agregados.total_pedidos, pedidos_agregados.soma_quantidade
from cliente cl
join(select id_cliente, count(*) as total_pedidos, sum(quantidade) as soma_quantidade
	from pedido
	group by id_cliente
)as pedidos_agregados on cl.id_cliente=pedidos_agregados.id_cliente;

-- subconsulta no order by

select c.nome, c.email
from cliente c
order by(
		select sum(pe.quantidade*pr.preco)
        from pedido pe
        join produto pr on pe.id_produto=pr.id_produto
        where pe.id_cliente=c.id_cliente
        )desc;