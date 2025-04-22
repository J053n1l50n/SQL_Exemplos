/*sempre que há necesidade de retorno de valor, evitar logicas repetitivas, sempre usar em tarefas de leitura*/
use loja_informatica;
select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- função para retornar o nome de um cliente com base no seu ID
delimiter //
create function BuscaClienteNome(idCliente int) /*um procedimento é necessario definir as variaves de entrada e saida, a função não*/
returns varchar(200) -- todavia, para função é necessario definir o retorno e o tipo das variaveis, no procedimento não é necessario isso
reads sql data -- pode ser UPDATE tbm
begin
	declare nomeCliente varchar(200);
    select nome into nomeCliente from cliente where id_cliente = idCliente;
    return nomeCliente;
end //
delimiter ;

-- usar a função em uma Consulta
select BuscaClienteNome(76);


-- funçao para calcular o total de vendas de um produto
Delimiter //
	create function TotalVendas(produtoID int)
    returns decimal(10,2)
    reads sql data
    begin
		declare total decimal(10,2);
        select sum(preco*quantidade) into total
        from pedido
        join produto on produto.id_produto = pedido.id_produto
        where produto.id_produto=produtoID;
        return total;
	end //
Delimiter ;

select nome, TotalVendas(id_produto) as total_vendas from produto;

-- funçaõ para classificar o desempenho de vendas de um produto
dELIMITER //
	create function ClassificaDesempenhoVendas (produtoID int)
    returns varchar(200) 
    reads sql data
    begin
		declare totalVendas decimal(10,2);
        declare desempenho varchar(100);
        
        select coalesce(sum(p.preco*pe.quantidade),0) into totalVendas
        from produto p
        left join pedido pe on p.id_produto=pe.id_produto
        where p.id_produto=produtoID;
        
        set desempenho=
			case
				when totalVendas = 0 then 'sem vendas'
                when totalVendas <=1000 then 'baixo'
                when totalVendas <=5000 then 'medio'
                else 'alto'
            end ;
		return desempenho;
    end //
dELIMITER ;
drop function ClassificaDesempenhoVendas;

select nome, ClassificaDesempenhoVendas(id_produto) as desempenho_vendas from produto;

-- função para calcular desconto em cima de um valro de produto

delimiter //
	create function CalculaDesconto(valor decimal(10,2), percentualDesconto decimal(5,2))
    returns decimal(10,2)
    no sql
    begin
		declare resultado decimal(10,2);
        set resultado = valor-(valor*(percentualDesconto/100));
        return resultado;
     end //
delimiter ;

select CalculaDesconto(150.00, 5) as ValorComDesconto;

-- mostar todas as funções
show function status;

-- deletar função
drop function CalculaDesconto;