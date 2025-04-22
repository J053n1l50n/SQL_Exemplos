use restaurante;
-- 2
select nome, categoria from produtos where preço>30;
-- 3
select nome, telefone, data_nascimento from clientes where year(data_nascimento) < 1985;
-- 4
select id_produto, ingredientes from info_produtos where ingredientes like "%carne%";
-- 5
select nome, categoria from produtos order by categoria, nome;
-- 6
select nome, preço from produtos order by preço desc limit 5;
-- 7
select nome from produtos where categoria ="Prato Principal" limit 2 offset 6;
-- 8
create table backup_pedidos as select * from pedidos;
select * from backup_pedidos;
