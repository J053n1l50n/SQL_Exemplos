use informatica;
/*CONDICIONAL*/

-- Filtrar campo numerico
select nome, limite_credito from cliente where limite_credito>5000;

-- Filtrar campo texto
select nome, limite_credito from cliente where nome="João";
select nome, limite_credito from cliente where nome like "Jo%";

-- Filtrar por campo boleano
select nome, email from cliente where cadastro_ativo = true; -- 0=false, 1=true

-- Filtrar por campo de data
select nome from cliente where data_nascimento > '1990-01-01'; -- AAAA-MM-DD

select nome, data_nascimento from cliente where year(data_nascimento) > 1990;   -- Year, Month, Day

select * from cliente;