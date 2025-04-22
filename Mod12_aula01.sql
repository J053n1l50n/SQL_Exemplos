use informatica;

desc cliente;

truncate cliente;

insert into cliente values 
	(null, 'Marcos', "marcos@email.com", '1991-01-05', 8000.00, null, true, 2),
    (null, 'Carol', "carol@email.com", '1998-02-26', 5500, null, true, 1),
    (null, 'ana', "ana@email.com", '1980-05-28', 10000.00, 'Revisão de cadastro', true, 1),
    (null, 'João', "joao@email.com", '1995-10-14', 5500.00, "inativo", false, null),
    (null, 'Thiago', "thiago@email.com", '2001-08-20', 4600, null, true, 1);
    
-- selecionar todas as coulnas da tabela
select* from cliente;

-- selecionar colunas especificas.
select data_nascimento, nome, email from cliente;

-- criar tabela a partir da seleção de dados(backup*)

create table backup_cliente as select * from cliente;

desc cliente;
desc backup_cliente;

-- inserir registros a partir da seleção de dados ()

truncate backup_cliente;
select * from backup_cliente;
insert into backup_cliente select * from cliente; -- para pegar as informações e restrições da tabela mãe para o backup
select * from backup_cliente;

