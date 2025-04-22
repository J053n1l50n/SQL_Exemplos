use restaurante;

-- 1°item: criando uma view  com id, quantidade e data em pedido, nome e e-mail do cliente, nome dos funcionarios, nome e preço dos produtos 
create view resumo_pedido as
	select  p.id_pedido, p.quantidade, p.data_pedido, c.nome as cliente, c.email, f.nome as funcionarios, pr.nome, pr.preço 
	 from pedidos p
     join clientes c on p.id_cliente=c.id_cliente
     join funcionarios f on p.id_funcionarios=f.id_funcionarios
     join produtos pr on p.id_produto=pr.id_produto
	group by p.id_pedido;
    
-- 2°item: selecionando nome do cliente, id do pedido e o total de pedidos
select id_pedido,nome as cliente,sum(preço*quantidade)as total
from resumo_pedido
group by id_pedido;

-- 3°item: atualizando o total na views
create or replace view resumo_pedido as
select  p.id_pedido, p.data_pedido, c.nome as cliente, c.email, f.nome as funcionarios, pr.nome, pr.preço, sum(pr.preço*p.quantidade)as total 
	 from pedidos p
     join clientes c on p.id_cliente=c.id_cliente
     join funcionarios f on p.id_funcionarios=f.id_funcionarios
     join produtos pr on p.id_produto=pr.id_produto
	group by p.id_pedido;
    
select * from resumo_pedido;

-- 4°item: Adicionando o total adicionado
create or replace view resumo_pedido as
select  p.id_pedido, p.data_pedido, c.nome as cliente, c.email, f.nome as funcionarios, pr.nome, pr.preço, sum(pr.preço*p.quantidade)as total, (sum(pr.preço*p.quantidade)-pr.preço)as total_adicionado 
	 from pedidos p
     join clientes c on p.id_cliente=c.id_cliente
     join funcionarios f on p.id_funcionarios=f.id_funcionarios
     join produtos pr on p.id_produto=pr.id_produto
	group by p.id_pedido;
    
-- 5°item: compreendendo a query
explain
select * from resumo_pedido order by id_pedido;

-- 6°item: criar função BuscaIngredientesProduto para ver os ingredientes da tabela info_produtos pegando a id de produto como entrada
delimiter //
create function BuscaIngredientesProduto(infoID int)
returns text
reads sql data
	begin
      declare nomeIngrediente text;
      select ingredientes into nomeIngrediente 
      from info_produtos
      join produtos on  info_produtos.id_produto=produtos.id_produto
      where produtos.id_produto=infoID;
      return nomeIngrediente;
    end //
delimiter ;

-- 7°item: vendo o id 10 nessa função
select BuscaIngredientesProduto(10);

-- 8°item: criando a função mediaPedido pra ver se o total do pedido é acima, abaixo, ou igual a medida de todos os pedidos, claro vendo o ID do pedido como argumento dessa função

delimiter %
create function mediaPedido(pedeID int)
 returns varchar(100)
 reads sql data
 begin
	declare total decimal(10,2);
    declare resposta varchar(100);
    declare med decimal(10,2);
    /*aqui soma o total dos pedidos*/
		select coalesce(sum(p.preço*pe.quantidade),0) into total
			from produtos p
            join pedidos pe on p.id_produto=pe.id_produto
            where p.id_produto= pedeID;
            
            /*aqui tive uma dificuldade tremenda, pois pensei em colocar numa unica seleção, dai tive ajuda por ia pra corrigir minha percepção, p.s: eu escrevi esse codigo abaixo; aqui fazemos a media para comparação*/
		select avg(totalGeral) into med
        from(select coalesce(sum(p.preço*pe.quantidade),0) as totalGeral
			from produtos p
            join pedidos pe on p.id_produto=pe.id_produto
            group by pe.id_produto) as mediana;
         /*aqui vai a validação*/   
		set resposta=
         case
          when total=med then "a media"
			when total >med then "Acima da media"
            else "abaixo da media"
            end;
		return resposta;
        
end %
delimiter ;

-- 9°Motivo: vendo a função funcionar mostrando ids 5 e 6
select  mediaPedido(5);
select  mediaPedido(6);