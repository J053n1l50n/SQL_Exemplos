/*procedimentos armazernados, usar quando não necessita de valor,usar quando uma tarefa tiver mais intruções de SQL*/

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;

-- procedimento armazenado para listar todos os clientes
create procedure ListarClientes()
	select * from cliente;
    
-- chamar o procedimento
call ListarClientes();

-- procedimento armazenado para inserir um novo pedido
/* comando para alterar o delimitador(;) de um comando, normalmente é usado quando tem dois ou mais comandos sejam executados sem encerrar a operação,
por isso ocorre a troca do sinal do delimitador, no exemplo abaixo por //
 todavia é necessario "fecha-lo" para o delimitador original retorne a ser (;) */
DELIMITER // 
CREATE PROCEDURE AdicionarPedido(in pedidoID int, in clienteID int, in produtoID int, in qtd int, in dataPedido date)
begin -- quando for usar os dois ou mais comandos
	insert into pedido(id_pedido, id_cliente, id_produto, quantidade, data) values (pedidoID, clienteID, produtoID, qtd, dataPedido);
    insert into backup_pedido(ID_Pedido, ID_Cliente, ID_Produto, Quantidade, Data) values (pedidoID, clienteID, produtoID, qtd, dataPedido);
end //
DELIMITER ;
--  para retornar o delimitador ao original é necessario fazer o procedimento acima
CALL AdicionarPedido(201, 1, 2, 10, '2024-03-01'); -- adicionar informação manualmente

select * from pedido where id_pedido =201;
select * from backup_pedido where ID_Pedido =201;

 -- procedimento armazenado para visualizar novos preços sem alterar a tabela produto e visualizar a quantidade de registros
 DELIMITER //
 create procedure PromocaoProdutos(in desconto float,  out totalProdutos int)
	begin
		declare fator_desconto float;
        set fator_desconto = (1-(desconto/100));
        
        select count(*) into totalProdutos -- into: armazenar na variavel
        from produto;
        
        select id_produto, nome, preco as preco_original, round(preco * fator_desconto,2) as preco_com_desconto
        from produto;
    end //
DELIMITER ;

call PromocaoProdutos(5, @totalProdutos);
-- quando é uma variavel de saida(out) é obrigatorio colocar o @ antes
select @totalProdutos as total_produtos_alterados;

-- Mostrar todos os procedimentos
show procedure status;

-- deletar procedimento
drop procedure if exists AdicionarPedido;