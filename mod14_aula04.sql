use loja_informatica;
/*filtrando agregações*/
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

select categoria, count(*) from produto group by categoria;
select categoria, count(*) from produto group by categoria having count(*)>10; -- having filtrar dentro do filtro

select categoria, count(*) from produto where categoria <> 'AcessÃ³rios' group by categoria;

select categoria, count(*) from produto where categoria<>'AcessÃ³rios' group by categoria having count(*)>10; -- where=linha, having=grupo, deve trabalhar com where pelo volume de dados
select categoria, count(*) from produto group by categoria having count(*) > 10 and categoria <>'AcessÃ³rios';-- esse segundo faz o mesmo do primeiro, porem é mais pessado por precisssar processar mais dados

-- Identificar quais produtos foram vendidos mais de uma vez com erro (quantidade=0)
select quantidade from pedido;

select  quantidade, count(*) from pedido where quantidade is null group by quantidade having count(*) = null;

select * from pedido where quantidade is null;

select id_produto, count(id_produto) from pedido where quantidade is null group by id_produto having count(id_produto) > 1;

/*usar o Having que requerem as funções de agregação, quando não precisa é o where*/