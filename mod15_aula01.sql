use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- inner join entre cliente e pedido
select cliente.nome, cliente.email, pedido.id_pedido from cliente  -- para especiicar a tabela = nomeDaTabela.nomeDaColuna
inner join pedido
on cliente.id_cliente = pedido.id_cliente; -- ligação entre tabelas, use naquelas colunas que existe em ambas as colunas e podem ser coorelacionadas

-- inner join entre pedido e produto
select pedido.id_pedido, produto.nome, produto.preco, pedido.quantidade
from pedido
inner join produto
on pedido.id_produto = produto.id_produto;

-- inner join entre as três tabelas
select cliente.nome as cliente, produto.nome as produto, produto.preco, pedido.quantidade, pedido.data
from cliente
inner join pedido on cliente.id_cliente = pedido.id_cliente
inner join produto on pedido.id_produto = produto.id_produto;

-- usando ALIAS(apelido) para as tabelas
select c.nome as cliente, p.nome as produto, p.preco, pe.quantidade, pe.data
from cliente c 
inner join pedido pe on c.id_cliente = pe.id_cliente
inner join produto p on pe.id_produto = p.id_produto
where p.preco>1000
group by p.nome, c.nome, p.preco, pe.quantidade, pe.data
order by c.nome, p.preco desc; -- para filtrar e agregar tem de ser feito após do inner join
/* pode usar o nome da tabela, na frente da tabela voce pode colocar pra referencia ex: Tabela T*, é aconselhado usar poucas letras para reduzir a quantidade de texto de uma tabela/