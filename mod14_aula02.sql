use loja_informatica;
/*funções de agregação*/

select * from  cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;
-- contagem
select count(*) from pedido; -- em alguns BDs o 1 pode dar diferença do *, pois 1= true registre
select count(quantidade) from pedido;
select count(id_pedido) from pedido; -- diferente do * onde conta as linhas, usar o ID_tabela verifica se algum campo é nulo
select count(distinct id_cliente) from pedido; -- distinct= valores unicos

select sum(quantidade) from pedido;
select avg(quantidade) from pedido;

select max(preco) from produto;
select min(preco) from produto;

select var_pop(preco) from produto; -- variancia populariconal= vartance()
select var_samp(preco) from produto; -- variancoa amostral

select stddev(preco) from produto; -- Desvio padrão = stddev_pop;  desvio padrão amostral = stddev_samp

select group_concat(distinct quantidade) from pedido;

select nome, preco, rank() over (order by preco desc) as ranking_preco from produto;
select nome, preco, row_number() over (order by preco desc) as ranking_preco from produto;-- numeros sequencias
select nome, preco, dense_rank()over(order by preco desc) as ranking_preco from produto;-- conta valores iguais e coloca na mesma posição do rank
select distinct nome, preco, dense_rank() over (order by preco desc) as ranking_preco from produto;