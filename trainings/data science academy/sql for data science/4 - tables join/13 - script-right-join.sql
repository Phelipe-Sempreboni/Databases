# -------------------------------------------------------------------------------------------------------------------------------------- #

SELECT * FROM dsa_module_four.tb_clientes;

SELECT * FROM dsa_module_four.tb_pedidos;

SELECT * FROM dsa_module_four.tb_vendedor;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar o ID do pedido e nome do cliente
# Inner Join
# Modo convencional

# Notar que aqui só veremos resultados de clientes que possuem um pedido atrelado.
# Não será possível ver todos os clientes, independente de tem um pedido atrelado ou não.
# Isso ocorre, pois nessa query estamos utilizando o (INNER JOIN).

# Notar que a ordem das tabelas tem grande influência no retorno dos resultados.

SELECT 
	 A.id_pedido
    ,B.nome_cliente

FROM dsa_module_four.tb_pedidos AS A

INNER JOIN dsa_module_four.tb_clientes AS B ON A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar todos os clientes, com ou sem pedidos associados.
# Left Join
# Modo convencional

# Notar que aqui veremos todos os resultados de clientes que possuem ou não um pedido atrelado.
# Isso é possível, ou seja, ver todos os clientes, pois utilizamos o (LEFT JOIN) e alteramos ordem das tabelas.

# Notar que a ordem das tabelas tem grande influência no retorno dos resultados.

# O (LEFT JOIN) indica que queremos todos os dados da tabela da esquerda, mesmo sem nenhum correspondente na tabela da direita.

SELECT
	 A.nome_cliente
    ,B.id_pedido

FROM dsa_module_four.tb_clientes AS A

LEFT JOIN dsa_module_four.tb_pedidos AS B ON A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar todos os clientes, com ou sem pedidos associados.
# Right Join
# Modo convencional

# Notar que aqui veremos todos os resultados de clientes que possuem ou não um pedido atrelado.
# Isso é possível, ou seja, ver todos os clientes, pois utilizamos o (RIGHT JOIN).
# Notar que neste caso estamos indicando que queremos visualizar todos os dados da tabela da direita.

# Notar que a ordem das tabelas tem grande influência no retorno dos resultados.

# O (RIGHT JOIN) indica que queremos todos os dados da tabela da direita, mesmo sem nenhum correspondente na tabela da esquerda.

SELECT
	 B.nome_cliente
	,A.id_pedido


FROM dsa_module_four.tb_pedidos AS A

RIGHT JOIN dsa_module_four.tb_clientes AS B ON A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #
