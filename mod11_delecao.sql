use informatica;

select * from cliente;

-- deletar um registro
delete from cliente where id_cliente=4;

-- deletar registros com condições múltiplas
delete from cliente where cadastro_ativo=false and limite_credito <2000;

-- deletar todos os registros:

delete from cliente;
truncate table cliente;