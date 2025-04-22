use informatica;

drop table cliente;

create table if not exists cliente(
	id_cliente int auto_increment primary key,
	nome varchar(255) not null,
	email varchar(100),
	data_nascimento date,
	limite_credito decimal(10,2),
	info_adicionais text,
    cadastro_ativo boolean default true,
    id_produto int,
    unique(email)

)comment="tabela clientes de infomatica";

-- selecionar tabela

select* from cliente;

-- inserir 1 registro

insert into cliente(nome, email, data_nascimento, limite_credito) values ("marcos", "marcos@email.com", "1991-01-05", 8000.00);

insert into cliente(nome) values('pedro');

-- inserir multiplos registros(mais eficiente)

insert into cliente(nome, email, data_nascimento, limite_credito)values
					("ana", "ana@gmail.com", "1980-05-28", 10000.00),
					('João', "joão@email.com", '1995-10-14', 5500.00);

-- inserir registro sem especificar os campos, isso quando você quer colocar todos os campos
insert into cliente values(null, "thiago", 'thiago@email.com', '1995-08-20', 4600, null, true, 1);
