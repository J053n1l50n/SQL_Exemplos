use informatica;
/*ordenação*/

-- ordenar por ordem ascendente(Alfabetica)
select nome from cliente order by nome;

-- ordenar por ordem decrecente
select nome, data_nascimento from cliente order by data_nascimento desc;

-- ordenar por mais de um campo
select nome, limite_credito from cliente order by limite_credito desc, nome asc;

/*Limitação*/

 -- selecionar um registro(Boa pratica)
 select * from cliente limit 1;
 
 -- selecioanr os 3 clientes com mais limite de crédito
 select nome, limite_credito from cliente order by limite_credito desc limit 3;
 
 -- pular  os primeiros 3 registros e selecionar os proximos 2:
 select nome from cliente order by nome limit 2 offset 3;
 