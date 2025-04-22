create database informatica; 
 use informatica;
 create table cliente(
  id int primary key,
  endereço varchar(50),
  nome varchar(20) 
 );
show tables;

alter table cliente drop endereço;

alter table cliente add data_nascimento date;

drop table cliente;