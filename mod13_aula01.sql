/*Filtros Condicionais*/

use informatica;

-- and, or e Not

select * from cliente;

select * from cliente
Where cadastro_ativo = true and limite_credito >6000; -- o uso da variavel e

select * from cliente where cadastro_ativo = true or limite_credito >6000; -- uso da variavel ou

select * from cliente
where limite_credito >6000 and year(data_nascimento) > 1980; -- uso da variavel E

select * from cliente
where cadastro_ativo = true or limite_credito > 6000 and year(data_nascimento) > 1980;

select * from cliente
where cadastro_ativo = true or (limite_credito > 6000 and year(data_nascimento) > 1980); -- Testar() 

select * from cliente
where (cadastro_ativo = true or limite_credito > 6000) and year(data_nascimento) > 1980;

select * from cliente where not limite_credito > 6000; -- retornar o que esta fora da consulta

select * from cliente
Where not cadastro_ativo = true or limite_credito >6000; -- so vai alterar cadastro_ativo

select * from cliente
Where not (cadastro_ativo = true or limite_credito >6000); -- altera as duas condições

