------------------------------------------------------------------------------------------------------------------ #

-- Script para unificar dados de tabelas. 

-- Notas importantes:

-- O (UNION ALL) retorna todos os registros das duas querys, ou seja, se uma tiver (10 registros) e a outra tiver (15 registros), irá retornar (25 registros), indepdente se são registros duplicados ou não.

-- O (UNION) retorna somente registros distintos, ou seja, o comando não duplica os registros e traz somente registros únicos, ou seja, retirar as duplicidades.

-- Para que o (UNION ALL ou UNION) funcione, é necessário que as querys possuam a mesma QUANTIDADE de campos, ou seja, não precisa ser o mesmo nome, mas sim a mesma quantidade de campos.

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

-- Utilizando LEFT para chegar a determinado resultado.
-- Aqui trazemos todos os dados da tabela da esquerda.
LEFT JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente

-- União de tabelas e atributos.
UNION 

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

-- Utilizando RIGHT para chegar a determinado resultado.
-- Aqui trazemos todos os dados da tabela da direta.
RIGHT JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente;

------------------------------------------------------------------------------------------------------------------ #

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

-- Utilizando LEFT para chegar a determinado resultado.
-- Aqui trazemos todos os dados da tabela da esquerda.
LEFT JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente

-- União de tabelas e atributos.
UNION ALL

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

-- Utilizando RIGHT para chegar a determinado resultado.
-- Aqui trazemos todos os dados da tabela da direta.
RIGHT JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente;

------------------------------------------------------------------------------------------------------------------ #