/* Agregações*/

-- preparando o BD

create database loja_informatica;

use loja_informatica;

create table if not exists cliente(
	id_cliente int primary key,
    nome varchar(200),
    email varchar(100),
    cidade varchar(100)
);

create table if not exists produto(
	id_produto int primary key,
    nome varchar(200),
    categoria varchar(100),
    preco decimal(10, 2)
);

create table if not exists pedido(
	id_pedido int primary key,
    id_cliente int,
    id_produto int,
    quantidade int,
    data Date,
    foreign key(id_produto) references produto(id_produto),
    foreign key(id_cliente)references cliente(id_cliente)
);

select* from backup_cliente limit 10;
select * from backup_produto limit 10;
select * from backup_pedido limit 10;


insert into cliente select * from backup_cliente;
insert into produto select * from backup_produto;
insert into pedido select * from backup_pedido;-- errado
insert into pedido
select id_pedido, id_cliente, id_produto, quantidade, str_to_date(data, '%d/%m/%Y') from backup_pedido; -- str_to_date server para converter texto para o formato da data

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;
