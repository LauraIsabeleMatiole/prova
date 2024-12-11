-- 1
select nome, email from clientes;

-- 2
select nome_produto, preco from produtos
where categoria = 'Eletrônicos';

-- 3
select nome, email from clientes
where nome like 'J%';

-- 4
select nome_produto, preco from produtos
where preco>500
order by preco asc;

-- 5
select sum(valor_total), data_venda from vendas 
where data_venda between "2024-11-01" and  "2024-11-30"
group by id_venda
order by data_venda asc;

-- 6 
select  vendas.id_venda, sum(valor_total), sum(itensvenda.quantidade) as quantidade
from vendas

inner join itensvenda
on vendas.id_venda = itensvenda.id_venda

group by id_venda;

-- 7 
select
clientes.nome, produtos.nome_produto, itensvenda.quantidade from vendas
inner join clientes
on vendas.id_cliente = clientes.id_cliente

inner join produtos
on vendas.id_venda = produtos.id_produto

inner join itensvenda
on vendas.id_venda = itensvenda.id_venda;

-- 8

select clientes.nome, vendas.id_cliente, id_venda, valor_total from vendas
left join clientes
on vendas.id_cliente   = clientes.id_cliente;

-- 9
select produtos.nome_produto, produtos.preco, vendas.valor_total from produtos
inner join vendas
on produtos.id_produto = vendas.id_venda
order by valor_total desc limit 1;

-- 10
select sum(vendas.valor_total) , clientes.nome from vendas

inner join clientes
on vendas.id_cliente = clientes.id_cliente
where valor_total>1000
group by id_venda;



-- 11
insert into 
clientes(nome, email, data_nascimento, endereco) 
values('Carlos Silva','carlos.silva@email.com', '1990-05-15', 'Rua dos Exemplos, 123');

-- 12
update produtos
set preco = 299
where id_produto = 3;

select*from produtos;

-- 13
delete from vendas
where id_venda = 5;

-- 14
delimiter //
create procedure ListarVendasClientes_storedprocedure(id_cliente int)
begin
select id_cliente, id_venda, data_venda, valor_total from vendas;
end //
delimiter ;
call ListarVendasClientes_storedprocedure
-- 15
delimiter //
create function ObterTotalComprasCliente(id_cliente int)
returns(varchar (100))
begin
select clientes.nome, clientes.id_cliente, vendas.valor_total from clientes
innver join vendas
on clientes.id_cliente = vendas.id_cliente;
end //
delimiter ;