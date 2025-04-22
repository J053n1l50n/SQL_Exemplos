

use informativa;

create table cliente(
	id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    email varchar(100),
    data_nascimento date,
    limite_credito decimal(10, 2),
    info_adicionais text,
    cadastro_ativo boolean default 1,
    id_produto int,
    -- foreign key(id_produto) references produto(id_produto) :chave estrangeira
    unique(email)

)comment="TABELA DE CLIENTES DE INFORMATICA";

drop table cliente;

drop table clientes_antigos; -- derrubei a coluna
