use restaurante;
-- item 2:  procurar os funcionarios cujo id é 4 e Status é pendente
select * from pedidos
where id_funcionarios = 4 and Estatus="Pendente";
-- item 3: ver os pedidos não concluidos
select * from pedidos
where Estatus<>'Concluído';
-- item 4: ver os pedidos dos Ids de produtos((1,3,5,7 e 8)
Select * from pedidos
where id_produto in (1,3,5,7,8);
-- Item 5: procurar clientes com nome que começa com C
select * from clientes where nome like 'c%';
-- Item 6: procurar carne ou frango nos ingredientes
select ingredientes from info_produtos where ingredientes like 'carne%' or ingredientes like 'frango%'; 
-- Item7:Procurar pedidos com preços entre 20 e 30
select* from produtos where preço between 20 and 30;
-- Item 8: atualizar o Status do Id_Pedido para nulo
update pedidos
set Estatus= null where id_pedido=6;
select* from pedidos;
-- Item 9: selecionar pedidos nulos
select * from pedidos where Estatus is null;
-- Item10: Ver pedidos nulos, mas como pedidos cancelados
select id_pedido, Estatus, ifnull(Estatus, "Cancelado") as Statusi from pedidos;
-- Item 11: Ver se o salario esta acima ou abaixo da media .
select nome, cargo, salario,
	case
     when salario > 3000 then 'Acima da media'
     when salario = 3000 then 'A Media'
     else 'Abaixo da media'
	end as Media_Salario
from funcionarios;