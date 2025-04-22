use restaurante;

-- Item 2: Ver quantos pedidos tem:
select count(id_pedido) from pedidos;

-- Item 3: contar os clientes unicos que fizeram os pedidos
select count(distinct id_cliente) from pedidos where Estatus is not null;

-- item 4: calcular a media de preço dos produtos
select round(avg(preço)) as Media_De_preços from produtos;

-- item 5: ver o Minimo e Maximo dos preços do produto
select min(preço) as minimo from produtos;
select max(preço) as Maximo from produtos;

-- item 6: selecionando os 5 pedidos mais caros e dando os nomes deles
select distinct nome, preço, dense_rank() over(order by preço desc) as os_careios from produtos limit 6;

-- item 7: ver a media de preço agrupados por categoria
select categoria, round(avg(preço),2) as preco from produtos group by categoria; 

-- item 8: ver os fornecedores e quantidade de produtos 
select fornecedor, count(id_produto) as quant from info_produtos group by fornecedor;

-- item 9: ver fornecedores com mais de um produto cadastrado
select fornecedor, count(id_produto) as quant from info_produtos group by fornecedor having count(id_produto)>1;

-- item 10:mostrar os clientes que fizeram apenas um pedido
select nome, count(id_cliente) from clientes  group by nome having count(id_cliente) =1 order by nome;