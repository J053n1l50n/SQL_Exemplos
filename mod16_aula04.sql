use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- utilizar ALIAS simples e facil de entender(definir um padrão para ALIAS)
select pe.id_pedido, c.nome as nome_cliente, p.nome as nome_produto, round(coalesce(p.preco*pe.quantidade,0),2) as valor_total
from cliente c
join pedido pe on pe.id_cliente = c.id_cliente
join produto p on pe.id_produto=p.id_produto;

-- evitar o uso do SELECT *
select nome, email from cliente;
select
	c.nome,
    c.email
from cliente c;


-- usar EXPLAIN para otimizar consultas e indices(types: ref para indices não unicos e eq_ref para indices unicos)
explain
select c.nome, c.email,
		(select sum(pe.quantidade*pr.preco)
        from pedido pe
        join produto pr on pe.id_produto=pr.id_produto
        where pe.id_cliente =c.id_cliente) as total_pedidos
from cliente c
order by total_pedidos desc;

explain
select c.nome, c.email, sum(pe.quantidade*pr.preco)as totalPedidos
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto pr on pe.id_produto = pr.id_produto
group by c.id_cliente, c.nome, c.email
order by totalPedidos desc;

explain
select c.nome, c.email, sum(pe.quantidade*pr.preco) as total_pedidos
from cliente c
join pedido pe on c.id_cliente=pe.id_cliente
join produto pr on pe.id_produto=pr.id_produto
group by c.id_cliente, c.nome, c.email
order by total_pedidos desc;

create index idx_pedido_produto on pedido(id_produto); -- criação de Indice(pode colocar quantos indexes quisser, normalmente usando em consultas com  WHERE ou ORDER BY, use com moderação pois pode gerar peso nas consultas)
drop index idx_pedido_produto on pedido; -- deletar indices

-- Evitar funções em colunas no Where
select * from pedido where month(data)=1; -- ineficiente

select * from pedido where data between '2023-01-01' and '2023-01-31'; -- mais eficiente

-- Uso de transações para garantir integridade e a confiabilidade nos dados

-- iniciar transação
start transaction;

insert into cliente (id_cliente, nome, email, cidade) values(101, 'Rodrigo Augusto', 'rodrigo.augusto@email.com', 'São José dos campos');
insert into pedido (id_pedido, id_cliente, id_produto, quantidade, data) values(203,101,7,3,'2023-11-27');

-- confirmar as operações
	
commit;
-- reverter as operações
rollback;

select * from cliente where id_cliente="101";
select * from pedido where id_pedido='203';
