use informatica;
show create table cliente;

describe cliente;


-- alteração de adição e remoção de coluna
alter table cliente add column endereco varchar(255);
alter table cliente add  cidade varchar(255);
alter table cliente drop column endereco;
alter table cliente add unique(email);

/*alteração de colunas existentes*/

alter table cliente modify nome varchar(150); -- modificar o tipo da tabela
alter table cliente change nome nome_completo varchar(255);
alter table cliente alter cidade set default "Não informado"; -- adicionar algo no campo

/*alterações de chave [cuidado]*/

alter table cliente modify id_cliente int;
alter table cliente drop primary key;
alter table cliente add primary key(id_cliente);

create table prouto(id_produto int primary key);
alter table cliente add foreign key (id_produto) references produto(id_produto);

-- renomear tabela
alter table cliente rename to clientes_antigos;

-- remover tabela
drop table clientes_antigos; #não usar
drop table if exists clientes_antigos;