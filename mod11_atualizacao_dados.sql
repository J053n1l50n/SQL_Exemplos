use informatica;

select * from cliente;


-- atualizar um campo
update cliente set email ="marcos_novo@email.com" where id_cliente=1;

-- atualizar multiplos campos
update cliente
set data_nascimento ='1975-04-10', limite_credito =1000 where id_cliente=2;

-- atualizar com operadores matemáticos

update cliente
set limite_credito= limite_credito + 500 where id_cliente =3;

-- atualizar com condições complexas
update cliente
set cadastro_ativo =false
where limite_credito <=1000 and data_nascimento < '1980-01-01';

-- problemas de atualização
set SQL_SAFE_UPDATES =0;

-- atualizar todos os registros de uma columa
update cliente
set info_adicionais ="revisão de cadastro";