/*In, Between e Like*/
use informatica;

-- in(pega valores especificos) usar ao inves de < ou > para melhor performace
SElect * from cliente;

select * from cliente where id_cliente in (1,2,4,6);

select * from cliente where year(data_nascimento) in (1991, 1995);

-- between(pega intervalos especificos)

select * from cliente where data_nascimento between '1990-01-01' and '2000-12-31'; -- não se trabalha com OR por ter de validar os dois valores

select * from cliente where limite_credito between 6000 and 10000;

-- like
select * from cliente where info_adicionais like 'revisao%';

select * from cliente where info_adicionais like "%cadastro"; -- computacionalmente custoso, somente usar quando não sobre o que esta no inicio

select* from cliente where email like "%@%.com";

insert into cliente (nome, email, data_nascimento, info_adicionais) values ('a', 'a@a.com', '1990-10-10', ''); -- cadastro incorreto

select * from cliente where email like '___%@__%.com'; -- usar NOT para pegar cadastro falso, para o underline é usado pra saber se o cadastro possui mais que x caracteres

select * from cliente where email like '____@email.com';

select * from cliente where email like '___@_email.com' or email like "___@__mail.com";

select * from cliente
where (nome like "a%" or nome like "b%" or nome like "c%") and cadastro_ativo = true;