use informatica;

select * from cliente;

select * from cliente where info_adicionais is null;

select * from cliente where info_adicionais is not null;

select * from cliente 
where limite_credito > 5000 and (info_adicionais is null or id_produto is null);

select nome, ifnull(limite_credito, 0) as limite_credito from cliente;

select nome, info_adicionais, ifnull(info_adicionais, "nada consta") as info_adicionais_tratada from cliente; -- SE info_adicionais for nulo, devolve o "nada consta"/

select nome, info_adicionais, nullif(info_adicionais, "inativo") as info_adicionais_tratada from cliente; -- se info_adicionais for igual a "inativo" ele devolve o nulo

select nome, info_adicionais, nullif(info_adicionais, ' ') as info_adicionais_tratada from cliente;

select nome, ifnull(nullif(info_adicionais, ' '), 'nada consta') as info_adicionais from cliente;

select nome, coalesce(info_adicionais, 'nada consta') from cliente;

select nome, coalesce(email, info_adicionais, limite_credito, id_produto, 'Cadastro nulo') from cliente;-- verificar todos os elementos de uma lista(que esta em pareteces), usado numa serie de campos estão nulos.

select nome, info_adicionais, coalesce(info_adicionais, 'não consta') as info from cliente;

-- tratar espaços em branco

select '        Remover Espaços       ', trim('        Remover Espaços         '); -- select não precisa colocar um campo, é possivel colocar um texto pra exibir

select nome, info_adicionais from cliente where info_adicionais <> trim(info_adicionais);

select * from cliente 
where nullif(trim(info_adicionais), ' ') is null;

select * from cliente
where nullif(info_adicionais, ' ') is null;