use loja_informatica;
/*agrupamento dos dados*/

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

select sum(preco) as preco_total from produto;
select sum(preco) as preco_total from produto group by categoria; -- parcido com agregação já setada, coloque group by pra agrupar
select categoria, sum(preco) as preco_total from produto group by categoria; -- necessario selecionar a coluna pra ver as linhas separadas
select categoria, nome, sum(preco) as preco_total from produto group by categoria, nome order by categoria, nome; -- trabalhar com mais de uma coluna

select categoria, avg(preco) as media_preco from produto group by categoria; -- media mostra valor quebrado
select categoria, round(avg(preco),2) as media_preco from produto group by categoria order by categoria; -- ROUND=arrendodar pois a , são casas decimais

select 
	distinct nome,
    preco,
    dense_rank() over(order by preco desc) as ranking_preco
from
produto;-- trocar a categoria

select 
	categoria, 
    sum(preco) as preco_total,
    rank() over(order by sum(preco) desc) as ranking_preco
from 
produto
group by
categoria;