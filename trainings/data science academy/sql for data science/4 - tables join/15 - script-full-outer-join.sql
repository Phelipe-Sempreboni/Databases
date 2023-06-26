------------------------------------------------------------------------------------------------------------------------------ #

-- Full Outer Join:

-- Este é um comando implementado pelo padrão ANSI, porém, alguns SGDBs não implementam essa junção.

-- Este é o caso do MySQL, que não implementa essa função. E agora, como fazer ?

-- Uma das alternativas é utilizar a query depois dessa abaixo, que utiliza o (LEFT, RIGHT e UNION) para simular e chegar ao resultado de uma (FULL OUTER JOIN).

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

FULL OUTER JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente;

------------------------------------------------------------------------------------------------------------------------------ #

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

------------------------------------------------------------------------------------------------------------------------------ #