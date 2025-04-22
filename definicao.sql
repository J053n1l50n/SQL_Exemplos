create database restaurante;
use restaurante;


-- colunas importantes definir que não sejam nulas

create table funcionarios(
id_funcionarios int primary key auto_increment,
nome varchar(255) not null,
cpf varchar(14) not null,
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100) ,
cargo varchar(100) not null,
salario decimal(10, 2),
data_admissao date,
unique(cpf)
);

create table clientes(
id_cliente int primary key auto_increment,
nome varchar(255) not null,
cpf varchar(14) not null,
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
data_cadastro date,
unique(cpf)
);

create table produtos(
id_produto int primary key auto_increment,
nome varchar(255) not null,
descricao text,
preço decimal(10,2),
categoria varchar(100) not null
);

create table pedidos(
id_pedido int primary key auto_increment,
id_cliente int,
id_funcionarios int,
id_produto int,
 foreign key (id_cliente) references clientes(id_cliente),
 foreign key (id_funcionarios) references funcionarios(id_funcionarios),
 foreign key (id_produto) references produtos(id_produto),
quantidade int,
preco decimal(10,2),
data_pedido date, 
Estatus varchar(50) 
);



create table info_produtos(
id_info int primary key auto_increment,
id_produto int,
	foreign key (id_produto) references produtos(id_produto),
ingredientes text,
fornecedor varchar(255) not null
);