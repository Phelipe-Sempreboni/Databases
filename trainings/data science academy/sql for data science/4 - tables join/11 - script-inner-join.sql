# -------------------------------------------------------------------------------------------------------------------------------------- #

SELECT * FROM dsa_module_four.tb_clientes;

SELECT * FROM dsa_module_four.tb_pedidos;

SELECT * FROM dsa_module_four.tb_vendedor;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# 1º método para fazer um INNER JOIN.
# Retornar o ID do pedido e o nome do cliente.

SELECT 
	 A.id_pedido
    ,B.nome_cliente

FROM dsa_module_four.tb_pedidos AS A

INNER JOIN dsa_module_four.tb_clientes AS B ON A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# 2º método para fazer um INNER JOIN.
# Nesse caso comparamos somente com um WHERE, ou seja, se houve a incidência do ID em ambas tabelas, o resultado será exibido.
# Esse método é a mesma coisa que realizar um INNER JOIN.
# Retornar o ID do pedido e o nome do cliente.

SELECT 
	 A.id_pedido
    ,B.nome_cliente

FROM dsa_module_four.tb_pedidos AS A, dsa_module_four.tb_clientes AS B

WHERE A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar o ID do pedido, nome do cliente e nome do vendedor.
# INNER JOIN com 3 tabelas.
# Utilizando o modelo de WHERE.

SELECT 
	 A.id_pedido
    ,B.nome_cliente
    ,C.nome_vendedor

FROM dsa_module_four.tb_pedidos AS A, dsa_module_four.tb_clientes AS B, dsa_module_four.tb_vendedor AS C

WHERE A.id_cliente = B.id_cliente 

AND A.id_vendedor = C.id_vendedor;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar o ID do pedido, nome do cliente e nome do vendedor.
# INNER JOIN com 3 tabelas.
# Utilizando o modelo de INNER JOIN.

SELECT 
	 A.id_pedido
    ,B.nome_cliente
    ,C.nome_vendedor

FROM dsa_module_four.tb_pedidos AS A

INNER JOIN dsa_module_four.tb_clientes AS B ON A.id_cliente = B.id_cliente

INNER JOIN dsa_module_four.tb_vendedor AS C ON A.id_vendedor = C.id_vendedor;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Notar que se você utilizar na sua query o (INNER JOIN) ou somente (JOIN), isso significa que você está utilizando um (INNER JOIN), então o SGBD entende o (JOIN) como uma abreviação para a consulta SQL.

SELECT
   A.id_pedido
  ,B.nome_cliente

FROM dsa_module_four.tb_pedidos AS A

JOIN dsa_module_four.tb_clientes AS B ON A.id_cliente = B.id_cliente;

# -------------------------------------------------------------------------------------------------------------------------------------- #

# Se no relacionamento que você estiver fazendo os campos relacionados forem iguais, por exemplo, o termo (A.id_cliente = B.id_cliente), então você pode utilizar o comando (USING id_cliente), lembrando que o nome das colunas precisam ser iguais.

SELECT
   A.id_pedido
  ,B.nome_cliente

FROM dsa_module_four.tb_pedidos AS A

INNER JOIN dsa_module_four.tb_clientes AS B USING (id_cliente);

# -------------------------------------------------------------------------------------------------------------------------------------- #