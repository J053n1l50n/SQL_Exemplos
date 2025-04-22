/* if e Case*/

use informatica;

select * from cliente;

select nome, if (limite_credito >6000, "alto","baixo") as categoria_limite from cliente; -- virgula no if é o então, quando é uma condição simples e direta

select 
	nome, 
    limite_credito,
		case
			when limite_credito > 6000 then 'alto'
            else 'baixo'
		end as categoria_limite
	from cliente;-- caso for validar varias condicionais
    
select id_cliente, nome, limite_credito, if(limite_credito> 9000, 'premium', if (limite_credito between 5000 and 9000, 'gold', 'baixo')) as categoria_limite from cliente;

select id_cliente, nome,limite_credito,
	case	
		when limite_credito >9000 then 'premium'
        when limite_credito between 5000 and 9000 then 'gold'
        else "silver"
	end as categoria_limite
from cliente;
        